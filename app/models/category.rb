class Category < ApplicationRecord
  belongs_to :user
  has_many :missions
  validates :title, presence: true
  validates :color, presence: true
end
