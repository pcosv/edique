# determinar prazo de atividade (sistema)
Given(/^o projeto “([^“”]*)” está cadastrado no sistema com data final para “([^“”]*)”$/) do |name_project, date_final|
  project = Project.new
  project.name = name_project
  project.start_date = Date.today
  project.final_date = date_final
  project.save
end

When(/^eu adiciono a data “([^“”]*)” como data final da atividade “([^“”]*)” no projeto “([^“”]*)”$/) do |final_date_task, name_task, name_project|
  project = Project.find_by(name: name_project)
  param_task = {task: {name: name_task, final_date: final_date_task}}
  post "/projects/#{project.id}/tasks", param_task
end

Then(/^o sistema armazena a data “([^“”]*)” como data final da atividade “([^“”]*)”$/) do |date_task, name_task|
  task = Task.find_by(name: name_task)
  date = task.final_date
  assert date == date_task
end


# determinar prazo de atividade no passado sistema
Then(/^o sistema não armazena a data “([^“”]*)” como data final da atividade “([^“”]*)”$/) do |date_task, name_task|
  task = Task.find_by(name: name_task)
  date = task.final_date
  assert !(date == date_task)
end