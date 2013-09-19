module Blog
  class Post < ActiveRecord::Base
    self.table_name = 'blog_posts'

    belongs_to :category, class_name: "Blog::Category", inverse_of: :posts
    belongs_to :author, class_name: "Blog::Author", inverse_of: :posts

    has_many :taggings, class_name: "Blog::Tagging", inverse_of: :post
    has_many :tags, through: :taggings
    has_many :post_relations, class_name: "Blog::PostRelation", inverse_of: :post
    has_many :related_posts, through: :post_relations, source: :related

    validates :title, :body, :category, :author, :published_at, presence: true
    validate :check_presence_of_featured_image_if_sticky

    extend FriendlyId
    friendly_id :seo_slug_or_title, use: :slugged

    scope :sorted_by_date, -> { order('published_at DESC') }
    scope :sticky, -> { where(sticky: true) }
    scope :matching_query, ->(query) { where("title LIKE :query OR body LIKE :query", query: "%#{query}%") }
    scope :visible, -> { where(visible: true) }
    scope :published, -> { visible.where('published_at < ?', Time.now) }

    has_image :featured_image

    attr_accessible :category_id, :author_id, :title, :abstract, :body, :sticky,
                    :visible, :published_at, :seo_slug, :seo_title, :seo_description,
                    :comma_separated_tags

    def seo_slug
      slug
    end

    def seo_slug=(slug)
      @seo_slug = slug
    end

    def seo_slug_or_title
      @seo_slug.presence || title
    end

    def comma_separated_tags
      tags.map(&:name).join(',')
    end

    def comma_separated_tags=(data)
      self.tags = []
      data.split(/\s*,\s*/).each do |tag_name|
        self.tags << Tag.find_or_create!(tag_name)
      end
    end

    def author_name
      author.full_name
    end

    private

    def check_presence_of_featured_image_if_sticky
      if self.sticky && self.featured_image.nil?
        errors.add(:sticky, "richiede la presenza di una featured image")
      end
    end
  end
end

