class Match < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players

  def winner
    self.players.find_by(winner: true)
  end
end
