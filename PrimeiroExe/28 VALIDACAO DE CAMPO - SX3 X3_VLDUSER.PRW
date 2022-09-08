#INCLUDE "PROTHEUS.CH"

/*
Exemplo de validacoes no campo SA1->A1_COMIS
variavel de memoria --> M->A1_COMIS
onde configurar: SX3 --> X3_VLDUSER // campo para incluir validacao customizada

teste validacao 1 // expressao pura
  Positivo() .AND. IF( M->A1_COMIS > 5 , .F. , .T. )

teste validacao 2 // bloco de codigo 
  Positivo() .AND. EVAL( {|| lRET:=IF(M->A1_COMIS>5,.F.,.T.) , IF(lRET=.F.,MSGINFO("MSG DE ERRO"),NIL) , lRET  })

teste validacao 3 // user function 
  Positivo() .AND. U_VLDA1COM()
*/
USER FUNCTION VLDA1COM()
LOCAL lRET := .T.
IF M->A1_COMIS > 5  // GETMV("MV_XXXXX")
	MSGINFO("MSG DE ERRO")
	lRET := .F.
ENDIF	
RETURN lRET

