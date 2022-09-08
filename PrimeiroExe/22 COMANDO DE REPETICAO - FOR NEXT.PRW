#INCLUDE "PROTHEUS.CH"

//------------------------------------------------------------------------------------------------
// comando de repeticao FOR.. NEXT
// apresentando MSGINFO a cada execucao
//------------------------------------------------------------------------------------------------
USER FUNCTION REPET1()
LOCAL nI
aLISTA := {"A","B","C","D"}
/*
MSGINFO(aLISTA[1])
MSGINFO(aLISTA[2])
MSGINFO(aLISTA[3])
MSGINFO(aLISTA[1]+" "+aLISTA[2]+" "+aLISTA[3])
*/
FOR nI:=1 TO LEN(aLISTA) //4  
   MSGINFO(aLISTA[nI])
NEXT
RETURN 

//------------------------------------------------------------------------------------------------
// comando de repeticao FOR.. NEXT
// apresentando MSGINFO no final das execucoes
//------------------------------------------------------------------------------------------------
USER FUNCTION REPET2()
LOCAL nI
aLISTA := {"A","B","C","D","J","Z","X"}
cMSG   := ""
FOR nI:=1 TO LEN(aLISTA) 
   cMSG += aLISTA[nI]
NEXT
MSGINFO(cMSG,"TIT")
RETURN 

//------------------------------------------------------------------------------------------------
// comando de repeticao FOR.. NEXT
// apresentando MSGINFO no final das execucoes
// POREM ignorando algums elementos ===> uso do comando LOOP
//------------------------------------------------------------------------------------------------
USER FUNCTION REPET3()
LOCAL nI
aLISTA := {"A","B","C","D","J","Z","X"}
cMSG   := ""
FOR nI:=1 TO LEN(aLISTA) 
// IF aLISTA[nI] $ "CJ"
   
   IF aLISTA[nI]=="C" .OR. aLISTA[nI]=="J"
      LOOP // forca o retorno para o inicio do comando FOR, ignorando as linhas abaixo
   ENDIF   

   cMSG += aLISTA[nI]
NEXT
MSGINFO(cMSG,"TIT")
RETURN 

//------------------------------------------------------------------------------------------------
// comando de repeticao FOR.. NEXT
// apresentando MSGINFO no final das execucoes
// POREM ignorando algums elementos ===> uso do comando EXIT
//------------------------------------------------------------------------------------------------
USER FUNCTION REPET4()
LOCAL nI
aLISTA := {"A","B","C","D","J","Z","X"}
cMSG   := ""
FOR nI:=1 TO LEN(aLISTA) 
// IF aLISTA[nI] $ "CJ"
   IF aLISTA[nI]=="C" .OR. aLISTA[nI]=="J"
      EXIT // encerra a execucao do FOR
   ENDIF   
   cMSG += aLISTA[nI]
NEXT
MSGINFO(cMSG,"TIT")
RETURN 


//------------------------------------------------------------------------------------------------
// comando de repeticao FOR.. NEXT
// apresentando MSGINFO no final das execucoes
// saltando de N em N
//------------------------------------------------------------------------------------------------
USER FUNCTION REPET5()
LOCAL nI
aLISTA := {"A","B","C","D","J","Z","X"}
cMSG   := ""
FOR nI:=1 TO LEN(aLISTA) STEP 2
   cMSG += aLISTA[nI]
NEXT
MSGINFO(cMSG,"TIT")
RETURN 


