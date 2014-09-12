Rails.application.routes.draw do

  scope 'api' do
    get '/grouping/:id' => 'groupings#show'
    post '/invite' => 'users#invite'
    resources :users do
      post '/completed_questionnaires' => 'completed_questionnaires#create'
      post '/notification' => 'users#notification'
      post '/actual_responses' => 'actual_responses#create'
      post '/score' => 'users#score'
      get '/results/:id' => 'users#results'
      post '/invite' => 'users#invite'
    end

  end

  resources :sessions
  
  get '/invite/:invite_token' => 'sessions#invite'
  get '/grouping' => 'users#index'
  get '/grouping/*url' => 'users#index'
  get '/results' => 'users#index'

  get '/logout' => 'sessions#destroy'

  root to: 'application#index'

end
