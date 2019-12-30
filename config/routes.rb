Rails.application.routes.draw do
  resources :notes
  devise_for :users
  get 'home/index'
  root to: "notes#index"
  get '/get_label_list' => "labels#get_label_list"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
