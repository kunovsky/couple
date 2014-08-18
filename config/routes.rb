Rails.application.routes.draw do
  root to: 'application#index'

  get '/questionnaire' => 'application#index'
  get '/questionnaire/*url' => 'application#index'
  get '/results' => 'application#index'

  post '/score' => "scores#score"


  resources :users do
    resources :actual_responses
  end

  scope 'api' do
    resources :questionnaires do
      resources :questions do
      end
    end
  end
end
