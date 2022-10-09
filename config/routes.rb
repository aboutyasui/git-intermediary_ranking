Rails.application.routes.draw do
  ##ゲストログイン機能
  devise_scope :client do
    post 'clients/guest_sign_in', to: 'client/sessions#guest_sign_in'
  end
  devise_scope :trader do
    post 'traders/guest_sign_in', to: 'trader/sessions#guest_sign_in'
  end

  #管理者・店・顧客で別々のcontrollerを利用した処理にするため、分けて記載
  #デフォルトで作成されるパスワードのルーティングを省略
  devise_for :traders,skip: [:passwords], controllers: {
    registrations: "trader/registrations",
    sessions: 'trader/sessions'
  }
  devise_for :clients,skip: [:passwords], controllers: {
    registrations: "client/registrations",
    sessions: 'client/sessions'
  }

  #デフォルトで作成されるパスワード＆登録のルーティングを省略
  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

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
    #業者情報
    resources :traders, only: [:show] do
      #collection do
        #get 'show_posts'#投稿確認画面
      #end
      resources :posts, only: [:show] do
        resource :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :edit, :update, :destroy]
      end
    end
    get 'homes'=>'homes#index'
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
    #顧客情報
    resources :clients, only: [:show]
    #投稿
    resources :posts, only: [:new,:index,:create,:show,:edit,:update,:destroy] do
      resources :comments, only: [:index]
    end
  end

  namespace :admin do
    get '' => 'homes#top',as:'top'
    resources :clients, only: [:index,:show,:edit,:update] do
       resources :posts, only: [:show]do
         resources :comments, only: [:edit,:update,:destroy]
      end
    end
    resources :traders, only: [:index,:show,:edit,:update] do
      resources :posts, only: [:show,:edit,:update,:destroy]
    end
  end

  #topページはapp/views/homes/topで設定
  root to:"homes#top"
  #aboutページはapp/views/homes/aboutで設定
  get 'about'=>'homes#about' ,as:'about'
end
