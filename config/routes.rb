Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users,only: [:new,:create,:show,:edit,:update,:favorite]
  resources :sessions, only: [:new, :create, :destroy]
  root :to => 'users#new'
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
