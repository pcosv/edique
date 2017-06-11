Given(/^eu estou na tela do projeto "([^"]*)"$/) do |project_name|
	proj = Project.find_by_name(project_name)
	visit "/#{proj.id}"
end

When(/^eu abro as opções do projeto$/) do
	options_selector = "a[href='#options-modal']"
	find(options_selector).click
end

When(/^clico em "([^"]*)"$/) do |button_name|
	click_link_or_button(button_name)
end

Then(/^devo ver a tela com a lista de projetos$/) do
	assert_current_path("/")
end

Then(/^eu devo ver a mensagem de que o projeto foi arquivado$/) do
	page.should have_css(".alert")
end

Then(/^o projeto "([^"]*)" não é exibido na lista de projetos$/) do |project_name|
	page.should have_no_content(project_name)
end