class User < ActiveRecord::Base
  TIME_FRAMES = 2.weeks.ago
  has_and_belongs_to_many :matches

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  def self.sorted_by_wins(time=TIME_FRAMES)
    all.sort { |a, b|
      b.wins_in_matches(b.time_frame(time)) <=> a.wins_in_matches(a.time_frame(time))
    }
  end

  def time_frame(time)
    if time != 'all'
      recent_matches(time)
    else
      matches
    end
  end

  def recent_matches(time=TIME_FRAMES)
    matches.select { |match| match.created_at > time }
  end

  def wins_in_matches(matches)
    matches.select { |match| match.winner == self }.count
  end

  private

  def win_percentage(wins, total)
    return -1 if total == 0
    wins.to_f / total
  end
end
