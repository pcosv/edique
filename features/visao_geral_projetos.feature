Feature: Ter uma visão geral de todos os projetos
	As a membro da ONG Politiquê
	I want to ter uma visão geral do progresso de todos os projetos da Politiquê
	So that eu possa planejar os projetos futuros da ONG
 
	Scenario: Visualizar visão geral de projetos (GUI)
		Given o projeto "Educação Política de Mafagafos" está em andamento com data de entrega "01/04/2017" e está com os membros "Robertson" e "Bruce" atribuídos a ele
		And o projeto "Educação Política de Mafagafos" possui a tarefa "Preparar cartilha" como concluída
		And o projeto "Educação Política de Mafagafos" possui a tarefa "Organizar local" como não concluída

		Given o projeto "Edital amigos do Batman" está em andamento com data de entrega "25/12/2017" e está com os membros "Diana" e "Bruce" atribuídos a ele
		And o projeto "Edital amigos do Batman" possui a tarefa "Encontrar foto original" como concluída

		When eu entro na tela de visão geral
		Then Eu devo ver o projeto "Educação Política de Mafagafos" com membros atribuídos "Robertson" e "Bruce", e progresso "50"%
		And Eu devo ver o projeto "Edital amigos do Batman" com membros atribuídos "Diana" e "Bruce", e progresso "100"%
