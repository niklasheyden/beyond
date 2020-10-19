class Mission < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :habits, dependent: :destroy
  validates :title, presence: true
end
