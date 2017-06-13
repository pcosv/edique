# Given(/^O usuário "([^"]*)" está cadastrado$/) do |user|
# 	visit '/users/new'
# 	fill_in "cpf", with: "04771475423"
# 	fill_in "first_name", with: user
# 	fill_in "last_name", with: "Barbosa"
# 	fill_in "email", with: "teste@teste.com"
# 	click_button "save"
# end
#
# def create_project (project_name)
# 	visit '/projects/new'
# 	fill_in "project_name", with: project_name
# 	fill_in "description", with: "value"
# end
#
# Given(/^os projetos "([^"]*)" e "([^"]*)" estão cadastrados$/) do |project1, project2|
#
# end