#include 'totvs.ch'
/*
 Estruturas de Decisão (IF / DO CASE)
*/


/*/{Protheus.doc} DemoDecisao
(long_description)
@type user function
@author gabriel.sens
@since 27/04/2026
@version 1
@param , , 
@return , , 
@example
(examples)
@see (links_or_references)
/*/
User Function DemoDecisao()
  Local nNota := 95
  Local cStatus := "P"

  // Exemplo de decisão usando IF
  If nNota >= 90
    Alert("Excelente! Você recebeu um A.")
  ElseIf nNota >= 60
    Alert("Aprovado.")
  Else
    Alert("Reprovado.")
  EndIf

  // Exemplo de decisão usando CASE
  Do Case
    Case cStatus == "A"
      Alert("Status: Aprovado.")
    Case cStatus == "P"
      Alert("Status: Pendente.")
    Case cStatus == "C"
      Alert("Status: Cancelado.")
    Otherwise
      Alert("Status: Não Mapeado.")
  End Case

Return 
