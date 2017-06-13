Then(/^eu sou mandado à página de login$/) do
  current_path.should == login_path
end

Given(/^eu não estou logado$/) do
  visit(logout_path)
end