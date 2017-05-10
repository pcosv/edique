Feature: Gerar relatório final
	As a membro de um projeto
	I want to reunir todos os relatórios de atividades em um só documento ao final do projeto em uma ordem definida por mim 
	So that possa ter uma visão geral do projeto compilada para facilitar na submissão do edital

	@ignore
	Scenario: Gerar relatório de projeto com atividades com relatório individual preenchido (Sistema)
		Given O projeto "Educação política para mafagafos" existe no sistema
		And O projeto "Educação política para mafagafos" possui a atividade "Preparar palestra"
		And a atividade "Preparar palestra" tem relatório individual preenchido
		And O projeto "Educação política para mafagafos" possui a atividade "Imprimir apostilas"
		And a atividade "Imprimir apostilas" tem relatório individual preenchido
		When Eu tento gerar um relatório final do projeto "Educação política para mafagafos"
		Then O sistema cria um relatório final composto pelos relatórios individuais da atividade "Preparar palestra" e da atividade "Imprimir apostilas"

	@ignore
	Scenario: Gerar relatório de projeto sem atividades com relatório individual preenchido (Sistema)
		Given O projeto "Amigos do Batman" existe no sistema
		And O projeto "Amigos do Batman" não possui atividades com relatório individual preenchido
		When Eu tento gerar um relatório final do projeto
		Then O sistema não cria um relatório final para o projeto

	@ignore
	Scenario: Gerar relatório de projeto sem atividades (Sistema)
		Given O projeto "Amigos do Batman" existe no sistema
		And o projeto "Amigos do Batman" não possui atividades
		When Eu tento gerar um relatório final do projeto
		Then O sistema não cria um relatório final para o projeto

	@ignore
	Scenario: Gerar relatório de projeto com atividades com relatório individual preenchido (GUI)
		Given Eu estou na tela do projeto "Amigos do Batman"
		And eu posso ver as atividades “descobrir quem é o Batman" e “preparar uma festa de aniversário para Batman” no projeto “Amigos do Batman”
		And eu posso ler o relatório referente a atividade “descobrir quem é Batman"
		And eu posso ler o relatório referente a atividade “preparar uma festa de aniversário para Batman”
		When Eu tento gerar o relatório final do projeto
		And eu seleciono a ordem dos relatórios das atividades
		Then o relatório final é exibido com os relatórios parciais das atividades na ordem em que eu os selecionei

