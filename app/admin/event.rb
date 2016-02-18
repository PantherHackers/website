ActiveAdmin.register Event do
  permit_params :title, :body, :start, :end, :author
end
