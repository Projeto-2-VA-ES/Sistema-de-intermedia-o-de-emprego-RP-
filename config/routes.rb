Rails.application.routes.draw do
  resources :candidatos do
    resources :vaga_de_empregos
  end

  resources :empregadors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
