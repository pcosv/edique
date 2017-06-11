Feature: Criar projetos
	As a membro da ONG Politiquê
	I want to criar um novo projeto
	So that possa  gerenciar a construção de um novo edital

	@ignore
	Scenario: Adicionar projeto repetido (sistema)
		Given o projeto "Edital Amigos do Batman" está no sistema
		When eu adiciono o projeto "Edital Amigos do Batman" no sistema
		Then o sistema não armazena nenhum projeto

