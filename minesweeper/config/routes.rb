Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, only: %i[index show create]
  root "pages#home"
end
