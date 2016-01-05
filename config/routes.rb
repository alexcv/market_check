Rails.application.routes.draw do
  root 'home#show'

  resources :products do

    collection do
      post 'search'
      post 'profitability'
    end
  end
end
