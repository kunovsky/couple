Rails.application.routes.draw do

  scope 'api' do
    get '/questionnaires/:id' => 'questionnaires#show'

    resources :users do
      post 'completed_questionnaires' => 'completed_questionnaires#create'
      post 'actual_responses' => 'actual_responses#create'
    end

    resources :relationships do
    post '/score' => 'relationships#score'
    get '/results/:id' => 'relationships#results'
    end
  end

  resources :sessions

  get '/questionnaire' => 'users#index'
  get '/questionnaire/*url' => 'users#index'
  get '/results' => 'users#index'

  get '/logout' => 'sessions#destroy'

  root to: 'application#index'

end
