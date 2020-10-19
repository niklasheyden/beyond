class Habit < ApplicationRecord
  belongs_to :category
  belongs_to :mission
  belongs_to :user
  validates :title, presence: true
end
