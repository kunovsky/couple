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

  get '/questionnaire' => 'application#index'
  get '/questionnaire/*url' => 'application#index'
  get '/results' => 'application#index'

  get '/logout' => 'sessions#destroy'

  root to: 'application#index'

end
