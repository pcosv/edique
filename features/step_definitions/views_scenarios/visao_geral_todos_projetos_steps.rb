def create_user (name)
	visit('/users/new')
	fill_in('user_first_name', with: name)
	click_button('save')
end

def add_member (member)
	click_button("add_member")
	fill_in("new_member_name", with: member1)
	click_on(member1)
end

Given(/^O projeto "([^"]*)" está em andamento com os membros "([^"]*)" e "([^"]*)" atribuídos a ele$/) do |name, final_date, member1, member2|
	
	# # create users and projects
	# u1 = User(first_name: member1)
	# u2 = User(first_name: member2)
	# p = Project(name: name, final_date: final_date)
	# # add users to the project
	# p.users << u1
	# p.users << u2

	create_user member1
	create_user member2

	# create new project
	visit('/projects/new')
	fill_in("project_name", with: name)
	add_member(member1)
	add_member(member2)
	click_button('save')
	
end

# def create_task (name)
# 	visit('/projects/#{project_id}')
# 	click_button('add_task')
# 	fill_in("task_name", with: name)
# 	click_button("save")
# end

def get_project_id (name)
	p = Project.find_by_name(project)
	project_id = p.project_id
	return project_id
end

# Given(/^O projeto "([^"]*)" está com progresso "([^"]*)"%$/) do |project, progress|
	
# 	# # create tasks
# 	# t1 = Task(name: "Task 1", completed: false)
# 	# t2 = Task(name: "Task 2", completed: true)
# 	# # add tasks to project
# 	# p.tasks << t1
# 	# p.tasks << t2

# 	project_id = get_project_id(project)

# 	create_task("Task 1")
# 	create_task("Task 2")

# 	click_on("Task 1")
# 	click_button("complete_task")

# end

When(/^eu entro na tela de Visão Geral$/) do
	visit('/overview')
end

def check_member_exists (member)
	element = find("p", text: member)
	assert element != nil
end

Then(/^Eu devo ver o projeto "([^"]*)" com membros atribuídos "([^"]*)" e "([^"]*)"&/) do |project, member1, member2|
	
	# get 'div' identified with the project_id
	project_id = get_project_id(project)
	
	within("##{project_id}") do
		check_member_exists(member1)
		check_member_exists(member2)
	end
end