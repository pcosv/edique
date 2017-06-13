Then(/^eu sou mandado à página de login$/) do
  current_path.should == login_path
end

Given(/^eu não estou logado$/) do
  visit(logout_path)
end


Given(/^o usuário "([^"]*)" está cadastrado com email "([^"]*)" senha "([^"]*)"$/) do |user_name, email, password|
  User.create(first_name: user_name, email: email, password: password)
end

When(/^eu vou à página de login$/) do
  visit login_path
end

And(/^eu preencho o email "([^"]*)"$/) do |email|
  fill_in 'session[email]', with: email
end

And(/^eu preencho a senha com "([^"]*)"$/) do |password|
  fill_in 'session[password]', with: password
end

And(/^eu devo ver "([^"]*)" no indicador de usuário$/) do |user_name|
  page.should(have_content(user_name))
end

And(/^eu clico no botão de submeter login$/) do
  find('#login_button').click
end