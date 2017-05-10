require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :name => "Name",
        :description => "Description",
        :task_report => "Task Report"
      ),
      Task.create!(
        :name => "Name",
        :description => "Description",
        :task_report => "Task Report"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Task Report".to_s, :count => 2
  end
end
