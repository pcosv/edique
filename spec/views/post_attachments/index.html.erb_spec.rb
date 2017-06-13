require 'rails_helper'

RSpec.describe "post_attachments/index", type: :view do
  before(:each) do
    assign(:post_attachments, [
      PostAttachment.create!(
        :post_id => 2,
        :avatar => "Avatar"
      ),
      PostAttachment.create!(
        :post_id => 2,
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of post_attachments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
