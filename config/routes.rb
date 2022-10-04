Rails.application.routes.draw do

  ##ログイン機能関係
  devise_for :traders
  devise_for :clients
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  ##顧客関係
  namespace :client do
    #会員情報
    resources :users, only: [:show,:edit,:update] do
      collection do
        get 'unsubscribe'#退会確認画面
        patch 'withdraw'#退会処理更新
      end
    end
    #

  end

  ##店側
  namespace :trader do
    #会員情報
    resources :users, only: [:show,:edit,:update] do
      collection do
        get 'unsubscribe'#退会確認画面
        patch 'withdraw'#退会処理更新
      end
      #レビュー関係
      resources :reviews, only: [:new,:create]
    end
    #

  end

  #topページはapp/views/homes/topで設定
  root to:"homes#top"
  #aboutページはapp/views/homes/aboutで設定
  get 'about'=>'homes#about' ,as:'about'
end
