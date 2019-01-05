Rails.application.routes.draw do
    root "pages#index"
    get '/work', to: "pages#work"
    get '/photography', to: "pages#photography"
    resources :books, only: [:index, :show]
end
