module Blog
  class Tagging < ActiveRecord::Base
    self.table_name = 'blog_taggings'

    belongs_to :tag, class_name: "Blog::Tag", inverse_of: :taggings
    belongs_to :post, class_name: "Blog::Post", inverse_of: :taggings

    validates :post, :tag, presence: true
    validates :post_id, uniqueness: { scope: :tag_id }
  end
end

