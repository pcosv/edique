	Feature: Entrar
		As a membro da ONG Politiquê
		I want to entrar no sistema usando email e senha
		So that eu possa começar minha sessão com segurança

		Scenario: Impedir clientes deslogados de acessar os projetos
			Given o projeto "Edital Amigos do Batman" está no sistema
			Given eu não estou logado
			When eu vou à página do projeto "Edital Amigos do Batman"
			Then eu sou mandado à página de login

		Scenario: Entrada no sistema (GUI)
			Given o usuário "Bruce" está cadastrado com email "bruce@not.batman.com" senha "Martha"
			And eu não estou logado
			When eu vou à página de login
			And eu preencho o email "bruce@not.batman.com"
			And eu preencho a senha com "Martha"
			And eu clico no botão de submeter login
			Then eu devo ser mandado à visão geral de projetos
			And eu devo ver "Bruce" no indicador de usuário
