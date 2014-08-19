Rails.application.routes.draw do
  root to: 'application#index'

  get '/questionnaire' => 'application#index'
  get '/questionnaire/*url' => 'application#index'
  get '/results' => 'application#index'

  resources :users do
    resources :actual_responses
    resources :completed_questionnaires
  end

  scope 'api' do
    post '/score' => "relationships#score"
    resources :questionnaires do
      resources :questions do
      end
    end
  end
end
