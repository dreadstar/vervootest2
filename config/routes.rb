Vervootest2::Application.routes.draw do
  # resources :action_stubs

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
    resources :action_stubs, except: [:index, :create]
    resources :action_scavengers, only: [:create, :update] do
      resources :scavenger_items, except: [:index, :show]
    end
    resources :action_simpleshares, only: [:create, :update]
  end

  devise_for :users
  root :to => "vervoom#home"
end
