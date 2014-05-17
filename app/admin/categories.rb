ActiveAdmin.register Blog::Category do
  menu parent: "Blog", label: "Categories"
  permit_params :name, :description
    
  index do
    column :name
    default_actions
  end

  filter :name
  filter :description

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :description
    end
    f.actions
  end
end

