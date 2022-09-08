//------------------------------------------------------------------------------------
// exemplo de uso da funcao IF() substituindo as intrucoes IF.. ELSEIF.. ENDIF
//------------------------------------------------------------------------------------

USER FUNCTION PROGR1()
LOCAL lEXIST
LOCAL cVAR  := "SAO"
LOCAL cTEM  := "SAO PAULO 15"
IF cVAR $ cTEM 
   lEXIST := .T.
ELSE
   lEXIST := .F.
ENDIF	
//...
RETURN

USER FUNCTION PROG2()
LOCAL lEXIST
LOCAL cVAR  := "SAO"
LOCAL cTEM  := "SAO PAULO 15"
lEXIST := IF( cVAR $ cTEM , .T. , .F. )
// ...
RETURN

//------------------------------------------------------------------------------------
// exemplo de uso da funcao IF() substituindo as intrucoes IF.. ELSEIF.. ENDIF
//------------------------------------------------------------------------------------

USER FUNCTION PROGR3()
LOCAL nALIQ := 0
LOCAL cEST  := "SP"
IF cEST="SP"
   nALIQ = 10
ELSEIF cEST="MG"
   nALIQ = 9
ELSEIF cEST="PR"
   nALIQ = 5
ELSE 
   nALIQ = 7
ENDIF	
RETURN

// nALIQ := IF( cEST="SP",10,IF(cEST="MG",9,IF(cEST="PR",5,7) ) )  



/*--------------------------------------------------------------------
nALIQ := IF( cEST="SP" , 10 , IF(cEST="MG",9,7 )  )
//           ========    ==      ========= = =

IF cEST="SP"
   nALIQ = 10
ELSEIF cEST="MG"
   nALIQ = 9
ELSE 
   nALIQ = 7
ENDIF	
--------------------------------------------------------------------*/



/*--------------------------------------------------------------------
nALIQ := IF( cEST="SP" , 10 , 7 )

IF cEST="SP"
   nALIQ = 10
ELSE 
   nALIQ = 7
ENDIF	
--------------------------------------------------------------------*/




/*---------------------------------------------------------------------

IF(ALLTRIM(SE5->E5_MOTBX)=="SNT","112611400007",IF(ALLTRIM(SE5->E5_MOTBX)=="REC","330011100156",IF(ALLTRIM(SE2->E2_TIPO) $ ("FOL/FIS/TX/PGM/PGF"),SED->ED_CREDIT,SA2->A2_CONTA)))  


USER FUNCTION FUNCAO()
cCONTA := ""

IF ALLTRIM(SE5->E5_MOTBX)=="SNT"
   cCONTA := "112611400007"
	
ELSEIF ALLTRIM(SE5->E5_MOTBX)=="REC"
   cCONTA := "330011100156"
	
ELSEIF ALLTRIM(SE2->E2_TIPO) $ ("FOL/FIS/TX/PGM/PGF")
   cCONTA := SED->ED_CREDIT
	
ELSE
	cCONTA := SA2->A2_CONTA
ENDIF	

RETURN cCONTA

---------------------------------------------------------------------*/

