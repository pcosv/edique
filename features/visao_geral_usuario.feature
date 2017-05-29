Feature: Ter uma visão geral de um usuário
	As a membro da ONG Politiquê
	I want to visualizar as atividades de projeto alocadas a cada membro
	So that Eu possa ver quais membros estão menos ocupados na hora de alocar a equipe de um projeto
	
	@ignore
	Scenario: Visualizar perfil de usuário (GUI)
	Given O usuário "Robertson" está cadastrado
	And os projetos "Edital amigos do Batman" e "Educação política de mafagafos" estão cadastrados
	And o projeto "Edital amigos do Batman" possui as tarefas  "Descobrir quem é o  Batman", "Virar amigo de Batman", "Preparar a festa de aniversário de Batman" e "Encontrar a Bat-Caverna"
	And o projeto "Educação Política de mafagafos"  possui as tarefas  "Preparar palestra da escola de mafagafos", "Preparar o folheto de educação política de mafagafos", "Entrevistar um mafagafo" e "Entrevistar um professor de mafagafos"
	And o usuário "Robertson" está nos projetos "Edital amigos do Batman" e "Educação política de mafagafos"
	And o usuário "Robertson" tem atribuídas a ele no projeto "Edital amigos do Batman" as tarefas pendentes "Descobrir quem é o  Batman", "Virar amigo de Batman" e "Preparar a festa de aniversário de Batman"
	And o usuário "Robertson" tem atribuídas a ele no projeto "Educação Política de mafagafos" as tarefas pendentes "Preparar palestra da escola de mafagafos" e "Preparar o folheto de educação política de mafagafos"
	When Eu entro na tela de perfil de usuário de "Robertson"
	Then A tela deve mostrar que "Robertson" está em "Edital amigos do Batman" com 3 tarefas pendentes
	And A tela deve mostrar que "Robertson" está em  "Educação Política de mafagafos"  com 2 tarefas pendentes