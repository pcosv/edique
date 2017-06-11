Feature: Encerrar projeto
	As a membro de projeto
	I want to arquivar um projeto após seu término
	So that eu possa me concentrar apenas em projetos que tenham tarefas a fazer 

	Scenario: Encerrar um projeto em andamento (GUI)
		Given o projeto "Ouvir toda a discografia de Pink Floyd" existe no sistema
		And eu estou na tela do projeto "Ouvir toda a discografia de Pink Floyd"
		When eu abro as opções do projeto
		And clico em "Arquivar projeto"
		Then devo ver a tela com a lista de projetos
		And eu devo ver a mensagem de que o projeto foi arquivado
		And o projeto "Ouvir toda a discografia de Pink Floyd" não é exibido na lista de projetos