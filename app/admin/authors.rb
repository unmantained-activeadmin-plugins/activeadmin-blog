ActiveAdmin.register Blog::Author do
  menu parent: "Blog", label: "Authors"
  permit_params :first_name, :last_name, :bio
    
  index do
    column :first_name
    column :last_name
    default_actions
  end

  filter :first_name
  filter :last_name

  form do |f|
    f.inputs "Author Details" do
      f.input :first_name
      f.input :last_name
      f.input :bio
    end
    f.actions
  end
end

