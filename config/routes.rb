Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'  #新規登録
  #7章
  resources :users
  post '/signup',  to: 'users#create'
  #8章
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #アカウント有効化に使うリソース (editアクション)
  resources :account_activations, only: [:edit]
  #12 パスワード再設定用リソースを追加する
  resources :password_resets,     only: [:new, :create, :edit, :update]
end