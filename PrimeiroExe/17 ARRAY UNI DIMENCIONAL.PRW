#INCLUDE "PROTHEUS.CH"


//-------------------------------------------------------------------------------------
USER FUNCTION ARRAY1()

aLISTA1 := {} // ARRAY VAZIA
aLISTA  := {"A","Z"} 
aIDADE  := {28     , 25    ,  19    ,  40   }
aNOMES  := {"VINI" , "GUI" , "TAIS" , "JOAO"}
           //   1       2       3        4

aNOMES[3] := "THAMIRES" // alterando o conteudo do elemento 3 do array

ALERT( aNOMES[3] ) // leitura/apresentacao do conteudo do elemento 3 do array

//ALERT( aNOMES   ) // NAO FUNCIONA - pq SEMPRE temos que informar o numero do elemento

ALERT( aNOMES[1]+" "+aNOMES[2] ) // VINI GUI

cNOME := aNOMES[3] // "THAMIRES" grava na variavel cNome

cTESTE := aNOMES[4]+" "+aLISTA[2] // JOAO Z

MSGINFO( aNOMES[3]+" tem "+CVALTOCHAR(aIDADE[3]) )

RETURN


//-------------------------------------------------------------------------------------
USER FUNCTION ARRAY2()
aLISTA    := {0} // 1 elmemento
nBASE     := 5000
aLISTA[1] := nBASE * (18/100)
ALERT(aLISTA[1])
aLISTA[1] ++
ALERT(aLISTA[1])
aLISTA[1] += 5
ALERT(aLISTA[1])
RETURN



