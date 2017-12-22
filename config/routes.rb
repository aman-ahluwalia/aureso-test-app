Rails.application.routes.draw do
  namespace :api do
    get '/version/' => 'app_versions#crup'
    get '/ping/' => 'ping#ping'
    constraints ApiVersion.new(1) do
      scope :module => :v1 do
        resources :cars, only: [:show] do 
        end
      end
    end
  end
end
