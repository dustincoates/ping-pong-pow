require 'rails_helper'

describe Match do
  it 'has a valid factory' do
    expect( create(:match) ).to be_valid
  end

  describe 'validations' do
    let (:valid_match) {
      Match.new.tap do |match|
        Match::REQUIRED_PLAYERS.times do 
          match.users << create(:user)
        end
      end
    }

    it 'should be valid given valid params' do
      expect(valid_match).to be_valid
    end

    it 'should default to completed status if not specified' do
      valid_match.save
      expect(valid_match.status).to eql(Match::COMPLETED)
    end

    it 'throws errors not than the correct number' do
      match = Match.new
      match.users << create(:user)
      expect(match).to_not be_valid
    end
  end

  describe '#winner' do
    it 'returns the winner of the match' do
      match = create(:match_with_winner)
      expect(match.winner.id).to be_eql(match.winner_id)
    end
  end

  describe '#set_winner' do
    let(:match) { create(:match) }

    it 'returns false if player not involved' do
      user = create(:user)
      expect(match.set_winner(user)).to be_falsey
    end

    it 'sets the winner' do
      winner = match.users.first
      expect(match.set_winner(winner)).to be_truthy
    end
  end
end
