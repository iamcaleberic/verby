Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # skip registrations for superusers
  devise_for :superusers, :skip => [:registrations]
    as :superuser do
    get 'superusers/edit' => 'devise/registrations#edit', :as => 'edit_superuser_registration'
    put 'superusers' => 'devise/registrations#update', :as => 'superuser_registration'
  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :writers

  resources :publications do
    member do
      put "like", to: "publications#upvote"
      put "dislike", to: "publications#downvote"
    end
  end

  get 'archives/:id' => "publications#archives", :as => 'archives_path'

  resources :comments, :only => [:create, :destroy] do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end

  get 'static/guide'
  get 'static/about'
  get 'static/terms'

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unauthorized"
  get "/500", :to => "errors#internal_server"
  get '/403',  :to => "errors#illegal"

end
