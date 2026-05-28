#include "protheus.ch"
#include "fwmvcdef.ch"

/*/{Protheus.doc} MVC005
(long_description)
@type user function
@author gabrielsens
@since 27/05/2026
@version 1.0
/*/
User Function MVC005()
  Local oBrw := FwMBrowse():New()

  oBrw:SetDescription("Chamados por técnico")
  oBrw:SetAlias("ZZA")

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
  Local oStruZZA := FwFormStruct(1, "ZZA")
  Local oStruZZD := FwFormStruct(1, "ZZD")

  // Cria o objeto do modelo de dados
  Local oModel := MPFormModel():New("MVC005_M", /*bPreValidacao*/, /*bPosValidacao*/, /*bCommit*/, /*bCancel*/)

  // Adiciona ao modelo um componente de formulário
  oModel:AddFields("ZZAMASTER", /*cOwner*/, oStruZZA, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/)

  oModel:AddGrid("ZZDDETAIL", "ZZAMASTER", oStruZZD, /*bLinePre*/, /*bPreVal*/, /*bLoad*/)
  oModel:SetRelation("ZZDDETAIL", { { "ZZD_FILIAL", "xFilial('ZZA')" } }, { { "ZZD_TECNIC", "ZZA_COD" } }, ZZD->(IndexKey(1)))

  // Adiciona a descrição do modelo de dados
  oModel:SetDescription("Chamados por técnico")

  // Adiciona a descrição do componente do modelo de dados
  oModel:GetModel("ZZAMASTER"):SetDescription("Chamados por técnico")

  oModel:GetModel("ZZDDETAIL"):SetOptional(.T.)
  oModel:Activate()
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
  Local oModel := FwLoadModel("MVC005")

  // Cria a estrutura a ser usada na view
  Local oStruZZA := FwFormStruct(2, "ZZA", { |cCpo| AllTrim(cCpo)$'ZZA_COD+ZZA_NOME' })
  Local oStruZZD := FwFormStruct(2, "ZZD")

  // Interface de visualização construída
  Local oView

  oStruZZD:SetNoFolder()

  // Cria o objeto da View
  oView := FWFormView():New()

  // Define qual o modelo de dados a view irá utilizar
  oView:SetModel(oModel)

  // Adiciona no nosso View um controle do tipo formulário
  // antiga Enchoice
  oView:AddField("VIEW_ZZA", oStruZZA, "ZZAMASTER")
  oView:AddField("VIEW_ZZD", oStruZZD, "ZZDDETAIL")

  // Criar um box horizontal para receber algum elemento na view
  oView:CreateHorizontalBox("SUPERIOR", 15)
  oView:CreateHorizontalBox("INFERIOR", 85)

  // Relaciona o identificador (ID) da View com o box para exibição
  oView:SetOwnerView("VIEW_ZZA", "SUPERIOR")
  oView:SetOwnerView("VIEW_ZZD", "INFERIOR")

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
  Local aRotina := {}

  ADD OPTION aRotina TITLE "Vis. Chamados" ACTION 'U_ChamAten(ZZA->ZZA_COD)' OPERATION 1 ACCESS 0

Return (aRotina)

/*/{Protheus.doc} U_ChamAten
(long_description)
@type user function
@author gabrielsens
@since 28/05/2026
@version 1.0
@param cCodAten, character, Codigo do Atendente
/*/
User Function U_ChamAten(cCodAten)
  Local lRetorno := .T.

  If !Empty(cCodAten)
    DbSelectArea("ZZD")
    DbSetOrder(1)

    If DbSeek(xFilial("ZZD") + cCodAten)
      FWExecView(UPPER("Visualizar"), "VIEWDEF.MVC005", 1, /*oDlg*/, /*bCloseOnOk*/, /*bOk*/, /*nPercReducao*/)
    EndIf
  Else
   MsgAlert("Selecione um atendente para visualizar", "Atenção")

Return (lRetorno)
