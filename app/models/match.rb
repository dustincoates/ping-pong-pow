class Match < ActiveRecord::Base
  COMPLETED = 'completed'
  REQUIRED_PLAYERS = 2

  has_and_belongs_to_many :users
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id'

  before_save :defaults

  validate :validate_users, :validate_winner

  private

  def defaults
    self.status = COMPLETED
  end

  def validate_users
    errors.add(:users, "2 players needed") unless self.users.size == REQUIRED_PLAYERS
  end

  def validate_winner
    if winner && !users.include?(winner)
      errors.add(:winner, "Winner is not associated with match")
    end
  end
end
