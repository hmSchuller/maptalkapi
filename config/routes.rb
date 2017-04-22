Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
    end
  end

  root to: redirect('/api/v1/messages')
end
