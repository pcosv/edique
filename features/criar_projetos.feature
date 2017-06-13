Feature: Criar projetos
	As a membro da ONG Politiquê
	I want to criar um novo projeto
	So that possa  gerenciar a construção de um novo edital


	@ignore
	Scenario: Adicionar projeto (sistema)
		Given o sistema está vazio
		When eu adiciono o projeto "Edital Amigos do Batman" no sistema
		Then o sistema deve possuir um projeto chamado "Edital Amigos do Batman"

	@ignore
	Scenario: Adicionar projeto repetido (sistema)
		Given o projeto "Edital Amigos do Batman" está no sistema
		When eu adiciono o projeto "Edital Amigos do Batman" no sistema
		Then o sistema não armazena nenhum projeto

	@ignore
	Scenario: Adicionar projeto novo (GUI)
		Given o usuário "Bruce" está cadastrado
		And o usuário "Diana" está cadastrado
		When eu vou à página de visão geral de projetos
		And eu clico no botão de novo projeto
		And eu preencho com "Juntar a liga da justiça" o campo de nome do projeto
		And eu clico no botão de selecionar o usuário "Bruce" como participante
		And eu preencho o campo de data inicial com "12-06-2006"
		And eu preencho o campo de data final com "12-06-2005"
		And eu clico no botão de submeter projeto
		Then eu devo ser mandado à visão geral de projetos
		And eu devo ver o projeto "Juntar a liga da justiça"

