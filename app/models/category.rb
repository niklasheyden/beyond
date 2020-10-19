class Category < ApplicationRecord
  belongs_to :user
  has_many :missions, dependent: :destroy
  has_many :habits, dependent: :destroy
  validates :title, presence: true
  validates :color, presence: true
end
