Rails.application.routes.draw do
    root "pages#index"
    post "/send_message", to: "pages#send_message"
end
