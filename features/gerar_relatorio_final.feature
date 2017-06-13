Feature: Gerar relatório final
	As a membro de um projeto
	I want to reunir todos os relatórios de atividades em um só documento ao final do projeto em uma ordem definida por mim 
	So that possa ter uma visão geral do projeto compilada para facilitar na submissão do edital

	@ignore
	Scenario: Gerar relatório de projeto com atividades com relatório individual preenchido (GUI)
		Given o projeto "Educação política para mafagafos" existe no sistema
		And o projeto "Educação política para mafagafos" possui a atividade "Preparar palestra"
		And a atividade "Preparar palestra" tem relatório individual preenchido com "Deu bom"
		And o projeto "Educação política para mafagafos" possui a atividade "Imprimir apostilas"
		And a atividade "Imprimir apostilas" tem relatório individual preenchido com "Deu ruim"
		When eu vou à página do projeto "Educação política para mafagafos"
		And eu seleciono a opção de relatório final
		Then eu sou levado à página de relatório final do projeto "Educação política para mafagafos"
		And eu posso ver um item de relatório da atividade "Preparar palestra" com conteúdo "Deu bom"
		And eu posso ver um item de relatório da atividade "Imprimir apostilas" com conteúdo "Deu ruim"

	@ignore
	Scenario: Gerar relatório de projeto sem atividades com relatório individual preenchido (GUI)
		Given o projeto "Educação política para mafagafos" existe no sistema
		And o projeto "Educação política para mafagafos" possui a atividade "Preparar palestra"
		And a atividade "Preparar palestra" não possui relatório individual preenchido
		When eu vou à página do projeto "Educação política para mafagafos"
		And eu seleciono a opção de relatório final
		Then eu recebo um aviso que diz "Não há atividades com relatórios individuais para gerar um relatório final"

	@ignore
	Scenario: Gerar relatório de projeto sem atividades (GUI)
		Given o projeto "Amigos do Batman" existe no sistema
		And o projeto "Amigos do Batman" não possui atividades
		When eu vou à página do projeto "Amigos do Batman"
		And eu seleciono a opção de relatório final
		Then eu recebo um aviso que diz "Não há atividades com relatórios individuais para gerar um relatório final"
