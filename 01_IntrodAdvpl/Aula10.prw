#include 'totvs.ch'
/*
Demonstração Array e Blocos de Código
Arrays -> Estrutura de dados para armazenar múltiplos valores
Arrays: criação, leitura, alteração, adição, remoção (AAdd, ADel)
redimensionamento (ASize) e arrays multidimensionais

Blocos de Código (Code Blocks) -> Trechos de código que podem ser armazenados em variáveis e executados posteriormente com Eval()
Execução com VARINFO() para trazer os dados do array atraves do alert()
Aplicação em arrays (transformações e filtros)
*/

User Function DemoArrayEBloco()
  Alert("--- Demo de Arrays e Blocos de Código ---")

  // ARRAYS
  Local aDados := { "Bruno", 30, Date(), .T. }
  // Array multidimensional
  Local aMatriz := { { "ID", "Nome" }, { 1, "João" }, { 2, "Maria" } }
  Local n,x,y := 0
  Alert("Array inicial: " + VarInfo("aDados", aDados))

  // Acessar elementos
  Alert("Nome: " + aDados[1])
  Alert("Idade: " + cValToChar(aDados[2]))

  // Alterar valor
  aDados[2] := 31
  Alert("Idade alterada: " + cValToChar(aDados[2]))

  // Adicionar elemento
  AAdd(aDados, "Programador")
  Alert("Array após adição: " + VarInfo("aDados", aDados))

  // Percorrer array
  Local cLista := ""
  For n := 1 To Len(aDados)
    cLista += cValToChar(aDados[n]) + ", "
  Next
  Alert("Elementos: " + cLista)

  Alert("Cabeçalho: " + aMatriz[1][1] + ", " + aMatriz[1][2])
  Alert("Primeiro registro: " + cValToChar(aMatriz[2][1]))

  // Alterando dados na matriz
  aMatriz[2][2] := "Beatriz"
  Alert("Matriz após alteração: " + VarInfo("aMatriz", aMatriz))

  //Funções de array
  aNumeros := { 1, 2, 3 }
  AAdd(aNumeros, 4) // Adiciona elemento
  ADel(aNumeros, 2) // Remove o elemento na posição 2
  ASize(aNumeros, Len(aNumeros) - 1) // Redimensiona o array
  Alert("Array de números: " + VarInfo("aNumeros", aNumeros))

  // Bloocos de código
  bDobrar := {|x| x * 2}
  Alert("Dobro de 5: " + cValToChar(Eval(bDobrar, 5))) //10

  // Bloco aplicado em arrray - quadrado de cada elemento
  aQuadrados := { 1, 2, 3, 4, 5 }
  bQuadrado := {|x| x * x}

  For x:= 1 To Len(aQuadrados)
    aQuadrados[x] := Eval(bQuadrado, aQuadrados[x])
  Next

  Alert("Array de quadrados: " + VarInfo("aQuadrados", aQuadrados))

  // Bloco para filtrar elementos - manter apenas pares
  bFiltroPar := {|x| x % 2 == 0}
  aFiltrados := {}

  For y := 1 To Len(aQuadrados)
    If Eval(bFiltroPar, aQuadrados[y])
      AAdd(aFiltrados, aQuadrados[y])
    EndIf
  Next

  Alert("Array filtrado (pares): " + VarInfo("aFiltrados", aFiltrados))
Return
