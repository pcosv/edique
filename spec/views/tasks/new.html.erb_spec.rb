require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyString",
      :task_report => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_task_report[name=?]", "task[task_report]"
    end
  end
end
