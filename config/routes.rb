Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => "users/sessions",
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
        match ":id/update_available_status" => "users#update_available_status", :as => :update_available_status, via: :all
      resources :users do

      end
      get '/' => 'dashboards#index'
      get '/dashboard' => 'dashboards#index', as: :dashboard
      root :to => 'dashboards#index'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :twilio do
        match "/inbound_call" => "twilio#inbound_call", :as => :inbound_call, via: :all
      end
    end
  end
  root 'pages#index'
end
