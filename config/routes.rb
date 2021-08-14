Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "payment", to: "billets#payment"
    end 
  end

  get 'home/index'
  post 'home/criar_boleto'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
