ActiveAdmin.register Post do
  permit_params :title, :body, :author
end
