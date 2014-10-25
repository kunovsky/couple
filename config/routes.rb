Rails.application.routes.draw do

  scope 'api' do
    get '/grouping/:id' => 'groupings#show'
    resources :products, only: [:index, :show]
    resources :invites, only: [:create]
    resources :users do
      resources :actual_responses
      post '/completed_questionnaires' => 'completed_questionnaires#create'
      post '/notification' => 'users#notification'
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
  
  #TODO: simplify so we just have /user and /user/*url
  get '/user' => 'users#index'
  get '/user/*url' => 'users#index'

  get '/results' => 'users#index'
  get '/results/*url' => 'users#index'
  
  get '/resources/' => 'users#index'
  get '/resources/*url' => 'users#index'

  root to: 'application#index'

end