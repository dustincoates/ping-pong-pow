class Match < ActiveRecord::Base
  COMPLETED = 'completed'
  REQUIRED_PLAYERS = 2

  has_and_belongs_to_many :users

  before_save :defaults

  validate :validate_users

  def winner
    users.find(winner_id)
  end

  def set_winner(user)
    return false unless users.include?(user)
    winner = user.id
  end

  private

  def winner=(user_id)
    self.winner_id = user_id
    self.save
  end

  def defaults
    self.status = COMPLETED
  end

  def validate_users
    errors.add(:users, "2 players needed") unless self.users.size == REQUIRED_PLAYERS
  end
end
