Vervootest2::Application.routes.draw do
  resources :action_stubs

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
    resources :action_stubs, except: [:index, :show]
    resources :action_scavengers, only: [:create], to: 'action_stubs#create'
    resources :action_simpleshares, only: [:create], to: 'action_stubs#create'
  end

  devise_for :users
  root :to => "vervoom#home"
end
