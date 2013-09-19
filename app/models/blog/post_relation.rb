module Blog
  class PostRelation < ActiveRecord::Base
    self.table_name = 'blog_post_relations'

    belongs_to :post, class_name: 'Blog::Post'
    belongs_to :related, class_name: 'Blog::Post'

    validates :post, :related, presence: true
    validates :related_id, uniqueness: { scope: :post_id }
  end
end

