#criar usuário repetido gui
Given(/^eu vejo o usuário “([^“”]*)”  de email “([^“”]*)” na página de usuários cadastrados no sistema$/) do |user, email_user|
  param_user = {user: {first_name: user.split(" ").first, last_name: user.split(" ").last, email: email_user}}
  post '/users', param_user
  visit '/users'
  page.should have_content user
  page.should have_content email_user
end

When(/^eu seleciono a opção de cadastrar novo usuário$/) do
  click_on("New User")
end

When(/^eu insiro as informações “([^“”]*)” e email “([^“”]*)” nos campos de cadastro$/) do |user, email_user|
  fill_in "First name", with: user.split(" ").first
  fill_in "Last name", with: user.split(" ").last
  fill_in "Email", with: email_user
  click_button("Create User")
end

Then(/^aparece na tela uma mensagem de erro invalidando o cadastro de um usuário já cadastrado$/) do
  page.find('div', text: "Operação inválida, usuário já cadastrado")
end
