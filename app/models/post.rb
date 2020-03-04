class Post < ApplicationRecord
    has_many :comments 
    belongs_to :user
    has_many :posts_tags
    has_many :tags, through: :posts_tags

    validates :title, presence: true
    validates :summary, presence: true

    #code provided by 
    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
      end
      
      def all_tags
        self.tags.map(&:name).join(", ")
      end
      
end
