#INCLUDE "PROTHEUS.CH"


//------------------------------------------------------------------------------------------
// DTOS()
//
// converte conteudo DATA para STRING 
//
// I M P O R T A N T E  
//
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA1()
   SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
   PRIVATE dHOJE := DATE()
   PRIVATE cHOJE := DTOS(dHOJE) // 29/08/2022 --> 20220829
   MSGINFO(cHOJE)
RETURN


//------------------------------------------------------------------------------------------
// STOD()
//
// converte conteudo STRING --> DATA 
//
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA2()
   SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
   PRIVATE cDATA := "20220829"
   PRIVATE dHOJE := STOD(cDATA)  // "20220829" --> 29/08/2022
 //MSGINFO(++dHOJE)
 //dHOJE := dHOJE + 30 
   dHOJE += 30 
   MSGINFO(dHOJE)
RETURN

//------------------------------------------------------------------------------------------
// DTOC()
//
// converte conteudo DATA --> CARACTERE
//
// I M P O R T A N T E  
//
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA3()
   SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
   LOCAL dHOJE := DATE()
   MSGINFO("Hoje eh: "+DTOC(dHOJE))
RETURN


//------------------------------------------------------------------------------------------
// CTOD()
//
// converte conteudo CARACTERE --> DATA 
//
// I M P O R T A N T E
//
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA4()
   SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
 //LOCAL dDATA1 := CTOD("29/08/2022") // criando a variavel tipo DATA com conteudo fixo
   LOCAL dDATA2 := CTOD("")          // criando a variavel tipo DATA com conteudo EM BRANCO

   MsgGet2( "Data baixa" , "Informe data baixa" , @dDATA2 , "EDITABLE" , NIL )
   //       titulo         descricao no corpo     variavel  icone 

   MSGINFO("Hoje eh: "+DTOC(dDATA2))
RETURN

//------------------------------------------------------------------------------------------
// FUNCOES DIVERSAS - TRATAMENTO DATAS
//
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA5()
   SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
   LOCAL nMES     := MONTH( DATE() )
   LOCAL nDIA     := DAY( DATE() )
   LOCAL nANO     := YEAR( DATE() )
   LOCAL cEXTENSO := UPPER( MESEXTENSO( DATE() ) )
   // UPPER converte para maiusculo
RETURN


//------------------------------------------------------------------------------------------
// FUNCOES DIVERSAS - TRATAMENTO DATAS
// PAGINA 26 DA APOSTILA
//------------------------------------------------------------------------------------------
USER FUNCTION XDATA6()
SET DATE TO BRIT // apenas no VSCODE convete padrao MM/DD/AA --> DD/MM/AA
/*   
cDATA1 := GRAVADATA( DATE() , .T. , 1 ) // 1-ddmmaa
cDATA2 := GRAVADATA( DATE() , .T. , 2 ) // 2-mmddaa
cDATA3 := GRAVADATA( DATE() , .T. , 3 ) // 3-aaddmm
cDATA4 := GRAVADATA( DATE() , .T. , 4 ) // 4-aammdd
cDATA5 := GRAVADATA( DATE() , .T. , 5 ) // 5-ddmmaaaa
cDATA6 := GRAVADATA( DATE() , .T. , 6 ) // 6-mmddaaaa
cDATA7 := GRAVADATA( DATE() , .T. , 7 ) // 7-aaaaddmm
cDATA8 := GRAVADATA( DATE() , .T. , 8 ) // 8-aaaammdd
*/
cDATA1 := GRAVADATA( DATE() , .F. , 1 ) // 1-ddmmaa   * CNAB
cDATA2 := GRAVADATA( DATE() , .F. , 2 ) // 2-mmddaa
cDATA3 := GRAVADATA( DATE() , .F. , 3 ) // 3-aaddmm
cDATA4 := GRAVADATA( DATE() , .F. , 4 ) // 4-aammdd
cDATA5 := GRAVADATA( DATE() , .F. , 5 ) // 5-ddmmaaaa * CNAB
cDATA6 := GRAVADATA( DATE() , .F. , 6 ) // 6-mmddaaaa
cDATA7 := GRAVADATA( DATE() , .F. , 7 ) // 7-aaaaddmm
cDATA8 := GRAVADATA( DATE() , .F. , 8 ) // 8-aaaammdd
RETURN
