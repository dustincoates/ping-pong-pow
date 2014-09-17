require 'rails_helper'

RSpec.describe "matches/show", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :status => "Status",
      :winner => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/1/)
  end
end
