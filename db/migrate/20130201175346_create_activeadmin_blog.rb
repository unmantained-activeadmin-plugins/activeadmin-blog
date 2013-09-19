class CreateActiveadminBlog < ActiveRecord::Migration

  def change
    create_table "blog_authors" do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.text     "bio"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "blog_categories" do |t|
      t.string   "name",        null: false
      t.string   "slug",        null: false
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.text     "description"
    end

    create_table "blog_post_relations" do |t|
      t.integer  "post_id",    null: false
      t.integer  "related_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "blog_post_relations", ["post_id"], name: "index_post_relations_on_post_id"
    add_index "blog_post_relations", ["related_id"], name: "index_post_relations_on_related_id"

    create_table "blog_posts" do |t|
      t.string   "slug",                               null: false
      t.string   "title",                              null: false
      t.text     "abstract"
      t.text     "body",                               null: false
      t.integer  "category_id",                        null: false
      t.integer  "author_id",                          null: false
      t.boolean  "sticky",          default: false, null: false
      t.boolean  "visible",         default: false, null: false
      t.datetime "published_at",                       null: false
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
      t.string   "seo_title"
      t.text     "seo_description"
    end

    add_index "blog_posts", ["author_id"], name: "index_posts_on_author_id"
    add_index "blog_posts", ["category_id"], name: "index_posts_on_category_id"

    create_table "blog_taggings" do |t|
      t.integer "post_id", null: false
      t.integer "tag_id",  null: false
    end

    add_index "blog_taggings", ["tag_id"], name: "index_taggings_on_tag_id"

    create_table "blog_tags" do |t|
      t.string  "name",                           null: false
      t.string  "slug",                           null: false
      t.text    "description"
      t.boolean "trending",    default: false, null: false
    end
  end

end

