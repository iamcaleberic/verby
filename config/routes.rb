Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server'

  get 'errors/unauthorized'

  root 'home#index'  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :superusers, :skip => [:registrations] 
    as :superuser do
    get 'superusers/edit' => 'devise/registrations#edit', :as => 'edit_superuser_registration'
    put 'superusers' => 'devise/registrations#update', :as => 'superuser_registration'
  end
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :writers
  resources :publications do
    member do
      get :publications
      put "like", to: "publications#upvote"
      put "dislike", to: "publications#downvote"
    end
  end
  resources :comments, :only => [:create, :destroy] do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end

  get 'static/guide'
  get 'static/about'
  get 'static/terms'

end
