class User < ActiveRecord::Base
  has_many :players
  has_many :matches, through: :players

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
