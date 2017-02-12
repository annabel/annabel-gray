Rails.application.routes.draw do
    root "pages#index"
    post "/send_message", to: "pages#send_message"
    get '/work', to: "pages#work"
    get '/photography', to: "pages#photography"
    get '/books', to: "pages#books"
    get '/contact', to: "pages#contact"
end
