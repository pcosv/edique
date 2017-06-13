@project = []

Given(/^o sistema está vazio$/) do

end
Given(/^o projeto "([^"]*)" está no sistema$/) do |project_name|
  Project.create(name: project_name)
end

When(/^eu adiciono o projeto "([^"]*)" no sistema$/) do |project_name|
  @project = Project.all.to_a
  param_proj = {project: {name: project_name}}
  page.driver.post projects_path, param_proj
end


Then(/^o sistema deve possuir um projeto chamado "([^"]*)"$/) do |project_name|
  if(!Project.find_by_name(project_name))
    throw("O objeto não foi armazenado")
  end
end
Then(/^o sistema não armazena nenhum projeto$/) do
  if(!compare_projs(@project, Project.all.to_a))
    throw("Nenhum objeto deveria ser armazenado. #{Project.count - @count} foram adicionados")
  end
end


def compare_projs(p1, p2)
  return false if (!p1 ^ !p2) || (p1.count != p2.count)
  return true if(!p1 && !p2)
  p1.each_with_index do |proj, i|
    return false if(p1[i].attributes != p2[i].attributes);
  end
  return true
end
