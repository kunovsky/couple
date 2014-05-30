Rails.application.routes.draw do
  root to: 'application#index'
  
  post '/score' => "scores#score"

  resources :users do
    resources :actual_responses
  end

  scope 'api' do
    resources :surveys do
      resources :questions do
        resources :possible_responses
      end
    end
  end
end
