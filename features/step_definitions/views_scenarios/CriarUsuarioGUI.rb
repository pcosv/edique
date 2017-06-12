# #criar usuário repetido gui
# Given(/^eu vejo o usuário “([^“”]*)”  de email “([^“”]*)” na página de usuários cadastrados no sistema$/) do |user, email_user|
#   param_user = {user: {first_name: user.split(" ").first, last_name: user.split(" ").last, email: email_user}}
#   post '/users', param_user
#   visit '/users'
#   page.should have_content user
#   page.should have_content email_user
# end

# When(/^eu seleciono a opção de cadastrar novo usuário$/) do
#   click_on("New User")
# end

# When(/^eu insiro as informações “([^“”]*)” e email “([^“”]*)” nos campos de cadastro$/) do |user, email_user|
#   fill_in "First name", with: user.split(" ").first
#   fill_in "Last name", with: user.split(" ").last
#   fill_in "Email", with: email_user
#   click_button("Create User")
# end

# Then(/^aparece na tela uma mensagem de erro invalidando o cadastro de um usuário já cadastrado$/) do
#   page.find('div', text: "Operação inválida, usuário já cadastrado")
# end


# #criar usuário repetido sistema
# Given(/^o usuário “Dantas Barreto” com email “dantinhas(\d+)@hotmail\.com” está cadastrado no sistema$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When(/^eu cadastro o usuário “Dantas Barreto” com email “dantinhas(\d+)@hotmail\.com”$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then(/^o sistema não cadastra o usuário “Dantas Barreto” com email “dantinhas(\d+)@hotmail\.com”$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# # determinar prazo de atividade sistema
# Given(/^o projeto “([^“”]*)” está cadastrado no sistema$/) do |name_project|
#   pending
# end

# Given(/^o usuário “Carlos” está cadastrado no sistema$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Given(/^o projeto “Ouvir toda a discografia de Pink Floyd” possui a atividade “Ouvir álbum Ummagumma”$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Given(/^o usuário “Carlos” é responsável pela atividade “Ouvir álbum Ummagumma”$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When(/^eu adiciono a data “(\d+)\-(\d+)\-(\d+)” como data final da atividade “Ouvir álbum Ummagumma”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then(/^o sistema armazena a data “(\d+)\-(\d+)\-(\d+)” como data final da atividade “Ouvir álbum Ummagumma”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end


# # determinar prazo de atividade no passado sistema
# Given(/^a data atual do sistema é “(\d+)\-(\d+)\-(\d+)”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then(/^o sistema não armazena a data “(\d+)\-(\d+)\-(\d+)” como data final da atividade “Ouvir álbum Ummagumma”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end


# # determinar prazo de atividade após encerramento do projeto gui
# Given(/^eu posso ver o projeto “([^“”]*)” na página de Projetos Cadastrados no Sistema$/) do |project|
#   # falta atributos date!
#   param_project = {project: {name: project, description: 'Esse projeto é dificílimo!', start_date: , final_date: }}
#   post '/projects', param_project
#   visit '/projects'
#   page.should have_content project
# end

# Given(/^na página do projeto “Ouvir toda a discografia de Pink Floyd” eu consigo ver a atividade “Ouvir álbum Ummagumma”$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Given(/^consigo ver que a data final do projeto “Ouvir toda a discografia de Pink Floyd” está programada para “(\d+)\-(\d+)\-(\d+)”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Given(/^clicando na atividade  “Ouvir álbum Ummagumma” posso ver que o usuário “Carlos” é o seu responsável$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# When(/^eu seleciono a data “(\d+)\-(\d+)\-(\d+)” como data final da atividade “Ouvir álbum Ummagumma”$/) do |arg1, arg2, arg3|
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Then(/^aparece uma mensagem de erro na tela indicando que a data está inválida$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
