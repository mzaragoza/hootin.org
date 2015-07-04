Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      get '/' => 'dashboards#index'
      get '/dashboard' => 'dashboards#index', as: :dashboard
      root :to => 'dashboards#index'
    end
  end

  root 'pages#index'
end
