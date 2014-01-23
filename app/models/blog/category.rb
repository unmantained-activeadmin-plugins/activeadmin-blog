module Blog
  class Category < ActiveRecord::Base
    self.table_name = 'blog_categories'

    has_many :posts, class_name: "Blog::Post", inverse_of: :category

    validates :name, presence: true
    validates :name, uniqueness: true

    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

    scope :sorted_alphabetically, -> { order('name') }
  end
end

