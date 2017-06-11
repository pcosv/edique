@projects = []
Given(/^o projeto "([^"]*)" está no sistema$/) do |arg|
  param_proj = {project: {name: arg}}
  post '/projects', param_proj

end

When(/^eu adiciono o projeto "([^"]*)" no sistema$/) do |arg|
  @projects = Project.All
  param_proj = {project: {name: arg}}
  post '/projects', param_proj
end

Then(/^o sistema não armazena nenhum projeto$/) do
  projs = Project.All
  assert compare_projs(projs, @projects)
end


def compare_projs(p1, p2)
  return false if p1.count != p2.count

  equal = true
  p1.each_with_index do |proj, i|
    equal = p1.attributes == p2.attributes
  end
end