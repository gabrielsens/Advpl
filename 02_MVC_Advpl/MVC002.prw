#include "protheus.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} MVC002
(long_description)
@type user function
@author gabrielsens
@since 27/05/2026
@version 1.0
/*/
User Function MVC002()
  Local oBrw := FwMBrowse():New()

  oBrw:SetDescription("Cadastro de SLA")
  oBrw:SetAlias("ZZB")

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
  Local oStruZZB := FwFormStruct(1, "ZZB")

  // Cria o objeto do modelo de dados
  Local oModel := MPFormModel():New("MVC002_M")

  // Adiciona ao modelo um componente de formulário
  oModel:AddFields("ZZBMASTER", /*cOwner*/, oStruZZB)

  // Adiciona a descrição do modelo de dados
  oModel:SetDescription("Cadastro de SLA")

  // Adiciona a descrição do componente do modelo de dados
  oModel:GetModel("ZZBMASTER"):SetDescription("Cadastro de SLA")

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
  Local oModel := FwLoadModel("MVC002")

  // Cria a estrutura a ser usada na view
  Local oStruZZB := FwFormStruct(2, "ZZB")

  // Interface de visualização construída
  Local oView

  // Cria o objeto da View
  oView := FWFormView():New()

  // Define qual o modelo de dados a view irá utilizar
  oView:SetModel(oModel)

  // Adiciona no nosso View um controle do tipo formulário
  // antiga Enchoice
  oView:AddField("VIEW_ZZB", oStruZZB, "ZZBMASTER")

  // Criar um box horizontal para receber algum elemento na view
  oView:CreateHorizontalBox("TELA", 100)

  // Relaciona o identificador (ID) da View com o box para exibição
  oView:SetOwnerView("VIEW_ZZB", "TELA")

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

Return FWMVCMenu("MVC002")
