	Feature: Entrar
		As a membro da ONG Politiquê
		I want to entrar no sistema usando email e senha
		So that eu possa começar minha sessão com segurança

		@ignore
		Scenario: Impedir clientes deslogados de acessar os projetos
			Given o projeto "Edital Amigos do Batman" está no sistema
			Given eu não estou logado
			When eu vou à página do projeto "Edital Amigos do Batman"
			Then eu sou mandado à página de login