#INCLUDE "PROTHEUS.CH"

//------------------------------------------------------------------------------------------------
// FUNCAO SIMPLES QUE SERA CONVERTIDA PARA BLOCO DE CODIGO
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO1()
nVALVENDA := AUX1()
RETURN
      STATIC FUNCTION AUX1()
      nQUANT := 10
      nUNIT  := 5
      nTOTAL := nQUANT * nUNIT
      MsgInfo("TESTE", "TIT")
      RETURN nTOTAL
//------------------------------------------------------------------------------------------------
// CONVERTANDO A FUNCAO ACIMA PARA BLOCO DE CODIGO
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO2()
//bBLOCO := {|| nQUANT:=10 , nUNIT:=5 ,  nTOTAL:=nQUANT*nUNIT , MsgInfo("TESTE","TIT") , nTOTAL }
bBLOCO := {|| nQUANT:=10 , nUNIT:=5 ,  nQUANT*nUNIT }
nVALVENDA := EVAL(bBLOCO)
RETURN





//------------------------------------------------------------------------------------------------
// FUNCAO SIMPLES QUE SERA CONVERTIDA PARA BLOCO DE CODIGO
// ESSE EXEMPLO COM PASSAGEM DE PARAMETROS
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO3()
nVALVENDA := AUX2( 3 , 2.50 )
RETURN
      STATIC FUNCTION AUX2(nQUANT,nUNIT)
      nTOTAL := nQUANT * nUNIT
      RETURN nTOTAL
//------------------------------------------------------------------------------------------------
// CONVERTANDO A FUNCAO ACIMA PARA BLOCO DE CODIGO
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO4()
cEST := "MS"
IF cEST="SP"
   bBLOCO := { |nQUANT,nUNIT| nTOTAL:=nQUANT*nUNIT , nTOTAL }
ELSEIF cEST="MS"   
   bBLOCO := { |nQUANT,nUNIT| nTOTAL:=nQUANT*nUNIT+1 , nTOTAL }
ENDIF
nVALVENDA := EVAL( bBLOCO , 3 , 2.50 )
RETURN






//------------------------------------------------------------------------------------------------
// FUNCAO SIMPLES QUE SERA CONVERTIDA PARA BLOCO DE CODIGO
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO5()
LOCAL nCONTROLE
aLISTA := {"A","B"}
   FOR nCONTROLE:=1 TO 2
      cCONTEUDO := aLISTA[nCONTROLE]
      MSGINFO(cCONTEUDO+" "+CVALTOCHAR(nCONTROLE))
   NEXT
RETURN
//------------------------------------------------------------------------------------------------
// CONVERTANDO A FUNCAO ACIMA PARA BLOCO DE CODIGO --> SUBSTITUINDO COMANDO FOR
//------------------------------------------------------------------------------------------------
USER FUNCTION BLOCO6()
aLISTA := {"A","B"}
bACAO  := { |cCONTEUDO,nCONTROLE| ALERT(cCONTEUDO+" "+CVALTOCHAR(nCONTROLE)) }
//          ===================== ==========================================
AEVAL(aLISTA,bACAO)
RETURN
