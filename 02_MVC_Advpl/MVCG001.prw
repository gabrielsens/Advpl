#include "protheus.ch"

/*/{Protheus.doc} MVCG001
(long_description)
@type user function
@author gabrielsens
@since 28/05/2026
@version 1.0
@return cStatus, character, Status atualizado do Chamado
/*/
User Function MVCG001()
  Local cStatus := ""

  cStatus := M->ZZD_STATUS

  If ! Empty(ZZD_TECNIC)
    // Nos casos que cStatus for diferente de branco ou 1 ele continua com o mesmo status
    If Empty(cStatus) .And. cStatus == "1"
      cStatus := "2"
    EndIf
  EndIf

Return cStatus
