#INCLUDE "PROTHEUS.CH"

//------------------------------------------------------------------------------------------
// AADD 
// inclui elementos em um array
// 
// I M P O R T A N T E
// 
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAY1()
aLISTA := {}
AADD(aLISTA,"VINI")     // {"VINI"}
AADD(aLISTA,"GUI")      // {"VINI","GUI"}
AADD(aLISTA,"THAMIRES") // {"VINI","GUI","THAMIRES"}
AADD(aLISTA,100)        // {"VINI","GUI","THAMIRES",100}
AADD(aLISTA,.T.)        // {"VINI","GUI","THAMIRES",100,.T.}
RETURN


//------------------------------------------------------------------------------------------
// ARRAY()
// cria a estrutura de um array
// 
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAY2()
aLISTA    := ARRAY(3) // {NIL,NIL,NIL}
aLISTA[2] := 5        // {NIL,5  ,NIL}
RETURN




//------------------------------------------------------------------------------------------
// ASCAN()
// pesquisa dentro do array
// 
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAY3()
aNOMES  := {"VINI" , "GUI" , "THAMIRES" , "JOAO"}
nPOS1   := ASCAN(aNOMES,"THAMIRES") // 3
nPOS2   := ASCAN(aNOMES,"ANA"     ) // 0

IF nPOS1 > 0  
   ALERT("Achou: "+aNOMES[nPOS1] )
ENDIF

IF nPOS2 > 0  
   ALERT("Achou: "+aNOMES[nPOS2] )
ENDIF

RETURN




//------------------------------------------------------------------------------------------
// ASORT()
// ordena um array
// 
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAY4()
aNOMES  := {"VINI" , "GUI" , "THAMIRES" , "JOAO"}
aBKP    := ACLONE(aNOMES) // usando funcao ACLONE para realizar a copia do array
                          // aNOMES
                          // assim qualquer alteracao realizadas no aNOMES nao 
                          // altera nada na aBKP
ASORT(aNOMES) // ordena os elementos do array aNOMES
RETURN


