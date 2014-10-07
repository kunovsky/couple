Rails.application.routes.draw do

  scope 'api' do
    get '/grouping/:id' => 'groupings#show'
    resources :invites, only: [:create]
    resources :users do
      post '/completed_questionnaires' => 'completed_questionnaires#create'
      post '/notification' => 'users#notification'
      post '/actual_responses' => 'actual_responses#create'
      post '/score' => 'users#score'
      get '/scores/:id' => 'users#scores'
      get '/content/:id' => 'users#content'
      get '/invite_status' => 'users#invite_status'
    end
  end

  resources :sessions
  
  get '/invite/:invite_token' => 'sessions#invite'
  get '/show_results/:invite_token' => 'sessions#results'
  get '/logout' => 'sessions#destroy'
  

  get '/grouping' => 'users#index'
  get '/grouping/*url' => 'users#index'
  get '/results' => 'users#index'
  get '/results/*url' => 'users#index'

  root to: 'application#index'

end