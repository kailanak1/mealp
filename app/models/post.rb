class Post < ApplicationRecord
    has_many :posts 
    has_many :tags 
    belongs_to :user
end
