Rails.application.routes.draw do
  
  #拠点一覧
   resources :points
      
  # get '/points',  to: 'points#index'
  # get '/points/new',  to: 'points#new'
  # post 'points/', to: 'points#create'
  # get 'points/:id' , to: 'points#show'
  # get 'points/:id/edit', to: 'points#edit' ,as: 'edit_point'
  # patch 'points/:id', to: 'points#update'
  # delete 'points/:id', to: 'points#destroy'
 
  
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
     get    'users/:id/edit_basic_info',to:'users#edit_basic_info',as:'edit_basic_info'
      get 'attendances/edit_one_month' # 勤怠編集ページへのroute。
      patch 'attendances/update_one_month' # 勤怠編集ページ：まとめて更新です。
      patch  'update_by_admin', as: "update_by_admin" #アコーディオン更新
    end
    resources :attendances, only: :update # updateアクション以外のルーティングを制限:updateのみ使うってこと。
  end
end