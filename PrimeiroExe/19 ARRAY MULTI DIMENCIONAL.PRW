#INCLUDE "PROTHEUS.CH"

//------------------------------------------------------------------------------------
// exemplo de array de uma dimensao
//------------------------------------------------------------------------------------
USER FUNCTION MULTI01()
// aLISTA := { "A" , DATE() , 1 , .F. , {} }
aIDADE := {15     ,17     ,25        } 
aCID   := {"COTIA","QUATA","PRUDENTE"}
aNOMES := {"ANA"  ,"BIA"  ,"JOAO"    }
MSGINFO( aNOMES[2]+" "+aCID[2]+" "+CVALTOCHAR(aIDADE[2]) )
RETURN

//------------------------------------------------------------------------------------
// exemplo de array multi dimensao
// conceito
//------------------------------------------------------------------------------------
USER FUNCTION MULTI02()
// A1 := {"ANA" ,"COTIA"   ,15}
// A2 := {"BIA" ,"QUATA"   ,17}
// A3 := {"JOAO","PRUDENTE",25}
// aLISTA := { A1 , A2 , A3 } 
//             1      2    3        1      2    3        1      2         3
aLISTA := { {"ANA","COTIA",15} , {"BIA","QUATA",17} , {"JOAO","PRUDENTE",25} }
//          ==================   ==================   ====================== 
//                 1                   2                       3             
// LEN(aLISTA) // 4
// MsgInfo(aLISTA[1,1]) // ANA
// MsgInfo(aLISTA[1,2]) // COTIA
// MsgInfo(aLISTA[1,3]) // 15
MSGINFO( aLISTA[1,1]+" "+aLISTA[1,2]+" "+CVALTOCHAR(aLISTA[1,3]) )
RETURN


//------------------------------------------------------------------------------------
// exemplo de array multi dimensao
// manipulacao
//------------------------------------------------------------------------------------
USER FUNCTION MULTI03()
//             1      2    3        1      2    3        1      2         3
aLISTA := { {"ANA","COTIA",15} , {"BIA","QUATA",17} , {"JOAO","PRUDENTE",25} }
//          ==================   ==================   ====================== 
//                 1                   2                       3             
   aLISTA[2,3] := 18 // altera de 17 para 18
// aLISTA[3,4] := 30 // AREIA FORA DO BALDE

aLISTA[3,3]  := 30 // altera idade da JOAO de 25 para 30
aLISTA[1][3] := 19 // altera idade da ANA de 15 para 19

ALERT(aLISTA[2][2])

RETURN



//------------------------------------------------------------------------------------
// exemplo de array multi dimensao
// criacao de array com o conceito de LINHA e COLUNAS
//------------------------------------------------------------------------------------
USER FUNCTION MULTI04()
aLISTA := { {"ANA" ,"COTIA"   ,15} ,; // linha1 
            {"BIA" ,"QUATA"   ,17} ,; // linha2
            {"JOAO","PRUDENTE",25} }  // linha3
        //   col1   col2      col3    
ALERT(aLISTA[2,3])
RETURN


//--------------------------------------------------------------------------
// MANIPULACAO DE ARRAY BUSCANDO DADOS DE OUTRO ARRAY
//--------------------------------------------------------------------------
USER FUNCTION MULTI05()

aARRAY1 := { {"A","Y","Q"} ,; // 1   
             {"G","F","A"} ,; // 2
             {"H","E","Z"} ,; // 3
             {"J","S","N"} ,; // 4    RUA aARRAY1,4 CASA 3 --> "N"
             {"K","D","M"} }  // 5
          // col1  2   3   

aARRAY1[3,2] := "X" // de E para X

aLISTA2 := {10,33,25}

aARRAY1[5,1] := aLISTA2[2] // altera K para 33

RETURN

