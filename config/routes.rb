Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create' #急ごしらえ
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
      #HTTPリクエスト	URL	                アクション	名前付きルート
      #GET	          /users/1/following	following	  following_user_path(1)
      #GET	          /users/1/followers	followers	  followers_user_path(1)
    end
  end

  #アカウント有効化に使うリソース (editアクション)
  resources :account_activations, only: [:edit]
  #12 パスワード再設定用リソースを追加する
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #マイクロポストリソースのルーティング
  resources :microposts,          only: [:create, :destroy]
  #Relationshipリソース用のルーティングを追加する
  resources :relationships,       only: [:create, :destroy]
end