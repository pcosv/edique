Given(/^eu estou logado como o usuário "([^"]*)"$/) do |user_name|
	visit logout_path
	user = User.find_by_first_name("Bruno")
	user.delete

	u = User.create(first_name: user_name, last_name:"Barbosa", cpf:"04771475423", email:"brunobt94@gmail.com", password:"i<3apple")
	login_params = {session: {email:"brunobt94@gmail.com", password:"i<3apple"}, commit: "Log in"}
	page.driver.post login_path, login_params
	visit projects_path
end

Given(/^O projeto "([^"]*)" possui a tarefa "([^"]*)" atribuída ao participante "([^"]*)" e data de entrega "([^"]*)"$/) do |project_name, task_name, user_name, task_final_date_str|

	task_final_date = get_date_from_str(task_final_date_str)
	task = create_new_task(task_name, false, task_final_date)

	user = User.find_by_first_name(user_name)
	add_user_to_task(user, task)

	proj = Project.find_by_name(project_name)
	add_task_to_proj(task, proj)
end

Given(/^O projeto "([^"]*)" possui a tarefa "([^"]*)" sem participantes atribuídos e data de entrega "([^"]*)"$/) do |project_name, task_name, task_final_date_str|

	task_final_date = get_date_from_str(task_final_date_str)
	task = create_new_task(task_name, false, task_final_date)

	proj = Project.find_by_name(project_name)
	add_task_to_proj(task, proj)
end

When(/^eu entro na tela de visão geral do projeto "([^"]*)"$/) do |project_name|
	proj = Project.find_by_name(project_name)
	# puts proj
	visit project_path(id: proj)
end

Then(/^eu devo ver a data de entrega "([^"]*)"$/) do |final_date|
	page.should have_content(final_date)
end

Then(/^eu devo ver a tarefa "([^"]*)" atribuída no campo de "([^"]*)"$/) do |task_name, tasks_field_name|
	well = page.find('.well', text: tasks_field_name)
	well.should have_content(task_name)
end

def add_user_to_task(user, task)
	task.users << user
	task.save
end