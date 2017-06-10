Given(/^o projeto "([^"]*)" existe no sistema$/) do |arg|
  param_proj = {project: {name: arg}}
  post '/', param_proj
end

Given(/^O projeto "([^"]*)" possui a atividade "([^"]*)"$/) do |proj_name, task_name|
  proj = Project.find_by_name(proj_name)
  t = {task:{name:task_name, project:proj.id}}

  post '/tasks', t
end

Given(/^a atividade "([^"]*)" tem relatório individual preenchido com "([^"]*)"$/) do |task_name, report_text|
  task = Task.find_by_name(task_name)
  update = {task_report: report_text}

  put "/tasks/#{task.id}", update
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

When(/^eu seleciono a opção "([^"]*)"$/) do |arg|
  click_link_or_button(arg)
end

Then(/^eu sou levado à página de relatório final do projeto "([^"]*)"$/) do |proj_name|
  proj = Project.find_by_name(proj_name)
  assert_current_path("/#{proj.id}/report")
end

@activity_report_title_class = '.activity'
@activity_report_content_tag = 'p'
Then(/^eu posso ver um item de relatório da atividade "([^"]*)" com conteúdo "([^"]*)"$/) do |arg1, arg2|
  report_el = find(@activity_report_title_class, text: arg1)
  within (report_el) do
    report_content_el = find(@activity_report_content_tag)
    assert(report_content_el == arg2)
  end
end

Then(/^eu recebo um aviso que diz "([^"]*)"$/) do |arg|
  page.should(have_content(arg))
end