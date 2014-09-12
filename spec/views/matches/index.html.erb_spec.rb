require 'rails_helper'

RSpec.describe "matches/index", :type => :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :status => "Status",
        :winner => 1
      ),
      Match.create!(
        :status => "Status",
        :winner => 1
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
