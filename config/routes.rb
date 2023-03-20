Rails.application.routes.draw do

  get '/candidatos/:id/nova-candidatura', to:  'candidatos#newCandidatura'


  resources :curriculos
  resources :entrevistadors
  resources :candidatos do
    resources :candidaturas
  end
  resources :empregadors do
    resources :vaga_de_empregos
  end
  resources :vaga_de_empregos

  resources :vaga_de_empregos do
    collection do
      get 'disponiveis'
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
