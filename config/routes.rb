Rails.application.routes.draw do
  root to: "notes#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :notes
  devise_for :users
  ActiveAdmin.routes(self)
  get 'home/index'

  get '/get_label_list' => "labels#get_label_list"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
