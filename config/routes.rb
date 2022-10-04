Rails.application.routes.draw do
  get 'homes/top'
  devise_for :traders
  devise_for :clients
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  
  #topページはapp/views/homes/topで設定
  root to:"homes#top"
end
