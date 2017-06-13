Given(/^o projeto "([^"]*)" existe no sistema$/) do |proj_name|
  project = Project.new
  project.name = proj_name
  project.start_date = Date.today
  project.final_date = Date.today
  project.save
end

Given(/^o projeto "([^"]*)" possui a atividade "([^"]*)"$/) do |proj_name, task_name|
  proj = Project.find_by_name(proj_name)
  t = proj.tasks.new(name: task_name, final_date: Date.today)
  t.save
end

Given(/^a atividade "([^"]*)" tem relatório individual preenchido com "([^"]*)"$/) do |task_name, report_text|
  task = Task.find_by_name(task_name)
  task.task_report =  report_text
  task.save
end

Given(/^o projeto "([^"]*)" não possui atividades$/) do |arg|
  #Não faz nada
end


Given(/^a atividade "([^"]*)" não possui relatório individual preenchido$/) do |arg|
  #Não faz nada
end

When(/^eu vou à página do projeto "([^"]*)"$/) do |proj_name|
  proj = Project.find_by_name(proj_name)
  visit "/#{proj.id}"
end

When(/^eu seleciono a opção de relatório final$/) do
  find("#project-name").click
  within "#options-modal" do
    click_link_or_button("Gerar relatório")
  end
end

Then(/^eu sou levado à página de relatório final do projeto "([^"]*)"$/) do |proj_name|
  proj = Project.find_by_name(proj_name)
  assert_current_path("/#{proj.id}/report")
end

Then(/^eu posso ver um item de relatório da atividade "([^"]*)" com conteúdo "([^"]*)"$/) do |activity_name, content|
  page.should(have_content(activity_name))
  page.should(have_content(content))
end

Then(/^eu recebo um aviso que diz "([^"]*)"$/) do |arg|
  page.should(have_content(arg))
end