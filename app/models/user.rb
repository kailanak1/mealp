class User < ApplicationRecord
    has_many :friendships 
    has_many :friends, through: :friendships 

    has_many :follows, class_name: "Friendship", foreign_key: "friend_id"
    has_many :followers, through: :follows, source: :user 

    has_many :posts 

    validates :name, presence: true
    validates :name, uniqueness: true

    has_secure_password
    has_secure_password :recovery_password, validations: false

    acts_as_commontator
end
