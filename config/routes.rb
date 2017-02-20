Rails.application.routes.draw do
    root "pages#index"
    post "/send_message", to: "pages#send_message"
    get '/work', to: "pages#work"
    get '/photography', to: "pages#photography"
    resources :books, only: [:index, :show]
    get '/contact', to: "pages#contact"
end
