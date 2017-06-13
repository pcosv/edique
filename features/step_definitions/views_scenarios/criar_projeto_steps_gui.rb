Given(/^o usuário "([^"]*)" está cadastrado$/) do |user_name|
  create_new_user(user_name)
end

When(/^eu vou à página de visão geral de projetos$/) do
  visit projects_path
end

And(/^eu clico no botão de novo projeto$/) do
  find(".floating-btn").click()
end

And(/^eu preencho com "([^"]*)" o campo de nome do projeto$/) do |project_name|
  fill_in 'project[name]', :with => project_name
end

And(/^eu clico no botão de selecionar o usuário "([^"]*)" como participante$/) do |user|
  find('label', text: user).click
end

Then(/^eu devo ser mandado à visão geral de projetos$/) do
  assert_current_path(projects_path)
end

And(/^eu preencho o campo de data inicial com "([^"]*)"$/) do |date|
  fill_in 'project[start_date]', :with => date
end

And(/^eu preencho o campo de data final com "([^"]*)"$/) do |date|
  fill_in 'project[final_date]', :with => date
end

And(/^eu devo ver o projeto "([^"]*)"$/) do |project_name|
  page.should(have_content(project_name))
end

And(/^eu clico no botão de submeter projeto$/) do
  find('.btn',text: 'Criar projeto').click
end