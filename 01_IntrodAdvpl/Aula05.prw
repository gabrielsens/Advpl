#include 'totvs.ch'
/*/
Programa para demonstrar os escopos de variáveis em ADVPL
Local: Variável declarada dentro de uma função, acessível apenas dentro dessa função. só existe dentro de DemoEscopo(). A EscopoFilha() não consegue acessar.
Static: Mantem o valor entre chamadas e poder ser acessada por funções filhas
Private: Variável acessível apenas dentro do módulo onde foi declarada. Não pode ser acessada por outros módulos. Pode ser acessada por EscopoFilha() porque foi criada na mesma tread de execução.
Public: E Global na tread e acessivel por qualquer função enquanto existir. Variável acessível por qualquer módulo do sistema. Pode ser acessada por EscopoFilha() porque é pública.
/*/
User Function DemoEscopo()
  // Variável Local
  Local cLocal := "Sou uma variável local"
  // Variável Static
  Static cStatic := "Sou uma variável static"
  // Variável Private
  Private cPrivate := "Sou uma variável private"
  // Variável Public
  Public cPublic := "Sou uma variável public"

  Alert("Dentro de DemoEscopo()")
  Alert("Local: " + cLocal)
  Alert("Static: " + cStatic)
  Alert("Private: " + cPrivate)
  Alert("Public: " + cPublic)

  // Chama a função filha para demonstrar o acesso às variáveis
  EscopoFilha()

  // Alterando valores para ver comportamento
  cLocal := "Valor alterado da variável local"
  cStatic := "Valor alterado da variável static"
  cPrivate := "Valor alterado da variável private"
  cPublic := "Valor alterado da variável public"

  Alert("Após alteração de DemoEscopo()")
  Alert("Local: " + cLocal)
  Alert("Static: " + cStatic)
  Alert("Private: " + cPrivate)
  Alert("Public: " + cPublic)

  // Chamando função filha novamente para ver o comportamento após alteração
  EscopoFilha()

Return

/*/
/*/
Static Function EscopoFilha()
  Alert("Dentro de EscopoFilha()")
  // Tentando acessar as variáveis da função pai
  // Alert("Local: " + cLocal) // Erro, variável local não acessível
  Alert("Static: " + cStatic) // Acessível, mantém valor entre chamadas
  Alert("Private: " + cPrivate) // Acessível, mesma thread de execução
  Alert("Public: " + cPublic) // Acessível, global na thread
Return
