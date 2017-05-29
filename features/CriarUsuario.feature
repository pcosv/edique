Feature: Criar um novo usuário
	As a administrador do sistema
	I want to criar um novo usuário no sistema
	So that possa ter acesso ao sistema

	@ignore
	Scenario: Cadastrar um usuário repetido no sistema
		Given o usuário “Dantas Barreto” com email “dantinhas22@hotmail.com” está cadastrado no sistema
		When eu cadastro o usuário “Dantas Barreto” com email “dantinhas22@hotmail.com”
		Then o sistema não cadastra o usuário “Dantas Barreto” com email “dantinhas22@hotmail.com”

	@ignore
	Scenario: Cadastrar um usuário repetido no sistema (GUI)
		Given eu vejo o usuário “Dantas Barreto”  de email “dantinhas22@hotmail.com” na página de usuários cadastrados no sistema
		When eu seleciono a opção de cadastrar novo usuário
		And eu insiro as informações “Dantas Barreto” e email “dantinhas22@hotmail.com” nos campos de cadastro
		Then aparece na tela uma mensagem de erro invalidando o cadastro de um usuário já cadastrado
