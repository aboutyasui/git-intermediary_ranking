Rails.application.routes.draw do
  devise_for :traders
  devise_for :clients
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  ##店側
  namespace :vendor do
    get '' => 'homes#top',as:'top'
    resources :traders, only: [:show,:edit] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end

  ##顧客側
  namespace :user do
    get 'reviews/new'
                get 'reviews/index'
                get 'reviews/show'
                get 'reviews/edit'
  end

  #topページはapp/views/user/homes/topで設定
  root to:"user/homes#top"
  #aboutページはapp/views/user/homes/aboutで設定
  get 'about'=>'user/homes#about' ,as:'about'
end
