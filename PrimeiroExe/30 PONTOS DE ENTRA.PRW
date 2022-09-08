#INCLUDE "PROTHEUS.CH"

/* IF .NOT. cUSERNAME $ GETMV("MV_XXXX")
      cFILTRO := "SA1->A1_XGRUPO <> 'ESPECIAL'"
ENDIF*/

//---------------------------------------------------------------------------------------
// ponto de entrada utilizado para "ativar filtro no browse" do cad de vendedores
// filtro ativado no browse
//---------------------------------------------------------------------------------------
USER FUNCTION MA040BRW()
LOCAL cFILTRO := ""
IF cFILANT="01"
   cFILTRO := "A3_EST = 'SP'"
ELSEIF cFILANT="02"   
   cFILTRO := "A3_EST = 'RJ'"
ENDIF
RETURN cFILTRO 


//---------------------------------------------------------------------------------------
// valida os dados digitados no cad de vendedor
// executado apos usuario clicar em "SALVAR"
//---------------------------------------------------------------------------------------
USER FUNCTION MA040TOK()
LOCAL lRET := .T.
IF cFILANT="01"
   IF EMPTY( M->A3_EMAIL ) 
      MSGINFO("obrig infomar e-mail para sp"+CRLF+CRLF+"MA040TOK","Totvs")
      lRET := .F.
   ENDIF   
ENDIF
RETURN lRET



//---------------------------------------------------------------------------------------
// ponto de entrada utilizado para INCLUIR OPC CUSTOMIZADA me outras acoes
//---------------------------------------------------------------------------------------
USER FUNCTION MA040BUT()
   LOCAL aRETORNO := {}
   //                  ===  ================   ==========
   AADD( aRETORNO , {  NIL, {|| U_M040C1() } , "Opcao 1" } )
   AADD( aRETORNO , {  NIL, {|| U_M040C2() } , "Opcao 2" } )
   //               ======================================
   IF cUSERNAME $ GETMV("MV_XXXX",,"MARCELO")
      AADD( aRETORNO ,{  NIL, {|| U_M040C3() } , "Opcao 3" } )
   ENDIF 
RETURN aRETORNO

USER FUNCTION M040C1() 
   ALERT("VC ACESSOU A OPC 1")
RETURN

USER FUNCTION M040C2() 
   ALERT("VC ACESSOU A OPC 2")
RETURN

USER FUNCTION M040C3() 
   ALERT("VC ACESSOU A OPC 3")
RETURN


//------------------------------------------------------------------------------------
// PONTO DE ENTRADA utilizado para incluir opc customizadas em OUTROS ACOES do browse
//------------------------------------------------------------------------------------
USER FUNCTION MTA040MNU()

aAdd(aRotina,{ "Opcao&1 ",;  // 1.Nome a aparecer p/usuario LABEL
               "U_M040C1()",; // 2.Nome da Rotina associada    
               0,;            // 3.Reservado                        
               1,;            // 4.Tipo de Transacao a ser efetuada
               0,;            // 5.Nivel de acesso
               .T.;           // 6.Habilita Menu Funcional ??
               })           

aAdd(aRotina,{ "Opcao&2 ",;  // 1.Nome a aparecer p/usuario LABEL
               "U_M040C2()",; // 2.Nome da Rotina associada    
               0,;            // 3.Reservado                        
               1,;            // 4.Tipo de Transacao a ser efetuada
               0,;            // 5.Nivel de acesso
               .F.;           // 6.Habilita Menu Funcional ??
               })           

RETURN // nao precisa retornar conteudo aqui, pois as opc que vc incluir serao incluidas na
       // variavel PRIVATE aROTINA
                              /*
                              4. Tipo de Transacao a ser efetuada
                                 1 - Pesquisa e Posiciona em uma tabela  
                                     Informnado 1, o sistema realizou a pesquisa, encontrou
                                     o registro e manteve posicao    
                                 2 - Simplesmente Mostra os Campos                  
                                     Informando 2, o sistema achou o produto, disponibiliza
                                     seus campos, porem assim que a rotina eh finalizada 
                                     quanto mostra o browse retorna na posicao original  
                                 3 - Inclui registros no Bancos de Dados            
                                 4 - Altera o registro corrente                     
                                 5 - Remove o registro corrente do Banco de Dados 
                              */


//------------------------------------------------------------------------------------
// ponto de entrada que valida linha do pedido de venda
//------------------------------------------------------------------------------------
User Function M410LIOK()
LOCAL lRET := .T. 
LOCAL nPOSQUANT := 0 // usada para gravar o num da coluna do campo C6_QTDVEN
nPOSQUANT := ASCAN( aHEADER , {|X| X[2]="C6_QTDVEN" })
nPOSPRC   := ASCAN( aHEADER , {|X| X[2]="C6_PRCVEN" })

/*
aHEADER := { {"ITEM"   ,"C6_ITEM"  ,...} ,; // ELEMENTO 1
            {"ARMAZEM","C6_LOCAL" ,...} ,; // ELEMENTO 2
            {"DT ENTR","C6_DTENT" ,...} ,; // ELEMENTO 3
            {"PRODUTO","C6_PRODUTO"   ,...} ,; // ELEMENTO 4
            {"DESC   ","C6_DESC  ",...} ,; // ELEMENTO 5
            {"UM     ","C6_UM    ",...} ,; // ELEMENTO 6
            {"QUANT  ","C6_QTDVEN",...} ,; // ELEMENTO 7 <<<
            {"PR UNIT","C6_PRC"   ,...} ,; // ELEMENTO 8
*/

IF nPOSQUANT > 0
    IF aCOLS[ N , nPOSQUANT ] > 50
       MSGINFO("ERRO ultrapassou quant maximo")
       lRET := .F.
    ENDIF
ENDIF

IF nPOSPRC > 0
    IF aCOLS[ N , nPOSPRC ] > 1000
       MSGINFO("PRECO INVALIDO")
       lRET := .F.
    ENDIF
ENDIF

RETURN lRET



//------------------------------------------------------------------------------------
// pontos de entrada para nomear os modulos especificos 96 97 e 98
//------------------------------------------------------------------------------------

USER FUNCTION ESPNOME()
RETURN "Agricola"

USER FUNCTION ESP1NOME()
RETURN "Recebimento"

USER FUNCTION ESP2NOME()
RETURN "Testex"

