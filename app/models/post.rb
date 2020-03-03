class Post < ApplicationRecord
    has_many :comments 
    has_many :tags 
    belongs_to :user

    validates :title, presence: true
    validates :summary, presence: true

end
