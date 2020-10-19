class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_info, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :missions, dependent: :destroy
end
