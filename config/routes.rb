Rails.application.routes.draw do
  root to: 'application#index'

  resources :users

  scope 'api' do
    resources :surveys do
      resources :questions do
        resources :possible_responses
      end
    end
  end
  
end
