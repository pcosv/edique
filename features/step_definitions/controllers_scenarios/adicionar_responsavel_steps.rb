Given(/^O projeto "([^"]*)" possui uma atividade "([^"]*)"$/) do |project_name, task_name|

  param_proj = {project: {name: project_name}}
  post '/projects', param_proj
  visit '/projects'
  page.should have_content project_name

  param_task = {task: {name: task_name}}
  post '/tasks', param_task
  belongs_to :project
  visit '/tasks'
  page.should have_content task_name

end

Given(/^a atividade "([^"]*)" não possui responsável$/) do |task_name|
  param_proj = {project: {name: project_name}}

end


Given(/^o usuário "([^"]*)" é membro do projeto "([^"]*)"$/) do |user_name, project_name|


end

Given(/^"([^"]*)" está cadastrado no sistema$/) do |user_name|

  param_user = {user: {first_name: user_name.split(" ").first, last_name: user_name.split(" ").last}}
  post '/users', param_user
  visit '/users'
  page.should have_content user

end

When(/^eu adiciono "([^"]*)" como responsável da atividade "([^"]*)"$/) do |user_name, task_name|


end

Then(/^a atividade "([^"]*)" tem "([^"]*)" como responsável$/) do |task_name, user_name|


end