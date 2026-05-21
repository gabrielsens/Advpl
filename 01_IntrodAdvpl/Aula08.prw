#include 'totvs.ch'
/*
Manipulação de dados

------

Strings
AllTrim*() -> remove espaços extras
Upper() -> converte para maiúsculo
Lower() -> converte para minúsculo
SubStr() -> extrai parte da string
StrTran() -> substitui trechos

Datas
Conversões
CTOD() -> converte string para data
DTOC() -> converte data para string
DTOS() -> converte data para string no formato AAAAMMDD (formato juliano)

Números
Val(cTexto) -> converte string para número
cValToChar(nValor) -> converte número para string
Transform(nValor, "@E 999,999.99") -> formata valor
Int(nValor) -> parte inteira do número
Round(nValor, nDecimais) -> arredonda número
*/
User Function FSTRINGS()
 // Strings
 Local cTexto := "  Protheus ERP  "
 Alert("Texto original: [" + cTexto + "]")

  // Remover espaços extras
  cTexto := AllTrim(cTexto)
  Alert("Texto sem espaços extras: [" + cTexto + "]")
  //Alterar Caixa
  Alert("Texto em maiúsculo: [" + Upper(cTexto) + "]")
  Alert("Texto em minúsculo: [" + Lower(cTexto) + "]")
  // Substituir partes da string
  Alert("Substituir: " + StrTran(cTexto, "ERP", "ADVL"))
  // Extrair parte da string
  Alert("Extrair parte da string: " + SubStr(cTexto, 1, 8))

  // Números
  MsgInfo("Chamando a funçao de Números")
  FNUMEROS()
  // Datas
  MsgInfo("Chamando a funçao de Datas")
  FDATAS()
  // Arrays
  MsgInfo("Chamando a funçao de Arrays")
  FARRAYS()


Return

Static Function FNUMEROS()
  Local cNumero := "1500.75"
  Local nValor := Val(cNumero)
  Alert("Número convertido: " + cValToChar(nValor))
  Alert("Número arredondado: " + cValToChar(Round(nValor, 1)))
  Alert("Número formatado: " + Transform(nValor, "@E 999,999.99"))

Return

Static Function FDATAS()
  Local dHoje := Date()
  Local dVenc := CTOD("30/12/2024")
  Alert("Data de hoje: " + DTOC(dHoje))
  Alert("Data de vencimento: " + DTOC(dVenc))

  // Comparar datas
  If dHoje > dVenc
    Alert("Atenção: Data Vencida!")
  Else
    Alert("Tudo Certo com a Data!")
  EndIf

  // Adicionar dias a data
  Alert("Data de hoje + 10 dias: " + DTOC(dHoje + 10))
Return

Static Function FARRAYS()
  Local aClientes := { "Ana", "Bruno" }
  Local cLista := ""
  Local aMatriz := {{ "ID", "Nome" }, { 1, "Ana" }, { 2, "Bruno" }}
  Local n
  AAdd(aClientes, "Carlos")
  Alert("Clientes: " + aClientes)

  // Alterar elementos
  aClientes[2] := "Beatriz"
  Alert("Clientes 2 alterado: " + aClientes[2])

  // Percorrer Array
  For n := 1 To Len(aClientes)
    cLista += aClientes[n] + ", "
  Next
  Alert("Lista de Clientes: " + cLista)

  // Array multidimensional
  Alert("Matriz[2][2]: " + aMatriz[2][2]) // Exibe Ana
Return
