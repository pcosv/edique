Feature: Ter uma visão geral de todos os projetos
	As a membro da ONG Politiquê
	I want to ter uma visão geral do progresso de todos os projetos da Politiquê
	So that eu possa planejar os projetos futuros da ONG

	@ignore
	Scenario: Visualizar visão geral de projetos (GUI)
		Given O projeto "Educação Política de Mafagafos" está em andamento com data de entrega "01/04", está com os membros "Robertson" e "Bruce" atribuídos a ele
		# And O projeto "Educação Política de Mafagafos" está com progresso "50"%
		And O projeto "Edital amigos do Batman" está em andamento com data de entrega "25/12", está com os membros "Diana" e "Bruce" atribuídos a ele
		# And O projeto "Edital amigos do Batman" está com progresso "10"%
		When eu entro na tela de Visão Geral
		Then Eu devo ver o projeto "Educação Política de Mafagafos" com membros atribuídos "Robertson" e "Bruce"
		# And Eu devo ver o projeto "Edital amigos do Batman" com membros atribuídos "Diana" e "Bruce", e progresso "10"%
		And Eu devo ver o projeto "Edital amigos do Batman" com membros atribuídos "Diana" e "Bruce"