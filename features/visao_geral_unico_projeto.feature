Feature: Ter uma visão geral do projeto
	As a membro de um projeto
	I want to ter uma visão geral do progresso do projeto
	So that eu possa tomar decisões sobre o futuro do projeto baseado em seus deadlines e as atividades a serem feitas
	 
	Scenario: Tela de Visão Geral com atividades nos três campos (GUI) 
		Given eu estou logado como o usuário "Robertson"
		And o projeto "Educação Política de Mafagafos" está em andamento com data de entrega "01/04/2017" e está com os membros "Robertson" e "Bruce" atribuídos a ele
		
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar palestra da escola de mafagafos" atribuída ao participante "Robertson" e data de entrega "15/03/2017"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Preparar a cartilha sobre os perigos de regimes ditatoriais" atribuída ao participante "Bruce" e data de entrega "10/03/2017"
		And O projeto "Educação Política de Mafagafos" possui a tarefa "Levar as cartilhas para impressão" sem participantes atribuídos e data de entrega "15/03/2017"
		
		When eu entro na tela de visão geral do projeto "Educação Política de Mafagafos"
		
		Then eu devo ver a data de entrega "01/04/2017"
		And eu devo ver a tarefa "Preparar palestra da escola de mafagafos" atribuída no campo de "Minhas atividades"
		And eu devo ver a tarefa "Preparar a cartilha sobre os perigos de regimes ditatoriais" atribuída no campo de "Outras atividades"
		And eu devo ver a tarefa "Levar as cartilhas para impressão" atribuída no campo de "Atividades ociosas"