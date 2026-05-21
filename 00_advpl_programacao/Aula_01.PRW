//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"


/*/{Protheus.doc} Notas

Rotina de Cálculo de Notas para o Treinamento na Universidade Totvs:

"PROGRAMAÇÃO PARA NÃO PROGRAMADORES"

@author rodrigo.carvalheiro
@since 09/2021
@version 1.0
/*/



//Função principal, chamada para a execução da rotina de notas dos alunos
User Function Notas()


//Variáveis locais
Local cAluno
Local dInsc
Local lAtivo
Local nNotaA
Local nNOtaB
Local nNotaC
Local nMediaRet

//Variáveis Privates, escopo necessário para serem lidas na função Media()
Private nQtdNotas
Private nNotaTot


//Preparar ambiente na filial selecionada
//Necessário quando a função é chamada diretamente do SmartClient e não do menu dentro do Protheus
PREPARE ENVIRONMENT EMPRESA "01" FILIAL "0101"


//Chamada da função para calcular a média das notas
nMediaRet := u_media()


RESET ENVIRONMENT

Return




//Função responsável pelo cálculo da média das notas do aluno
User Function Media()


Local nMedia



Return(nMedia)
