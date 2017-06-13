Feature: Ter uma visão geral de um usuário
	As a membro da ONG Politiquê
	I want to visualizar as atividades de projeto alocadas a cada membro
	So that Eu possa ver quais membros estão menos ocupados na hora de alocar a equipe de um projeto
	
	Scenario: Visualizar perfil de usuário (GUI)
	Given O usuário "Robertson" está cadastrado

	And o projeto "Educação Política de Mafagafos" está em andamento com data de entrega "01/04/2017" e está com os membros "Robertson" e "Bruce" atribuídos a ele
	And o projeto "Edital amigos do Batman" está em andamento com data de entrega "01/04/2017" e está com os membros "Robertson" e "Bruce" atribuídos a ele

	And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar a cartilha sobre os perigos de regimes ditatoriais" atribuída ao participante "Robertson" e data de entrega "10/03/2017"
	And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar palestra da escola de mafagafos" atribuída ao participante "Robertson" e data de entrega "13/03/2017"
	And O projeto "Edital amigos do Batman" possui a tarefa "Descobrir quem é o  Batman" atribuída ao participante "Robertson" e data de entrega "20/04/2017"

	When Eu entro na tela de perfil de usuário de "Robertson"
	Then A tela deve mostrar que o usuário "Robertson" está no projeto "Edital amigos do Batman" com "1" tarefas pendentes
	And A tela deve mostrar que o usuário "Robertson" está no projeto "Educação Política de Mafagafos" com "2" tarefas pendentes