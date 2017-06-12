Feature: Importar arquivos
  As a membro de um projeto
  I want to importar arquivos do computador e anexá-los a uma atividade
  So that eu possa facilmente encontrar arquivos que são relevantes para essa atividade

  @ignore
  Scenario: Importar arquivo de qualquer formato e anexá-lo à uma atividade (GUI)
    Given eu estou na tela do projeto “Ouvir toda a discografia de Pink Floyd”
    And eu posso ver a atividade “Ouvir álbum Ummagumma"
    When eu clico na atividade “Ouvir álbum Ummagumma”
    And clico em “Anexar arquivo”
    And seleciono o arquivo “Ummagumma.mp3”
    Then vejo uma mensagem de sucesso na inserção do arquivo
