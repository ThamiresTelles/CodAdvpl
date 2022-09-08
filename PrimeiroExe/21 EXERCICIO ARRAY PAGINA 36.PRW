#INCLUDE "PROTHEUS.CH"

/*
--1. Criar um vetor “uni-dimencional” com os nomes de seus colegas de classe.
--2. Escolha um de seus colegas e altere o seu nome, complementando com seu sobrenome.
--3. Criar um vetor de 5 linhas com 3 Colunas e dar o nome de aArray1.
--4. Criar um vetor de 10 linhas com 1 Coluna e dar o nome de aArray2.
5. Atribuir ao Vetor a Array1 linha 1 coluna 1 o conteúdo “X”
6. Atribuir ao Vetor a Array1 linha 3 coluna 2 o conteúdo 9
7. Atribuir ao Vetor a Array1 linha 5 coluna 3 o conteúdo .T.
8. Atribuir ao Vetor a Array1 linha 1 coluna 3 o conteúdo do aArray2 Linha 5 coluna 1
*/
//----------------------------------------------------------------------------------------------------------
// EXERC ARRAY PAGINA 36
//----------------------------------------------------------------------------------------------------------
USER FUNCTION EXEP36()

aArray1 := {  {2,5,7} ,; // 1
              {7,5,6} ,; // 2
              {1,5,6} ,; // 3
              {7,4,9} ,; // 4
              {3,5,9}  } // 5
           //  1 2 3  

aArray2 := { {"A"} ,; // 1
             {"R"} ,; // 2
             {"T"} ,; // 3
             {"G"} ,; // 4
             {"S"} ,; // 5
             {"H"} ,; // 6
             {"E"} ,; // 7
             {"O"} ,; // 8
             {"H"} ,; // 9
             {"J"} }  // 10
          //   1

// 5. Atribuir ao Vetor a Array1 linha 1 coluna 1 o conteúdo “X”
aArray1[1][1] := "X"

// 6. Atribuir ao Vetor a Array1 linha 3 coluna 2 o conteúdo 9
// Array1[3][2] := Array1[3][2] + 9
   aArray1[3][2] += 9

// 7. Atribuir ao Vetor a Array1 linha 5 coluna 3 o conteúdo .T.
   aArray1[5,3] := .T.

// 8. Atribuir ao Vetor a Array1 linha 1 coluna 3 o conteúdo do aArray2 Linha 5 coluna 1
   aArray1[1,3] := aArray2[5,1]

RETURN

