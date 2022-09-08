#INCLUDE "PROTHEUS.CH"

USER FUNCTION LEBANCO2()
LOCAL cLINHA
LOCAL cPERG := "LEBANCO2"

// MV_PAR01 - PRODUTO DE ?  "004"
// MV_PAR02 - PRODUTO ATE ? "014"
// MV_PAR03 - TIPO ?        PA

//IF .NOT. PERGUNTE(cPERG,.T.,"Titulo") 
IF PERGUNTE(cPERG,.T.,"Titulo") = .F.
   RETURN
ENDIF

DbSelectArea("SB1")  // cria (quando necessario) e abre a tabela informada
DbSetOrder(1) // B1_filial + B1_COD
dbgotop() // forca o posicinamento no primeiro registro

// XFILIAL("TAB")
// funcao verifica se a tabela informada eh compartilhada ou exclusiva
// - compartilhada -- retorna sempre vazio
// - exclusiva     -- retorna o conteudo da variavel cFILANT 

DBSEEK( XFILIAL("SB1")+MV_PAR01 , .T.)
// pesquisa o registro de acordo com a variavel informada
// informando .T., sera ligado o softseek, onde caso nao encontre o conteudo 
//                 informado, o sistema posiciona no prox registro

// executa a leitura da tabela ate que chegue no final do arquivo EOF()=.T.
WHILE .NOT. EOF() .AND. B1_FILIAL==XFILIAL("SB1")  .AND. B1_COD <= MV_PAR02 
  //  ===========       =========================        ================== 
  
   // ??_MSBLQL = "1" - registro bloqueado
   // ??_MSBLQL = "2" - registro desbloqueado
   // ??_MSBLQL = " " - registro desbloqueado
   IF B1_MSBLQL = "1"  // se o registro corrente esta bloqueado, sera ignorado
      // IMPORTANTE
      // sempre que forem utilizar o LOOP, executem antes o DBSKIP
      // para que o processo foque no prox registro, assim nao ocasionando loop infinito
      DBSKIP() 
      LOOP
   ENDIF   

   // se o campo informado for diferente do conteudo escolhido pelo usr
   // esse sera ignorado
   IF B1_TIPO <> MV_PAR03 
      DBSKIP() 
      LOOP
   ENDIF   

   cLINHA := B1_COD+" "+B1_DESC+" "+B1_TIPO
   AUTOGRLOG(cLINHA)
   DBSKIP() // salta para o proximo registro
ENDDO

MOSTRAERRO()

RETURN



