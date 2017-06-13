# determinar prazo de atividade após encerramento do projeto (gui)
Given(/^eu posso ver o projeto “([^“”]*)” na página de Projetos Cadastrados no Sistema$/) do |project|
  param_project = {project: {name: project, description: 'Esse projeto é dificílimo!', start_date: '2017-06-02', final_date: '2017-06-02'}}
  post '/projects', param_project
  visit '/projects'
  page.should have_content project
end

Given(/^na página do projeto “([^“”]*)” eu consigo ver a atividade “([^“”]*)”$/) do |project, activity|
  visit '/projects'
  click_on(project)
  page.should have_content activity
end

Given(/^consigo ver que a data final do projeto Ouvir toda a discografia de Pink Floyd está programada para “([^“”]*)”$/) do |final_date|
  # conferir se precisa mesmo do value
  element = find('#finaldate')
  assert element.value == final_date
end

When(/^eu clico na atividade  “([^“”]*)”$/) do |activity|
  click_on(activity)
end

When(/^eu seleciono a data “([^“”]*)” como data final da atividade Ouvir álbum Ummagumma$/) do |date|
  fill_in "Final date", with: date
end

Then(/^aparece uma mensagem de erro na tela indicando que a data está inválida$/) do
  page.find('div', text: "Erro! Insira uma data inválida")
end
