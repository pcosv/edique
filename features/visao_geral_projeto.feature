Feature: Ter uma visão geral do projeto (3) - BB
	As a membro de um projeto
	I want to ter uma visão geral do progresso do projeto
	So that eu possa tomar decisões sobre o futuro do projeto baseado em seus deadlines e as atividades a serem feitas

	@ignore
	Scenario: Tela de Visão Geral (GUI) 
		Given eu estou logado como o usuário "Robertson"
		And O projeto "Educação Política de Mafagafos" está em andamento com data de entrega "01/04" com participantes "Bruce", "Robertson" e "Nicol Bolas"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar palestra da escola de mafagafos" atribuída aos participantes "Robertson" e "Bruce" e data de entrega "15/03"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar a cartilha sobre a importância do engajamento político" atribuída ao participante "Robertson" e data de entrega "10/03"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar a cartilha sobre os perigos de regimes ditatoriais" atribuída ao participante "Nicol Bolas" e data de entrega "10/03"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Levar as cartilhas para impressão" sem participantes atribuídos e data de entrega "15/03"
		When eu entro na tela de visão geral do projeto "Educação Política de Mafagafos"
		Then eu devo ver a data de entrega "01/04" 
		And eu devo ver o participante "Bruce" com 1 tarefa atribuída
		And eu devo ver o participante "Nicol Bolas" com 1 tarefa atribuída
		And eu devo ver o participante "Robertson" com 2 tarefas atribuídas
		And eu devo ver a tarefa "Preparar palestra da escola de mafagafos" em "Minhas Tarefas" com participantes "Robertson" e "Bruce" e data de entrega "15/03"
		And eu devo ver a tarefa "Preparar a cartilha sobre a importância do engajamento político" em "Minhas Tarefas" com participantes "Robertson" e "Bruce" e data de entrega "10/03"
		And eu devo ver a tarefa "Preparar a cartilha sobre os perigos de regimes ditatoriais" em "Tarefas Ativas" com participante "Nicol Bolas" e data de entrega "10/03"
		And eu devo ver a tarefa "Levar as cartilhas para impressão" em "Tarefas Pendentes" sem participantes e com data de entrega "15/03"