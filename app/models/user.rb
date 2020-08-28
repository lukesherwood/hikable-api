class User < ApplicationRecord
    has_many :lists
    has_many :hikes, through: :lists
    has_secure_password
end
