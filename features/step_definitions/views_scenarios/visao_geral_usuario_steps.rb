Given(/^O usuário "([^"]*)" está cadastrado$/) do |user_name|
	create_new_user(user_name)
end

When(/^Eu entro na tela de perfil de usuário de "([^"]*)"$/) do |user_name|
	user = User.find_by_first_name(user_name)

	visit user_path(user)
end

Then(/^A tela deve mostrar que o usuário "([^"]*)" está no projeto "([^"]*)" com "([^"]*)" tarefas pendentes$/) do |user_name, project_name, pending_tasks|
	page.should have_content(user_name)

	projectRow = page.find('tr', text: project_name).should have_content(pending_tasks) 
end