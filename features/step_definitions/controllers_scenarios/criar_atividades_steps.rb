@tasks = []

Given(/^o sistema tem o projeto "([^"]*)"$/) do |project_name|
  Project.create(name: project_name)
end

When(/^eu crio a atividade "([^"]*)" no projeto "([^"]*)"$/) do |task_name, project_name|
  @project = Project.all.to_a
  param_proj = {project: {name: project_name}}
  Task.create(project_id: param_proj, name: task_name)
end

Then(/^a atividade "([^"]*)" não tem nenhum responsável alocado$/) do |task_name|
  Task.find_by_name(project_name)

end

