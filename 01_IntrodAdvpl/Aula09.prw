#include 'totvs.ch'
/*
Demonstração dos Tipos de Funções no ADVPL
User Function -> Função que pode ser chamada de qualquer lugar do código - Ponto de entrada principal e funções com parametros opcionais
Static Function -> Função que só pode ser chamada dentro do mesmo arquivo - Funções auxiliares - Funções internas
Function -> Modelo da TOTVS q esta comentado porque não é possivel compilar sem a chave de compilação.
Parametros por valor e referencia com @.
Funcoes internas do ADVPL (Date(). Val(), DTOC())
Blocos de código (code blocks) executados com Eval()
*/
User Function DemoFuncoes()
	Alert("--- Demo de Funções ---")

// Chamando User Function
	U_OlaMundo()

	// Chamando Static Function
	Local nValor := 10
	Alert("Dobro de 10: " + cValToChar(CalcularDobro(nValor)))

	// Chamando Function Padrao da TOTVS cValToChar
	Alert("Soma de 5 + 7: " + cValToChar(5 + 7))

	// Chamando função com parametros por referência
	Local nNum := 5
	U_Dobrar(@nNum)
	Alert("Número dobrado (por referência): " + cValToChar(nNum))

	// Função com parametros opcionais
	// u_Saudacao()
	u_Saudacao("Maria")

	// Usando função interna do ADVPL
	Local dHoje := Date()
	Local nConvertido := Val("123")
	Alert("Data de hoje: " + DTOC(dHoje))
	Alert("Número convertido: " + cValToChar(nConvertido))

	// Exemplo de bloco de código
	Local bMultiplicar := {|x, y| x * y}
	Alert("Multiplicação usando bloco de código: " + cValToChar(Eval(bMultiplicar, 3, 4)))
Return

/* User Function: ponto de entrada */
User Function OlaMundo()
	Alert("Olá, Mundo!")
Return

/* Static Function: visivel apenas nesse arquivo */
Static Function CalcularDobro(nValor)
  Return nValor * 2
Return

/* User Function: parametros por referência */
User Function Dobrar(n)
	n *= 2
Return

/* User Function: ponto de entrada */
User Function Saudacao(cNome)
  Alert("Olá, " + cNome)
Return
