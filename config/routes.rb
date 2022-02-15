Rails.application.routes.draw do

get "/about" => 'homes#about'
  root to: "homes#top"

  scope module: :users do
    resources :games do
    resources :game_comments, only: [:create]
    end
    resources :teams do
    resources :players
    end
  end

  namespace :admins do
    resources :games
    resources :teams do
    resources :players, only: [:index, :edit, :create, :update, :destroy, :new]

    resources :game_teams
    end
  end

devise_for :admins,skip: [:registrations,:passwords,], controllers: {
  registrations: "admins/registrations",
  sessions: 'admins/sessions'
}

  devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
  }
end