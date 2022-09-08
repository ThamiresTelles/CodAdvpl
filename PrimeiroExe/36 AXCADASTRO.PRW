#INCLUDE "PROTHEUS.CH"
#INCLUDE "VKEY.CH" // usado para controle de teclas de atalho F2..F12 --> SetKey

USER FUNCTION AXCAD1()
SetKey( VK_F2, {|| U_TST001() } )
AXCADASTRO("SAH","Titulo","U_VLDSAHE()","U_VLDSAHIA()")
SetKey( VK_F2, NIL )
RETURN

USER FUNCTION TST001()
ALERT("TESTE")
RETURN

// valida se o registro corrente pode ser excluido
// verifica se o user corrente tem permissao para excluir
USER FUNCTION VLDSAHE()
LOCAL lRET := .T.
// se usuario corrente NAO estiver contido no parametro ele nao tem o direito de excluir
IF .NOT. UPPER(cUSERNAME) $ UPPER(GETMV("MV_XXXXX",,"MARCELO"))
   MSGINFO("VC NAO TEM PERMISS DE EXCLUIR CAD DE UNID DE MEDIDA")
   lRET := .F.
ENDIF  
RETURN lRET


// verifica se o user corrente tem permissao para incluir ou alterar
USER FUNCTION VLDSAHIA()
LOCAL lRET := .T., cMSG
// se usuario corrente NAO estiver contido no parametro ele nao tem o direito de excluir
IF .NOT. UPPER(cUSERNAME) $ UPPER(GETMV("MV_XXXXX",,"MARCELO"))

   IF INCLUI // variavel publica padrao protheus q informa a acao atual INCLUINDO ou ALTERANDO
      cMSG := "VC NAO TEM PERMISS DE INCLUIR CAD DE UNID DE MEDIDA"
   ELSE   
      cMSG := "VC NAO TEM PERMISS DE ALTERAR CAD DE UNID DE MEDIDA"
   ENDIF   

   MSGINFO( cMSG )
   lRET := .F.
ENDIF  
RETURN lRET
