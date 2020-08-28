class User < ApplicationRecord
    has_many :lists
    has_secure_password
end
