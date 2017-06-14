Feature: Determinar o prazo de uma atividade
	As a membro de um projeto
	I want to determinar o prazo de uma atividade para qual foi designado
	So that eu possa garantir que o projeto não tenha atrasos

	@ignore
	Scenario: Determinar prazo de entrega de uma atividade (sistema)
		Given o projeto “Ouvir toda a discografia de Pink Floyd” está cadastrado no sistema com data final para “05/05/2020”
		When eu adiciono a data “02/02/2019” como data final da atividade “Ouvir álbum Ummagumma” no projeto “Ouvir toda a discografia de Pink Floyd”
		Then o sistema armazena a data “02/02/2019” como data final da atividade “Ouvir álbum Ummagumma”

	@ignore
	Scenario: Determinar data no passado como prazo de entrega de uma atividade (sistema)
	Given o projeto “Ouvir toda a discografia de Pink Floyd” está cadastrado no sistema com data final para “05/05/2020”
	When eu adiciono a data “02/02/2010” como data final da atividade “Ouvir álbum Ummagumma” no projeto “Ouvir toda a discografia de Pink Floyd”
	Then o sistema não armazena a data “02/02/2010” como data final da atividade “Ouvir álbum Ummagumma”

	@ignore
	Scenario: Determinar data após encerramento do projeto como prazo de entrega de uma atividade (GUI)
		Given eu posso ver o projeto “Ouvir toda a discografia de Pink Floyd” na página de Projetos Cadastrados no Sistema
		And na página do projeto “Ouvir toda a discografia de Pink Floyd” eu consigo ver a atividade “Ouvir álbum Ummagumma”
		And consigo ver que a data final do projeto “Ouvir toda a discografia de Pink Floyd” está programada para “22-03-2018”
		When eu clico na atividade “Ouvir álbum Ummagumma”
		And eu seleciono a data “25-03-2018” como data final da atividade Ouvir álbum Ummagumma
		Then aparece uma mensagem de erro na tela indicando que a data está inválida
