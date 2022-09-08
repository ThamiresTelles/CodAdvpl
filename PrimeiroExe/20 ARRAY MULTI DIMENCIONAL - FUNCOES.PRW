#INCLUDE "PROTHEUS.CH"


//------------------------------------------------------------------------------------------
// AADD 
// inclui elementos em um array
// 
// I M P O R T A N T E
// 
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM1()
aLISTA := {}
AADD(aLISTA , {"X","K"} )
AADD(aLISTA , {"J","M"} )
aAUX := {"AA","BB","XX"}
AADD(aLISTA , aAUX )
RETURN 


//------------------------------------------------------------------------------------------
// ARRAY()
// cria a estrutura de um array sem conteudo 
// 
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM2()
// aLISTA := ARRAY(2)   // {NIL,NIL}
   aLISTA := ARRAY(2,3) // { {NIL,NIL,NIL} , {NIL,NIL,NIL}  }
//                            X   Y
aLISTA[1,1] := "X"
aLISTA[1,2] := "Y"
RETURN



//------------------------------------------------------------------------------------------
// ASCAN()
// pesquisa dados dentro de um array MULTI DIMENCIONAL  --> bloco de codigo ==> {||   }
// 
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM3()
// aLISTA := {"A","B"}
// nPOS   := ASCAN(aLISTA,"B") // pesquisa o conteudo "B" e retorna em qual posicao encontrou

aLISTA := { {"ANA" ,"COTIA"   ,15} ,; // linha1 
            {"BIA" ,"QUATA"   ,17} ,; // linha2
            {"JOAO","PRUDENTE",25} }  // linha3

// no nPOS eh gravada a linha onde o conteudo foi encontrado
nPOS := ASCAN(aLISTA , {|X| X[1]="BIA" } ) // se encontrar grava posicao no nPOS
                                           // se NAO encontrar grava 0 no nPOS
// X --> {"BIA" ,"QUATA"   ,17}

IF nPOS > 0
   MSGINFO( "Cliente "+aLISTA[nPOS,1]+" se encontra na posicao "+CVALTOCHAR(nPOS) )
ENDIF   

RETURN



//------------------------------------------------------------------------------------------
// ASCAN()
// pesquisa dados dentro de um array MULTI DIMENCIONAL  --> bloco de codigo ==> {||   }
// 
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM4()
aLISTA := { {"ANA" ,"COTIA"       ,15} ,; // linha1 
            {"BIA" ,"QUATA"       ,17} ,; // linha2
            {"BIA" ,"SANTO ANDRE" ,17} ,; // linha2
            {"JOAO","PRUDENTE"    ,25} }  // linha3

nPOS := ASCAN(aLISTA , {|X| X[1]="BIA" .AND. X[2]="SANTO ANDRE" } ) 
//                          ========== ===== ==================

IF nPOS > 0
   cMSG := "Cliente: "+aLISTA[nPOS,1]+CRLF
   cMSG += "Cidade: "+aLISTA[nPOS,2]+CRLF
   cMSG += "Idade: "+CVALTOCHAR(aLISTA[nPOS,3])+CRLF
   MSGINFO( cMSG , "Titulo" )
ENDIF   

RETURN




// nPOS := ASCAN(aLISTA , {|X| X[1]="BIA" .OR. X[2]="BIA" .OR. X[3]="BIA" } )



//------------------------------------------------------------------------------------------
// ASCAN()
// pesquisa dados dentro de um array MULTI DIMENCIONAL  --> bloco de codigo ==> {||   }
// 
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM5()
aLISTA := { {"ANA  " ,"COTIA      " ,15} ,; // linha 1 
            {"BIA  " ,"QUATA      " ,17} ,; // linha 2
            {"BIA  " ,"SANTO ANDRE" ,17} ,; // linha 3
            {"JOAO " ,"PRUDENTE   " ,25} }  // linha 4 

cDADO := SPACE(10)
MsgGet2( "Pesquisa" , "Informe nome para pequisa" , @cDADO, "EDITABLE" , NIL , "@!" )
// "@!" faz com que todo o conteudo digitado no MSGGET2 seja maiusculo

cDADO := UPPER(ALLTRIM(cDADO)) // "QUATA"

nPOS := ASCAN(aLISTA , {|X| ALLTRIM(X[1])==cDADO .OR. ALLTRIM(X[2])==cDADO } ) 

IF nPOS > 0
   cMSG := "Cliente: "+aLISTA[nPOS,1]+CRLF
   cMSG += "Cidade: "+aLISTA[nPOS,2]+CRLF
   cMSG += "Idade: "+CVALTOCHAR(aLISTA[nPOS,3])+CRLF
   MSGINFO( cMSG , "Titulo" )
ENDIF   

RETURN



//------------------------------------------------------------------------------------------
// ASCAN()
// pesquisa dados dentro de um array MULTI DIMENCIONAL  --> bloco de codigo ==> {||   }
// 
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION FARRAYM6()

//aLINHA := {"B","A"}
//ASORT(aLINHA) // {"A","B"}

aLISTA := { {"ANA  "   ,"COTIA      " ,15} ,; // linha 1 
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha 2
            {"BIA  "   ,"SANTO ANDRE" ,17} ,; // linha 3
            {"JOAO "   ,"PRUDENTE   " ,25} }  // linha 4 

/*
aLISTA := { {"ANA  "   ,"COTIA      " ,15} ,; // linha1
            {"BIA  "   ,"SANTO ANDRE" ,17} ,; // linha2
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha3  1 inicial
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha4  2
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha5  3
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha6  4
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha7  5
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha8 
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha9
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha10
            {"CLAUDIA" ,"QUATA      " ,17} ,; // linha11
            {"JOAO "   ,"PRUDENTE   " ,25} }  // linha12
// tratando o segundo e terceiro parametro para ordenar apenas perta do nosso array
aLISTA := ASORT( aLISTA ,3                  , 5 , {|X,Y| X[1] < Y[1] } )

*/

// ordenacao crescentr pelo primeiro elemento

aLISTA := ASORT( aLISTA ,/*posicao inicial*/, /*quant. de elementos vamos tratar*/, {|X,Y| X[1] < Y[1] } )

aLISTA := ASORT( aLISTA , NIL , NIL , {|X,Y| X[1] < Y[1] } )
//               1        2     3     4
            
RETURN






