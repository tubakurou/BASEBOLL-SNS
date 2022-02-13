Rails.application.routes.draw do
 
  get 'games/index'
  get 'games/show'
  get 'games/edit'
  get 'games/create'
  scope module: :useres do
    resources :teams do
    resources :players
    end
  end
  
  namespace :admins do
    resources :teams, only: [:index, :edit] do
    resources :players, only: [:index, :edit ,:create, :update, :destroy]
    resources :games
    end
  end
  
 get '/about' => 'homes#about'
  root to: 'homes#top'
  
  
devise_for :admins,skip: [:registrations,:passwords,], controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}

  devise_for :users,skip: [:passwords] ,controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
  }
end