#INCLUDE "PROTHEUS.CH"

//--------------------------------------------------------
// tipos de variaveis - caractere
//--------------------------------------------------------
// nome da variavel nao pode ter mais que 10 caracteres
USER FUNCTION TIPOVAR1()
PRIVATE cNOME1         := "ANA"
PRIVATE cNOME2         := "ISA 121 % * - ."
PRIVATE cNOME3         := ''
PRIVATE cNOME4         // se nao for declarado o tipo da variavel, essa sera NIL
PRIVATE cVAR1          := "TESTE"
PRIVATE cNomeVendedor1 := "PAULO"
PRIVATE cNomeVendedor2 := "JOAO"
      //1234567890
//MSGINFO(cNomeVendedor1)
//MSGINFO(cNOME4)
cNOME4 := cNOME1+" "+cVAR1+" TESTEX"
RETURN


//--------------------------------------------------------
// tipos de variaveis - numerico
//--------------------------------------------------------
// nome da variavel nao pode ter mais que 10 caracteres
USER FUNCTION TIPOVAR2()
PRIVATE nQUANT := 5
PRIVATE nUNIT  := 10.75 
PRIVATE nTOTAL := 0
nTOTAL := nQUANT / nUNIT 
ALERT( nTOTAL )
RETURN 


//--------------------------------------------------------
// tipos de variaveis - logica (boleano)
//--------------------------------------------------------
// nome da variavel nao pode ter mais que 10 caracteres
USER FUNCTION TIPOVAR3()
PRIVATE lEXISTE1 := .T.
PRIVATE lEXISTE2 := .F.
RETURN



//--------------------------------------------------------
// tipos de variaveis - DATA
//--------------------------------------------------------
// nome da variavel nao pode ter mais que 10 caracteres
USER FUNCTION TIPOVAR4()
SET DATE TO BRIT // usando essa conversao apenas no VSCODE, no Prothes nao precisa
PRIVATE dVENCTO
PRIVATE dHOJE  := CTOD("26/08/2022")
PRIVATE dDATA  := CTOD("") // criando a variavel tipo data com conteudo em branco
PRIVATE dDATA2 := CTOD("32/10/2022") // cria variavel vazia
PRIVATE dDATA3 := DATE() // retorna data corrente do servidor
//PRIVATE dDATA4 := SE1->E1_VENCTO
dVENCTO := dHOJE + 30
ALERT(dVENCTO)
RETURN


//---------------------------------------------------------------
// EXEMPLO DE CRIACAO DE VARIAVEL COM AS CARACTERISTICAS 
// DO CAMPO INFORMADO NA FUNCAO CRIAVAR()
//---------------------------------------------------------------
USER FUNCTION TIPOVAR5()
// A1_NOME  C 60
// cNOME := SPACE(50)  // cria a varivel com 50 espacos
cNOME    := CRIAVAR("A1_NOME")
dVENCTO1 := CRIAVAR("E1_VENCREA") // ira criar a variavel vazia com as caracteristicas do campo informado
dVENCTO2 := CRIAVAR("E5_DATA")    // ira criar a variavel vazia com as caracteristicas do campo informado
RETURN

