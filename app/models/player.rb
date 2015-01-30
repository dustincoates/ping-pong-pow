class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  
  validates uniqueness: :winner, { scope: :match_id }
end
