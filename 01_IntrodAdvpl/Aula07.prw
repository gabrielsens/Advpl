#include 'totvs.ch'
/*
Estruturas de Repetição (FOR / WHILE)
*/
User Function DemoRepeticao()
  Local nSoma := 0
  Local n := 0
  Local nContador := 0
  Local nAcumulador := 0

  // Exemplo com FOR
  Alert("Inicio do FOR")
  For n := 1 To 10
    If n == 5
      Alert("Pulando o número 5")
      Loop
    EndIf

    If n == 8
      Alert("Parando o FOR no número 8")
      Exit
    EndIf

    nSoma += n
    Alert("FOR - n:" + cValToChar(n))
  Next
  Alert("Soma total do FOR: " + cValToChar(nSoma))
  

  Alert("Inicio do WHILE")
  While nContador < 10
    nContador++

    If nContador == 3
      Alert("Pulando o número 3")
      Loop
    EndIf

    If nContador == 7
      Alert("Parando o WHILE no número 7")
      Exit
    EndIf

    nAcumulador += nContador
    Alert("WHILE - nContador:" + cValToChar(nContador))
  EndDo
  Alert("Acumulador total do WHILE: " + cValToChar(nAcumulador))
Return
