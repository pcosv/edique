
Given(/^Eu vejo a atividade "([^"]*)" na lista "([^"]*)" do projeto "([^"]*)"$/) do |task_name, list, project_name|
  visit '/tasks'

  #Criar o projeto X -> Criar uma atividade A -> Colocar A na lista O de X

  param_proj = {project: {name: project_name}}
  post '/projects', param_proj
  visit '/projects'
  page.should have_content project_name

  param_task = {task: {name: task_name}}
  post '/tasks', param_task
  visit '/tasks'
  page.should have_content task_name



end


Given(/^o campo de responsável da atividade "([^"]*)" está vazio$/) do |task_name|
  visit '/tasks'

  #Procuranto um elemento
  element = find("input", text: task_name)
  assert element == null

end


#Given(/^"([^"]*)" está cadastrado no sistema$/) do |user_name|
#Presenta nos testes de Controller


When(/^eu entro na tela de edição da atividade "([^"]*)"$/) do |taks|
  visit 'tasks/:id/edit'
end


When(/^eu seleciono o usuário "([^"]*)" como responsável da atividade "([^"]*)"$/) do |name, taks|
  visit '/tasks'
end


Then(/^eu vejo o usuário "([^"]*)" como responsável da atividade "([^"]*)"$/) do |name,task|

end


