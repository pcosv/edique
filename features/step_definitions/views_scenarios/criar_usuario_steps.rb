#criar usuário repetido gui
Given(/^eu vejo o usuário “([^“”]*)”  de cpf “([^“”]*)” na página de usuários cadastrados no sistema$/) do |user, cpf_user|
  param_user = {user: {first_name: user.split(" ").first, last_name: user.split(" ").last, cpf: cpf_user}}
  post '/users', param_user
  visit '/users'
  page.should have_content user
  page.should have_content email_user
end

When(/^eu seleciono a opção de cadastrar novo usuário$/) do
  click_on("New User")
end

When(/^eu insiro as informações “([^“”]*)” e cpf “([^“”]*)” nos campos de cadastro$/) do |user, email_user|
  fill_in "First name", with: user.split(" ").first
  fill_in "Last name", with: user.split(" ").last
  fill_in "Email", with: email_user
  click_button("Create User")
end

Then(/^aparece na tela uma mensagem “([^“”]*)”$/) do |message|
  page.find('div', text: message)
end
