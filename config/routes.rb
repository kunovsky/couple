Rails.application.routes.draw do
  root to: 'application#index'
  resources :users

  scope 'api' do
    resources :questions
  end

end
