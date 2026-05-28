#include "protheus.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} MVC004
(long_description)
@type user function
@author gabrielsens
@since 27/05/2026
@version 1.0
/*/
User Function MVC004()
  Local oBrw := FwMBrowse():New()

  oBrw:SetDescription("Cadastro de Chamados")
  oBrw:SetAlias("ZZD")
  oBrw:AddLegend("ZZD_STATUS == '1'", "GREEN", "Aberto")
  oBrw:AddLegend("ZZD_STATUS == '2'", "BLUE", "Em Atendimento")
  oBrw:AddLegend("ZZD_STATUS == '3'", "YELLOW", "Aguardando")
  oBrw:AddLegend("ZZD_STATUS == '4'", "BLACK", "Encerrado")
  oBrw:AddLegend("ZZD_STATUS == '5'", "RED", "Em Atraso")

  oBrw:Activate()

Return()

/*/{Protheus.doc} ModelDef
  (long_description)
  @type  Static Function
  @author gabrielsens
  @since 27/05/2026
  @version 1.0
  @return oModel, oModel, Objeto do Modelo MVC
/*/
Static Function ModelDef()
  // Cria a estrutura a ser usada no modelo de dados
  Local oStruZZD := FwFormStruct(1, "ZZD")

  // Cria o objeto do modelo de dados
  Local oModel := MPFormModel():New("MVC004_M")

  // Adiciona ao modelo um componente de formulário
  oModel:AddFields("ZZDMASTER", /*cOwner*/, oStruZZD)

  // Adiciona a descrição do modelo de dados
  oModel:SetDescription("Cadastro de Chamados")

  // Adiciona a descrição do componente do modelo de dados
  oModel:GetModel("ZZDMASTER"):SetDescription("Cadastro de Chamados")

  // Retorna o modelo de dados
Return (oModel)

/*/{Protheus.doc} ViewDef
  (long_description)
  @type  Static Function
  @author gabrielsens
  @since 27/05/2026
  @version 1.0
  @return (oView), oView, Objeto da View MVC
/*/
Static Function ViewDef()
  // Cria um objeto de modelo de dados baseado no ModelDef() do fonte informado
  Local oModel := FwLoadModel("MVC004")

  // Cria a estrutura a ser usada na view
  Local oStruZZD := FwFormStruct(2, "ZZD")

  // Interface de visualização construída
  Local oView

  // Cria o objeto da View
  oView := FWFormView():New()

  // Define qual o modelo de dados a view irá utilizar
  oView:SetModel(oModel)

  // Adiciona no nosso View um controle do tipo formulário
  // antiga Enchoice
  oView:AddField("VIEW_ZZD", oStruZZD, "ZZDMASTER")

  // Criar um box horizontal para receber algum elemento na view
  oView:CreateHorizontalBox("TELA", 100)

  // Relaciona o identificador (ID) da View com o box para exibição
  oView:SetOwnerView("VIEW_ZZD", "TELA")

// Retorna o objeto da View criado
Return (oView)


/*/{Protheus.doc} MenuDef
  (long_description)
  @type  Static Function
  @author gabrielsens
  @since 27/05/2026
  @version 1.0
/*/
Static Function MenuDef()

Return FWMVCMenu("MVC004")
