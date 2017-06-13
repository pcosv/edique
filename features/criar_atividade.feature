Feature: Criar atividades
	As a membro de um projeto
	I want to criar atividades
	So that possa planejar meu projeto

	@ignore
	Scenario: Atividades sem membros alocados sempre que forem criadas (Sistema)
		Given O sistema tem o projeto "Educação política para mafagafos"
		When eu crio a atividade "Preparar palestra" no projeto "Educação política para mafagafos"
		Then a atividade “Preparar palestra” não tem nenhum responsável alocado

	@ignore
	Scenario: Atividades sem membros alocados sempre que forem criadas (GUI)
		Given Eu vejo o projeto "Educação política para mafagafos"
		When eu entro na tela do projeto "Educação política para mafagafos"
		And eu crio a atividade "Preparar palestra"
		Then eu vejo a atividade “Preparar palestra” sem nenhum responsável alocado