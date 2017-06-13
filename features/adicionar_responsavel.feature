Feature: parking space reminder
 	As a membro de um projeto
	I want to atribuir responsáveis a uma atividades
	So that todos possam ver quem está responsável por quais tarefas

	@ignore
 	Scenario: Adicionar responsável a atividade ociosa (Sistema)
   		Given O projeto "Educação política para mafagafos" possui uma atividade "Preparar palestra"
		And a atividade "Preparar palestra" não possui responsável
		And o usuário "Robertson Novelino" é membro do projeto "Educação política para mafagafos"
		And "Robertson" está cadastrado no sistema
		When eu adiciono "Robertson Novelino" como responsável da atividade "Preparar palestra"
		Then a atividade "Preparar palestra" tem "Robertson Novelino" como responsável

	@ignore
 	Scenario: Adicionar mais de um responsável a uma atividade (Sistema)
   		Given O projeto "Educação política para mafagafos" possui uma atividade "Preparar palestra"
		And o usuário "Robertson" é membro do projeto "Educação política para mafagafos"
		And o usuário "Mariana" é membro do projeto "Educação política para mafagafos"
		And a atividade "Preparar palestra" possui o responsável “Robertson”
		And "Mariana" está cadastrada no sistema
		When eu adiciono o usuário “Mariana” como responsável da atividade “Educação política para mafagafos”
		Then a atividade “Preparar palestra” tem “Mariana” como responsável
		And a atividade “Preparar palestra” mantém “Robertson” como responsável

	@ignore
 	Scenario: Scenario: Adicionar responsável a atividade (GUI)
   		Given Eu vejo a atividade "Preparar palestra" na lista "Atividades ociosas" do projeto "Educação política para mafagafos"
		And o campo de responsável da atividade "Preparar palestra" está vazio
		And "Robertson Novelino" está cadastrado no sistema
		When eu entro na tela de edição da atividade "Preparar palestra"
		And eu seleciono o usuário "Robertson Novelino" como responsável da atividade "Preparar palestra"
		Then eu vejo o usuário "Robertson Novelino" como responsável da atividade "Preparar palestra"

	@ignore
	Scenario: Adicionar mais de um responsável a uma atividade  (GUI)
		Given Eu vejo a atividade "Preparar palestra" na lista "Demais atividades" do projeto "Educação política para mafagafos"
			And o campo de responsável da atividade "Preparar palestra" está com "Robertson"
		And "Mariana" está cadastrada no sistema
		When eu entro na tela de edição da atividade "Preparar palestra"
		And eu seleciono o usuário "Mariana" como responsável da atividade "Preparar palestra"
		Then eu vejo os usuários "Robertson" e "Mariana" como responsáveis da atividade "Preparar palestra" 
