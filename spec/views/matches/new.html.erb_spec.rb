require 'rails_helper'

RSpec.describe "matches/new", :type => :view do
  before(:each) do
    assign(:match, Match.new(
      :status => "MyString",
      :winner => 1
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_status[name=?]", "match[status]"

      assert_select "input#match_winner[name=?]", "match[winner]"
    end
  end
end
