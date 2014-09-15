class Match < ActiveRecord::Base
  COMPLETED = 'completed'
  REQUIRED_PLAYERS = 2

  has_and_belongs_to_many :users

  before_save :defaults

  validate :validate_users

  def winner
    users.find(winner_id)
  end

  private

  def defaults
    self.status = COMPLETED
  end

  def validate_users
    errors.add(:users, "2 players needed") unless self.users.size == REQUIRED_PLAYERS
  end
end
