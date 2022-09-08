#INCLUDE "PROTHEUS.CH"

//----------------------------------------------------------------------------------------
// EXEMPLO DE USO DO COMANDO IF
//----------------------------------------------------------------------------------------
USER FUNCTION XIF()

   cEST  := "MS"
   nALIQ := 8

   IF cEST = "SP"
      MSGINFO("Estou em SP")
   ENDIF

   IF cEST = "SP"
      MSGINFO("Estou em SP")
   ELSE
      MSGINFO("Estou em outro estado")
   ENDIF 

   IF cEST = "SP"
      MSGINFO("Estou em SP")
   ELSEIF cEST = "MS" .AND. nALIQ=7
      MSGINFO("Estou em MS")
   ELSEIF cEST = "SC"
      MSGINFO("Estou em SC")
   ELSEIF cEST $ "PR,RS" // cEST="PR" .OR. cEST="RS"
      MSGINFO("Estou em RS ou PR")
   ELSE    
      MSGINFO("Estou em outro estado")
   ENDIF

RETURN



//----------------------------------------------------------------------------------------
// EXEMPLO DE USO DO COMANDO IF
//----------------------------------------------------------------------------------------
USER FUNCTION XCASE()

   cEST  := "MS"
   nALIQ := 8

   DO CASE 
      CASE cEST = "SP"
         MSGINFO("Estou em SP")
      CASE cEST = "MS" .AND. nALIQ=7
         MSGINFO("Estou em MS")
      CASE cEST = "SC"
         MSGINFO("Estou em SC")
      CASE cEST $ "PR,RS" // cEST="PR" .OR. cEST="RS"
         MSGINFO("Estou em RS ou PR")
      OTHERWISE
         MSGINFO("Estou em outro estado")
   ENDCASE

RETURN


