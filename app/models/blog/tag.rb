module Blog
  class Tag < ActiveRecord::Base
    self.table_name = 'blog_tags'

    has_many :taggings, class_name: "Blog::Tagging", inverse_of: :tag, dependent: :destroy
    has_many :posts, through: :taggings

    validates :name, presence: true
    validates :name, uniqueness: true

    extend FriendlyId
    friendly_id :name, use: :slugged

    def self.find_or_create!(tag_name)
      Tag.where(name: tag_name).first_or_create
    end

    scope :sorted_alphabetically, -> { order('name') }
    scope :trending, -> { where(trending: true) }
    scope :with_posts, -> { select('blog_tags.*').joins(:posts).group('blog_tags.id').merge(Post.visible) }
    scope :by_usage, -> { with_posts.select('COUNT(blog_tags.id) AS posts_count').order('posts_count DESC') }
    scope :non_trending, -> { where(trending: false) }

    attr_accessible :name, :trending, :description
  end
end

