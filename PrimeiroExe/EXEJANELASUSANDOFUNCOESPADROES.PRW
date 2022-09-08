#INCLUDE "PROTHEUS.CH"

//---------------------------------------------------------------------------------------------------
// janela de aviso
//---------------------------------------------------------------------------------------------------
USER FUNCTION XJANELA1()
LOCAL cMSG 

MSGINFO("Texto","Titulo")

cMSG := "EXECAUTO"+CRLF
cMSG += "AXCADASTRO"+CRLF
cMSG += "MBROWSE"+CRLF
cMSG += "MODELO 2"+CRLF
cMSG += "MODELO 3"
MSGINFO( cMSG ,"Titulo")

ALERT("Msg de erro"+CRLF+"linha2") 

MSGALERT("Msgalert","tit")


RETURN

//---------------------------------------------------------------------------------------------------
// janela de aviso com pergunta
//---------------------------------------------------------------------------------------------------
USER FUNCTION XJANELA2()
LOCAL lRET
lRET := MSGYESNO("Pergunta ?"+CRLF+"linha2","Titulo")
//lRET = .T. //se usuario clicar em OK
lRET = .F. //se usuario clicar em CANCELAR
RETURN



//---------------------------------------------------------------------------------------------------
// janela de aviso com pergunta
//---------------------------------------------------------------------------------------------------
USER FUNCTION XJANELA3()
AUTOGRLOG("Linha 1")
AUTOGRLOG("Linha 2")
AUTOGRLOG("Linha 3")
AUTOGRLOG("Linha 4")
//MOSTRAERRO("C:\TEMP")
MOSTRAERRO()
RETURN 

