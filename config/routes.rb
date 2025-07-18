Rails.application.routes.draw do
  devise_for :users
  
  # マイページ
  get 'profile', to: 'profiles#show', as: :profile
  
  # RESTfulなルーティング
  resources :reading_records
  
  # ルートパスを読書記録一覧に設定
  root "reading_records#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
