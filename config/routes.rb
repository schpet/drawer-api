Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: "drawer#index"

  namespace :api do
    resources :documents, only: [:index]
    resource :user, only: [:show]
  end

  get 'request_token', to: 'tokens#request_token'
  get 'access_token', to: 'tokens#access_token'

  match '*all', to: 'application#preflight', via: [:options]
end
