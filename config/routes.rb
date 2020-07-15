Rails.application.routes.draw do
    namespace :api do
        namespace :v0 do
            resources :movies, only: [:index]
        end
    end
end
