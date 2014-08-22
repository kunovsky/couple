Rails.application.routes.draw do
  root to: 'application#index'

  get '/questionnaire' => 'application#index'
  get '/questionnaire/*url' => 'application#index'
  get '/results' => 'application#index'
  get '/logout' => 'sessions#destroy'

  resources :sessions
  resources :users do
    resources :actual_responses
    resources :completed_questionnaires
  end

  scope 'api' do
    resources :relationships do
    post '/score' => 'relationships#score'
    get '/results/:id' => 'relationships#results'
    end
    resources :questionnaires do
      resources :questions do
      end
    end
  end
end
