Given(/^o projeto "([^"]*)" está em andamento com data de entrega "([^"]*)", está com os membros "([^"]*)" e "([^"]*)" atribuídos a ele$/) do |project_name, final_date_str, member1, member2|
	proj_final_date = Date.strptime(final_date_str, '%d/%m')
	create_new_proj(project_name, proj_final_date)

	add_member_to_project(member1, project_name)
	add_member_to_project(member2, project_name)
end

Given(/^o projeto "([^"]*)" possui a tarefa "([^"]*)" como concluída$/) do |project_name, task_name|
	proj = Project.find_by_name(project_name)

	proj.tasks << create_new_task(task_name, true)
	proj.save
end

Given(/^o projeto "([^"]*)" possui a tarefa "([^"]*)" como não concluída$/) do |project_name, task_name|
	proj = Project.find_by_name(project_name)

	proj.tasks << create_new_task(task_name, false)
	proj.save
end

When(/^eu entro na tela de visão geral$/) do
	visit '/'
end

Then(/^Eu devo ver o projeto "([^"]*)" com membros atribuídos "([^"]*)" e "([^"]*)", e progresso "([^"]*)"%$/) do |project_name, member1, member2, progress|
	proj = Project.find_by_name(project_name)

	within(:css, "#project-#{proj.id}") do
		page.should have_content(project_name)
		page.should have_css(".progress-bar-success[aria-valuenow='#{proj.progress_percent}']")
	end
end

# Helper methods:
def create_new_proj(project_name, project_final_date)
	proj = Project.new(name: project_name, final_date: project_final_date)
	proj.save
end

def add_member_to_project(member_name, project_name)
	user = User.find_by_first_name(member_name)
	if user == nil
		user = create_new_user(member_name)
	end

	proj = Project.find_by_name(project_name)
	proj.users << user
	proj.save
end

def create_new_user(user_name)
	user = User.new(first_name: user_name, last_name: "")
	user.save

	return user
end

def create_new_task(task_name, completed_val)
	task = Task.new(name: task_name, completed: completed_val)
	task.save

	return task
end


