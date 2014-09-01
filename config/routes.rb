Rails.application.routes.draw do

  scope 'api' do
    get '/questionnaires/:id' => 'questionnaires#show'
    post '/invite' => 'invites#create'

    resources :users do
      post 'completed_questionnaires' => 'completed_questionnaires#create'
      post 'actual_responses' => 'actual_responses#create'
      post '/score' => 'users#score'
      get '/results/:id' => 'users#results'
      post '/invite' => 'users#invite'
    end

  end

  resources :sessions

  get '/questionnaire' => 'users#index'
  get '/questionnaire/*url' => 'users#index'
  get '/results' => 'users#index'

  get '/logout' => 'sessions#destroy'

  root to: 'application#index'

end
