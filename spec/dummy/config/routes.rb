Rails.application.routes.draw do
  mount DbAdmin::Engine => "/db_admin"
end
