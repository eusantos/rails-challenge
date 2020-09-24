Rails.application.routes.draw do
  root :to => redirect("/charges")

  get "/charges", to: "charges#index"
  
  resources :charges
  resources :customers

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
