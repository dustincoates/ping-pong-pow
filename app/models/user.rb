class User < ActiveRecord::Base
  has_and_belongs_to_many :matches

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
