#INCLUDE "PROTHEUS.CH"

//--------------------------------------------------------------
// OPERADORES MATEMATICOS
//--------------------------------------------------------------
USER FUNCTION OPE01()
   A := 10
   B := 3
   C := A + B + 5
   D := A - B
   E := A * B
   F := A / B
   G := A ** B // 10^2
   H := 15 % 4
RETURN



//--------------------------------------------------------------
// OPERACOES COM STRING
//--------------------------------------------------------------
USER FUNCTION OPE02()
A := "TOTVS"
B := "PROTHEUS"
C := A+" "+B
ALERT(C)
ALERT(A+" "+B)
RETURN

//--------------------------------------------------------------
// OPERACOES COM STRING
//--------------------------------------------------------------
USER FUNCTION OPE03()
cNOME   := "MARCELO CORDEIRO"  // cNOME := SA1->A1_NOME
lEXIST1 := "ELO"   $ cNOME
lEXIST2 := "TOTVS" $ cNOME
RETURN


//--------------------------------------------------------------
// OPERACOES RELACIONAIS
//--------------------------------------------------------------
USER FUNCTION OPE04()
A := 1
B := 2
lRESULT1 := A < B // .T.
lRESULT2 := A > B // .F.
lRESULT3 := A = B // .F.
lRESULT4 := A >= B // .F.
lRESULT5 := A <= B // .T.
lRESULT6 := A <> B // .T.    
         // A #  B // comparacao
         // A != B // comparacao
RETURN


//--------------------------------------------------------------
// OPERACOES RELACIONAIS
//--------------------------------------------------------------
USER FUNCTION OPE05()
A := "SAO PAULO, 26 DE AGOSTO DE 2022 SEXTA FEIRA DE VERAO FJSDFKJHDSAFJK FADSKJFHSDAKJHFSDAKJHFDSAKJ HFKSDAJHFKJDSAHFJKSDAHF"
B := "SAO PAULO, 26 DE AGOSTO DE 2022 SEXTA FEIRA DE VERAO FJSDFKJHDSAFJK FADSKJFHSDAKJHFSDAKJHFDSAKJ HFKSDAJHFKJDSAHFJKSDAHF "
lRESULT1 := A =  B
lRESULT2 := A == B // .F.
RETURN


//--------------------------------------------------------------
// OPERADORES LOGICOS
//--------------------------------------------------------------
USER FUNCTION OPE06()
A := 0
B := 1
C := 3

lRESULT1 := A=0 .AND. B=0
//          .T.       .F.
//         --------------
//              .F.

lRESULT2 := A=0 .OR. B=0 .OR. C=0
//          .T.      .F.      .F.
//         ----------------------
//                  .T.

lRESULT3 := (A=0 .AND. B=0) .OR. C > 0 
//          .T.       .F.        .T.
//          ---------------
//               .F.            
//          --------------------------
//                     .T.

RETURN



//--------------------------------------------------------------
// OPERADORES LOGICOS
//--------------------------------------------------------------
USER FUNCTION OPE07()
A := 1
B := 1

lRESULT1 := .NOT. A=B // .F.   A é igual a B, porem o NOT altera o resultado final
lRESULT2 := !A=B

RETURN


//--------------------------------------------------------------
// OPERADORES DE ATRIBUICOES
//--------------------------------------------------------------
USER FUNCTION OPE08()
A := 0
A := A + 5 // 5
A := A + 1 // 6
A += 2     // 8
A -= 1     // 7

B := 5
B *= 2

/*
C := 1
ALERT(C++) // fazer a leitura da variavel C e apresenta na tela, em seguida incrementa
ALERT(C)   // apresentar o resutado a incrementacao anteiror
*/

C := 1
ALERT(++C) // primeiro incrementa, em seguida entrega o resultado incrementado para a funcao alert()
ALERT(C)   // apresentar o resutado a incrementacao anteiror

RETURN



//--------------------------------------------------------------
// MACROSUBSTIUICAO
//--------------------------------------------------------------
USER FUNCTION OPE09()

A := "10 * 5" // A := TAB->CAMPO  10*5   10*6
B := A 
C := &A

D := "ALERT('TESTE')"   // A := TAB->CAMPO
&D

RETURN

