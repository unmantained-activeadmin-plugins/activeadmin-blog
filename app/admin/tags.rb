ActiveAdmin.register Blog::Tag do
  menu parent: "Blog", label: "Tags"

  index do
    column :name
    column :trending
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Tag Details" do
      f.input :name
      f.input :trending
      f.input :description
    end
    f.actions
  end
end

