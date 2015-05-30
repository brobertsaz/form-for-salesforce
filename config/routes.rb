TestingForm::Application.routes.draw do

  resources :contacts
  root "pages#home"

  get "/home", to: "pages#home", as: "home"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

end
