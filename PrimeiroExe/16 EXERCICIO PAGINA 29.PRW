#INCLUDE "PROTHEUS.CH"

USER FUNCTION EPAG291()
SET DATE BRIT
LOCAL nTOTALVENDA := 1786.11
LOCAL dHOJE       := DATE() // CTOD("25/08/2022")
LOCAL cMSG        := "" // NIL

cMSG += "Total de vendas do dia: "
cMSG += DTOC(dHOJE)
cMSG += " foi de: "
cMSG += ALLTRIM(TRANSFORM(nTOTALVENDA,"@E 999,999.99"))
// STR
// CVALTOCHAR
// TRANSFORM

//MSGINFO(cMSG,"Titulo")

MSGINFO("Total de vendas do dia "+CValToChar(dHOJE)+" foi de "+CValToChar(nTOTALVENDA))

RETURN


USER FUNCTION EPAG292()
SET DATE BRIT
LOCAL nBASE := 0 //5000
LOCAL nALIQ := 18
LOCAL nIMP  := 0
LOCAL cMSG  := "", lRET

lRET := MsgGet2("Base de calculo", "Informe base de calculo", @nBASE , "EDITABLE", NIL , "@E 999,999.99" )
        //      titulo             descricao no corpo         variavel  icone     valid  mascara

IF lRET = .F. // user clicou cancelar
   RETURN
ENDIF   

/*
IF MsgGet2("Base de calculo", "Informe base de calculo", @nBASE , "EDITABLE", NIL , "@E 999,999.99" ) =.F.
   RETURN
ENDIF   

IF .NOT. MsgGet2("Base de calculo", "Informe base de calculo", @nBASE , "EDITABLE", NIL , "@E 999,999.99" ) 
   RETURN
ENDIF   
*/

nIMP := nBASE * (nALIQ/100)

cMSG += "Base de calculo: "
cMSG += ALLTRIM(TRANSFORM(nBASE,"@E 999,999.99"))+CRLF
cMSG += "Aliquota "+CVALTOCHAR(nALIQ)+"%"+CRLF
cMSG += "Valor do imposto: "+ALLTRIM(TRANSFORM(nIMP,"@E 999,999.99"))

MSGINFO(cMSG,"TITULO")

RETURN
