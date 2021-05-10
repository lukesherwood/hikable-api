class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :lists, dependent: :destroy
  has_many :hikes, through: :lists
  has_many :reviews
  include Devise::JWT::RevocationStrategies::JTIMatcher
end
