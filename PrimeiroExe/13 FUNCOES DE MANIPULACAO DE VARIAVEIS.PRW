#INCLUDE "PROTHEUS.CH"

//--------------------------------------------------------------------------------------
// funcao VAL
// converte CARACTERE --> NUMERICO
//--------------------------------------------------------------------------------------
USER FUNCTION XVAL()
LOCAL cQUANT := "000115"
LOCAL cVALOR := "12345678" // 123456.78
LOCAL nQUANT, nVALOR
nQUANT := VAL(cQUANT)       // convete o conteudo C --> N   "000115" --> 115
nVALOR := VAL(cVALOR) / 100 // convete o conteudo C --> N   "12345678" --> 123456,78
RETURN

//--------------------------------------------------------------------------------------
// funcao SUBSTR()
// retorna parte de uma string
// 
// I M P O R T A N T E
// 
/*
123456    000115XXXXXXXXXX                
1         11    17
1111111111222222333333333333333333333333333333
*/
//--------------------------------------------------------------------------------------
USER FUNCTION XSUBSTR()
LOCAL cLINHA := "123456    000115XXXXXXXXXX                "
LOCAL cCOD, cQUANT, nQUANT, cDESC

   cCOD   := SUBSTR(cLINHA,01,10) // "123456    "
   cQUANT := SUBSTR(cLINHA,11,06) // "000115"

   cDESC  := SUBSTR(cLINHA,17,30) // "XXXXXXXXXX                "
// cDESC  := SUBSTR(cLINHA,17   ) // "XXXXXXXXXX                "
// aqui informei apenas a posicao inicial que eh 17
// como nao entrei com a posicao final, ele retorna tudo ate o final

   nQUANT := VAL(cQUANT) // numerico 115
// cQUANT := VAL( SUBSTR(cLINHA,11,06) ) // substr retorna "000115" e entrega esse conteudo para a VAL()

RETURN   


//--------------------------------------------------------------------------------------
// funcao LEFT() e RIGHT()
// retorna parte de uma string
//--------------------------------------------------------------------------------------
USER FUNCTION XESQDIR()
LOCAL cLINHA := "SAO PAULO, 15 DE DEZEMBRO"
LOCAL cINI
LOCAL cFIM
cINI := LEFT(cLINHA,3)  // "SAO" 
cFIM := RIGHT(cLINHA,6) // "ZEMBRO"
RETURN


//--------------------------------------------------------------------------------------
// funcao PADC() PADR() PADL()
// trata o conteudo da variavel alinhando centro, direita e esquerda
//--------------------------------------------------------------------------------------
USER FUNCTION XPAD()
LOCAL cLINHA := "TOTVS"
LOCAL cRESULT1, cRESULT2, cRESULT3
cRESULT1 := PADC(cLINHA,20,"#")
cRESULT2 := PADL(cLINHA,20,"#")
cRESULT3 := PADR(cLINHA,20,"#")
MSGINFO(cRESULT1 + CRLF + cRESULT2 + CRLF + cRESULT3)
RETURN




//--------------------------------------------------------------------------------------
// funcao ALLTRIM() LTRIM() RTRIM()
// remove espacos em branco
//
// I M P O R T A N T E 
//
//--------------------------------------------------------------------------------------
USER FUNCTION XTRIM()
LOCAL cLINHA := "123456    000115XXXXXXXXXX                "
cCOD := SUBSTR(cLINHA,01,10) // "123456    " --> "123456"
cCOD := ALLTRIM(cCOD) 
// cCOD := ALLTRIM( SUBSTR(cLINHA,01,10) ) // "123456    " --> "123456"
RETURN

USER FUNCTION XTRIM2()
LOCAL cLINHA := "SAO PAULO "
LOCAL cCID   := ALLTRIM(cLINHA) // "SAO PAULO " --> "SAO PAULO"
ALERT(cCID)
RETURN

