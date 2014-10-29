class User < ActiveRecord::Base
  TIME_FRAMES = 2.weeks.ago
  has_and_belongs_to_many :matches

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  # def recent_matches
  #   matches.where("created_at >= ?", TIME_FRAMES)
  # end

  # def wins_in_recent_matches
  #   recent_matches.select { |match| match.winner == self }.count
  # end

  def self.sorted_by_wins(time)
    all.sort_by { |a, b| b.wins_in_matches(b.time_frame(time)) <=> a.wins_in_matches(a.time_frame(time)) }
  end

  def time_frame(time)
    if time != 'all'
      recent_matches(time)
    else
      matches
    end
  end

  def recent_matches(time_frame=TIME_FRAMES)
    matches.where("created_at >= ?", time_frame)
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
