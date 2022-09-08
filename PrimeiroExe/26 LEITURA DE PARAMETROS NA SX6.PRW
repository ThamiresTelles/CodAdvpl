#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//--------------------------------------------------------------------------------------------------
// GETMV
// executa a leitura de cadastro de parametros na tabela SX6
//--------------------------------------------------------------------------------------------------
USER FUNCTION XGETMV1()
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"
// realiza a pesquisa na SX6 (eu tenho certeza que os parametros existem)
   cVAR1 := GETMV("MV_X001") // retorna o conteudo do UNICO parametro cadastrado na SX6
   cVAR2 := GETMV("MV_X002") // retorna o conteudo do parametro cadastrado na SX6 de acordo com a filial corrente
   // FILIAL PARAMETRO
   //        MV_X001
   // 01     MV_X002
   // 02     MV_X002
// realiza pesquisa do parametro, caso esse nao exista o GETMV retorna um valor padrao
   cVAR3 := GETMV("MV_X003",,"MARCELO,GUILHERME") // retorna o conteudo do UNICO parametro cadastrado na SX6
// valida se o parametro e existe na SX6
   lEXISTE := GETMV("MV_X004",.T.) // nao estou buscando o conteudo do parametro, apenas confirmando se existe
   IF lEXISTE = .F. 
      MSGINFO("Parametro MV_X004 nao cadastrado")  
      RETURN
   ENDIF
   // ...
RETURN


//--------------------------------------------------------------------------------------------------
// GETMV
// executa a leitura de cadastro de parametros na tabela SX6
//--------------------------------------------------------------------------------------------------
USER FUNCTION XGETMV2()
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" USER "ADMIN" PASSWORD "" 
// busca quais sao os usuarios que ter premisao para execucao funcao corrente
cVAR := GETMV("MV_X003",,"marcelo,GUILHERME") 
/*
IF .NOT. UPPER(cUSERNAME) $ UPPER(cVAR)
   MsgInfo("USUARIO SEM PERMISAO","PERM")
   RETURN
ENDIF
*/
IF (UPPER(cUSERNAME) $ UPPER(cVAR)) = .F.
   MsgInfo("USUARIO SEM PERMISAO","PERM")
   RETURN
ENDIF
// ...
RETURN



//--------------------------------------------------------------------------------------------------
// GETMV
// executa a leitura de cadastro de parametros na tabela SX6
//--------------------------------------------------------------------------------------------------
USER FUNCTION XGETMV3()
   // FILIAL PARAMETRO
   // 01     MV_X002
   // 02     MV_X002
// vc estando logado na filial "01" pode buscar conteudo de parametro na filial "02"   
cVAR := SuperGetMV("MV_X001",/*se deseja confirmar se param existe*/,/*valor padrao*/,"02")
RETURN




//--------------------------------------------------------------------------------------------------
// PUTMV
// altera o conteudo de um parametro
//--------------------------------------------------------------------------------------------------
USER FUNCTION XPUTMV()
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" USER "ADMIN" PASSWORD "" 
IF GETMV("MV_ESTNEG",.T.) = .T.
   PUTMV("MV_ESTNEG","S")
   PUTMV("MV_ESTNEG","N")
ENDIF 
RETURN


//--------------------------------------------------------------------------------------------------
// PUTMVFIL
// altera o conteudo de um parametro na filial informada
//--------------------------------------------------------------------------------------------------
USER FUNCTION XPUTMVFI()
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" USER "ADMIN" PASSWORD "" 
IF SUPERGETMV("MV_ESTNEG",.T.,,"02") = .T.
   PUTMVFIL("MV_ESTNEG","S","02")
   PUTMVFIL("MV_ESTNEG","N","02")
ENDIF 
RETURN











