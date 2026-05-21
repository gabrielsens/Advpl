#include 'totvs.ch'
/*
Demonstração dos operadores e macro execução
Operadores aritméticos: +, -, *, /, ^, %
Relacionais: ==, !=, >, <, >=, <=
Lógicos: .And., .Or., .Not.
Especiais: := (atribuição), @ (referência), -> (acessar campos de tabela), $ (macro execução)
*/

User Function DemoOperadores()
  Local n1:= 10
  Local n2:= 3
  Local lAtivo := .T.
  Local cTexto := "ADVPL"
  Local cBusca := "VPL"
  Local nResultado := 0
  // Chama abertura de empresa para poder trabalhar com a tabela SA1
  // RpcSetEnv("01", "0101", "admin", "1")
  Alert("Operadores Aritméticos")
  nResultado := n1 + n2 // Soma
  Alert("Soma: " + cValToChar(nResultado))
  nResultado := n1 - n2 // Subtração
  Alert("Subtração: " + cValToChar(nResultado))
  nResultado := n1 * n2 // Multiplicação
  Alert("Multiplicação: " + cValToChar(nResultado))
  nResultado := n1 / n2 // Divisão
  Alert("Divisão: " + cValToChar(nResultado))
  nResultado := n1 ^ n2 // Potenciação
  Alert("Potenciação: " + cValToChar(nResultado))
  nResultado := n1 % n2 // Resto da divisão
  Alert("Resto da divisão: " + cValToChar(nResultado))
  
  Alert("Operadores Relacionais")
  Alert("n1 == n2: " + cValToChar(n1 == n2)) // Igual
  Alert("n1 != n2: " + cValToChar(n1 != n2)) // Diferente
  Alert("n1 > n2: " + cValToChar(n1 > n2)) // Maior
  Alert("n1 < n2: " + cValToChar(n1 < n2)) // Menor
  Alert("n1 >= n2: " + cValToChar(n1 >= n2)) // Maior ou igual
  Alert("n1 <= n2: " + cValToChar(n1 <= n2)) // Menor ou igual

  Alert("Operadores Lógicos")
  Alert("lAtivo .And. (n1 > n2): " + cValToChar(lAtivo .And. (n1 > n2))) // E lógico
  Alert("lAtivo .Or. (n1 < n2): " + cValToChar(lAtivo .Or. (n1 < n2))) // Ou lógico
  Alert(".Not. lAtivo: " + cValToChar(.Not. lAtivo)) // Negação lógica

  Alert("Operadores Especiais")
  Local nOriginal := 5
  nOriginal := nOriginal + 1 // Atribuição com operador
  Alert("Atribuição com operador (nOriginal + 1): " + cValToChar(nOriginal))
  
  Local nRef := 10
  Dobrar(@nRef) // Passagem por referência
  Alert("Passagem por referência (Dobrar): " + cValToChar(nRef))

  // Operador -> para acessar campos de tabela
  // Para utilização das funções de banco temos que subir o ambiente chamando o rcpsetenv
  // ou adicionaod a rotina no menu
  // DbSelectArea("SA1")
  // DbGoTop()
  // Alert("Campo A1_NOME: " + SA1->A1_NOME)

  // Operador $ (substring)
  Alert("'" + cBusca + "' $ '" + cTexto + "': " + cValToChar(cBusca $ cTexto)) // Verifica se cBusca é substring de cTexto

  Alert("Macro execução")
  Local cVar := "n1"
  Alert("Valor de &cVar: " + cValToChar(&cVar)) // Acessa o valor da variável n1 usando macro execução
Return

Static Function Dobrar(n)
  n *= 2
Return