//--------------------------------------------------------------------------------------
// funcao STR()
// converte conteudo NUMERICO em CARACTER
//
// I M P O R T A N T E 
//
//--------------------------------------------------------------------------------------
USER FUNCTION XSTR1()
  LOCAL nQUANT := 1234
  LOCAL cQUANT := STR(nQUANT,4) // 123 --> " 123"      
//                          ,4 ate 9999   
//LOCAL cQUANT := ALLTRIM(STR(nQUANT)) // 123 --> "      123" --> "123"
MSGINFO("Quantidade vendida: "+cQUANT)
RETURN

USER FUNCTION XSTR2()
  LOCAL nQUANT := 124.56
  LOCAL cQUANT := STR(nQUANT,10,2)  // 124.56 --> "    124.56"
MSGINFO("Quantidade vendida: "+ALLTRIM(cQUANT) )
RETURN




//--------------------------------------------------------------------------------------
// funcao STR()
// converte conteudo NUMERICO em CARACTER
//
// I M P O R T A N T E 
//
//--------------------------------------------------------------------------------------
USER FUNCTION XSTRZERO()
  LOCAL cCOD   := "12345"
  LOCAL nQUANT := 3456
  LOCAL cDESC  := "DESCRICAO DO PRODUTO"
  LOCAL cLINHA := ""
cLINHA := cCOD + STRZERO(nQUANT,8) + cDESC 
//      "1234500003456DESCRICAO DO PRODUTO"
RETURN

USER FUNCTION XSTRZER1()
LOCAL nQUANT  := 3456
LOCAL cRESULT := STRZERO(nQUANT,8) 
ALERT(cRESULT)
RETURN




//--------------------------------------------------------------------------------------
// funcao CVALTOCHAR()
// converte conteudo NUMERICO em CARACTER
// removendo os espacos em branco
// e respeita casas decimais
//
// I M P O R T A N T E 
//
//--------------------------------------------------------------------------------------
USER FUNCTION XCVALTO1()
LOCAL nQUANT := 1234
MSGINFO("Quantidade vendida: "+CVALTOCHAR(nQUANT))
RETURN

USER FUNCTION XCVALTO2()
LOCAL nVALOR := 957345456.33
MSGINFO("Valor da venda: "+CVALTOCHAR(nVALOR))
RETURN

USER FUNCTION XCVALTO3()
LOCAL nVALOR := 957345456.33
LOCAL nQUANT := 1234
//MSGINFO( "Quantidade vendida: "+CVALTOCHAR(nQUANT)+CRLF+"Valor da venda: "+CVALTOCHAR(nVALOR) )
//         ====================== ================== ==== ================== ==================
MSGINFO( "Quantidade vendida: "+CVALTOCHAR(nQUANT)+CRLF+;
         "Valor da venda: "+CVALTOCHAR(nVALOR) )
RETURN

//--------------------------------------------------------------------------------------
// funcao TRANSFORM()
// 1 - converte conteudo NUMERICO em CARACTER
// 2 - ajusta mascara mesmo o conteudo ja sendo caractere
//
// I M P O R T A N T E 
//
//--------------------------------------------------------------------------------------
USER FUNCTION XTRANSF1()
LOCAL nVALOR := 123456.78      // "123.456,78"
LOCAL cCPF   := "11122233344"  // "111.222.333-44"
LOCAL cCEP   := "19100752"     // "19.100-752"
LOCAL cVALOR 
cVALOR := TRANSFORM(nVALOR,"@E 999,999.99")  // @E converte de 999,999.99 --> 999.999,99
cCPF   := TRANSFORM(cCPF,"@R 999.999.999-99") // @R insere entre os numero da mastara os caracter especiais
cCEP   := TRANSFORM(cCEP,"@R 99.999-999")
MSGINFO(cVALOR + CRLF + cCPF + CRLF + cCEP,"TITULO")
RETURN

