#criar usuário repetido (sistema)
Given(/^o usuário “([^“”]*)” com cpf “([^“”]*)” está cadastrado no sistema$/) do |name_user, cpf_user|
  user = User.new
  user.first_name = name_user.split(" ").first
  user.last_name = name_user.split(" ").last
  user.cpf = cpf_user
  user.save
end

When(/^eu cadastro o usuário “([^“”]*)” com cpf “([^“”]*)”$/) do |name_user, cpf_user|
  param_user = {user: {first_name: name_user.split(" ").first, last_name: name_user.split(" ").last, cpf: cpf_user}}
  post '/users', param_user
end

Then(/^o sistema não cadastra o usuário Dantas Barreto com cpf 123$/) do
  users = User.all
  assert compare_users(users, @users)
end

def compare_user(user1, user2)
  user1.attributes === user2.attributes
end

def compare_users(users1, users2)
  if (users1 === nil || users2 === nil)
    return false
  else
    return false if users1.count != users2.count

    equal = true

    users1.each_with_index do |user,i|
      equal = compare_user(user, users2[i])
    end

    equal
  end
end
