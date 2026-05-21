#include "protheus.ch"

/*/{Protheus.doc} FTPDADOS
(long_description)
@type user function
@author gabriel.sens
@since 23/04/2026
@version 1
@param , , 
@return , , 
@example
(examples)
@see (links_or_references)
/*/
User Function FTPDADOS()
 // Notação hungara (n para numérico, c para caractere, l para lógico, d para data, a para array, b para bloco de código)
  Local cCodCar := "Gabriel Sens"
  Local nNumero := 30
  local lRet := .T.
  Local dDataServ := Date()
  Local aRCidade := { "Palhoça", "São José" }
  Local bMultiplicar := { |x, y| x * y }

  MsgInfo("Código: " + cCodCar)
  MsgInfo("Número: " + cValTochar(nNumero))
  MsgInfo(lRet)
  MsgInfo("Data do Serviço: " + Dtoc(dDataServ))
  MsgInfo("Cidades: " + aRCidade[1] + ", " + aRCidade[2])
  MsgInfo("Multiplicação: " + cValTochar(Eval(bMultiplicar, 5, 10)))
  
Return 
