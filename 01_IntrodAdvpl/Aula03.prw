#include 'protheus.ch'

/*/{Protheus.doc} CadCliente
  (long_description)
  @type User Function
  @author gabriel.sens
  @since 22/04/2026
  @version 1
  /*/
User Function CadCliente()
  Local oDlg
  Local cNome := ""

  DEFINE MSDIALOG oDlg TITLE "Cadastro de Cliente"
  @ 10,10 SAY "Nome" OF oDlg
  @ 10,40 GET cNome SIZE 100,20 OF oDlg
  ACTIVATE MSDIALOG oDlg CENTER
Return 

/*/{Protheus.doc} IntegraFiscal
(long_description)
@type user function
@author gabriel.sens
@since 22/04/2026
@version 1
/*/
User Function IntegraFiscal()
  RPCSetEnv("01", "ADMIN") // Ambiente e usuário
  // Processamento automático
Return
