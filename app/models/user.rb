class User < ActiveRecord::Base
  TIME_FRAMES = 2.weeks.ago
  has_and_belongs_to_many :matches

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  def recent_matches
    matches.where("created_at >= ?", TIME_FRAMES)
  end

  def wins_in_recent_matches
    recent_matches.select { |match| match.winner == self }.count
  end
end
