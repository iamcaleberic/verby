Rails.application.routes.draw do
  
  root 'home#index'
  get 'view/index'
  get 'view/show'
  get 'view/index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :superusers, :skip => [:registrations] 
    as :superuser do
    get 'superusers/edit' => 'devise/registrations#edit', :as => 'edit_superuser_registration'
    put 'superusers' => 'devise/registrations#update', :as => 'superuser_registration'
  end
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :writers
  resources :publications
  get 'static/guide'
  get 'static/about'
  get 'static/terms'
  get 'home/index'
  resources :view do
      
    resources :my_publications
    
  end

end
