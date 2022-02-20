Rails.application.routes.draw do

get "/about" => 'homes#about'
  root to: "homes#top"


  scope module: :users do
    resources :games do
      resources :game_comments do
        resource :favorites, only: [:create, :destroy]
      end
    end
    resources :teams do
    resources :players
    end
  end

  namespace :admins do
    resources :games do
      get ":team_id/game_players" => "games#game_players", as: "play_players"
      get ":team_results_id/team_results" => "games#team_results", as: "team_results"
      resources :game_comments do
        resource :favorites, only: [:create, :destroy]
      end
    end
    resources :teams do
      resources :players, only: [:index, :edit, :create, :update, :destroy, :new] do
        resources :game_players
      end
      resources :game_teams
      resources :team_results
    end
  end
devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
  }

devise_for :admins,skip: [:passwords,], controllers: {
  registrations: "admins/registrations",
  sessions: 'admins/sessions'
}
end