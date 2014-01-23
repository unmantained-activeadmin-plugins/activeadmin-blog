module Blog
  class Author < ActiveRecord::Base
    self.table_name = 'blog_authors'

    has_many :posts, class_name: "Blog::Post", inverse_of: :author

    validates :first_name, :last_name, :bio, presence: true

    scope :sorted_alphabetically, -> { order('first_name, last_name') }

    def full_name
      [ first_name, last_name ].join(" ")
    end
  end
end

