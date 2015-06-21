Vervootest2::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get "vervoom/home"
  get "vervoom/challenges"
  get "vervoom/users"
  get "vervoom/sponsors"
  get "vervoom/nonprofits"

  resources :roles
  resources :sponsors
  resources :nonprofits

  resources :challenges do
    put '/add_sponsor', to: 'challenges#add_sponsor', as: 'add_sponsor'
    put '/add_nonprofit', to: 'challenges#add_nonprofit', as: 'add_nonprofit'
    put '/remove_sponsor/:id', to: 'challenges#remove_sponsor', as: 'remove_sponsor'
    put '/remove_nonprofit/:id', to: 'challenges#remove_nonprofit', as: 'remove_nonprofit'
    get '/analytics', to: 'challenges#analytics', as: 'analytics'
    get :autocomplete_location_name, :on => :collection
    get :autocomplete_topic_name, :on => :collection

    resources :action_stubs, except: [:index, :create]
    resources :action_scavengers, only: [:create, :update] do
      resources :scavenger_items, except: [:index, :show] do
        put '/add_prereq', to: 'scavenger_items#add_prereq', as: 'add_prereq'
        put '/remove_prereq/:id', to: 'scavenger_items#remove_prereq', as: 'remove_prereq'
        get '/showqr', to: 'scavenger_items#showqr', as: 'showqr'
      end
    end
    resources :action_simpleshares, only: [:create, :update]
  end

  devise_for :users, skip: [:registrations, :passwords]


  devise_scope :user do
    get '/signin' => 'devise/sessions#new'
    delete '/signout' => 'devise/sessions#destroy', as: :signout
    get 'users/edit' => 'devise/registrations#edit', :as => 'profile'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :users, only: [:index, :new, :show, :create, :destroy]

  root :to => "vervoom#home"
end
