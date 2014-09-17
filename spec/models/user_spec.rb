require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect( create(:user) ).to be_valid
  end

  describe 'validations' do
    let(:valid_params) do
      {
        name: 'Peter Thiel',
        email: 'pt@foundersfund.com'
      }
    end

    it 'is valid with valid params' do
      expect(User.new(valid_params)).to be_valid
    end

    it 'requires a name' do
      expect(User.new(valid_params.except(:name))).to_not be_valid
    end

    it 'requires an email' do
      expect(User.new(valid_params.except(:email))).to_not be_valid
    end

    it 'requires a unique email' do
      User.create(valid_params)
      user = User.new(name: 'Same email', email: valid_params[:email])
      expect(user).to_not be_valid
    end
  end

  describe '#recent_matches' do
    it 'is empty if there are no matches' do
      user = create(:user)
      expect(user.recent_matches).to be_empty
    end

    it 'returns matches within two weeks' do
      match = create(:recent_match)
      user = match.users.last
      expect(user.recent_matches).to_not be_empty
    end

    it 'returns an empty array if no recent matches' do
      match = create(:old_match)
      user = match.users.last
      expect(user.recent_matches).to be_empty
    end
  end

  describe '#wins_in_recent_matches' do
    it 'returns the number of wins' do
      matches = []
      3.times do
        matches << create(:match_with_winner)
      end
      user = matches.first.winner
      user.stub(:recent_matches).and_return(matches)
      expect(user.wins_in_recent_matches).to eql(1)
    end
  end
end
