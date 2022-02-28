Rails.application.routes.draw do

  devise_for :users,controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
  }

devise_for :admins,skip: [:passwords,], controllers: {
  registrations: "admins/registrations",
  sessions: 'admins/sessions'
}
get "/about" => 'homes#about'
  root to: "homes#top"

  scope module: :users do
    resources :users do
      get   "/users/:id/quit" => "users#quit", as: "quit"
      patch "users/:id/out" => "users#out", as: "out"
    resource :relationships, only: [:create, :destroy]
      get 'followings' => "relationships#followings", as: "followings"
      get 'followers' => "relationships#followers", as: "followers"
    end
    resources :games do
      get ":team_id/game_players" => "games#game_players", as: "/play_players"
      get ":team_id/team_results" => "games#team_results", as: "team_results"
      get 'game_comments' => "games#game_comments", as: "game_comments"
      resources :game_comments do
        resource :favorites, only: [:create, :destroy]
      end
    end
    resources :teams do
    resources :players
    end
  end

  namespace :admins do
    resources :users
    resources :games do
      get ":team_id/game_players" => "games#game_players", as: "play_players"
      get ":team_id/team_results" => "games#team_results", as: "team_results"
       get ":team_id/players" => "games#players", as: "game_players"
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
end