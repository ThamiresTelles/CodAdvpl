#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH" // especifico para usar "PREPARE ENVIRONMENT" no fonte

USER FUNCTION FUNCDIV()
cAMB :=  GETENVSERVER()
CONOUT("-----------------------------"+TIME())
cFUNCAO := FUNNAME()
AUX1()
X := GetsrvProfString("formPath")
RETURN

STATIC FUNCTION AUX1()
cFUNCAO1 := FUNNAME()
cFUNCAO2 := FUNNAME(1)
RETURN

//----------------------------------------------------------------------------
// funcao conecta no protheus e permite o acesso ao banco de dados
//----------------------------------------------------------------------------
USER FUNCTION CONECTA()
RPCCLEARENV() // forca desconexao
RPCSETTYPE(3)
RPCSETENV("99","01","ADMIN","","FAT",/*FUNNAME()*/,{"SA1","SE1"})
// apenas empresa/filial sao obrigatorios
RETURN

//----------------------------------------------------------------------------
// funcao conecta no protheus e permite o acesso ao banco de dados
//----------------------------------------------------------------------------
USER FUNCTION CONECTA2()
RPCCLEARENV() // forca desconexao
RPCSETTYPE(3)
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" USER "ADMIN" PASSWORD "" ;
MODULO "FAT" TABLES "SE1","SA1"
MSGINFO(SA1->A1_NOME)
RETURN

//----------------------------------------------------------------------------
// funcao conecta no protheus e permite o acesso ao banco de dados
//----------------------------------------------------------------------------
USER FUNCTION COPIAARQ()

// copia arquivo do servidor para computador do usuario
   lOK1 := CPYS2T( "\temp\xx1.txt" , "c:\temp_local\" )

// copia arq do computador para o servidor
   lOK1 := CPYT2S( "C:\temp_local\sc000990.log" , "\" )

RETURN
