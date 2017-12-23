Rails.application.routes.draw do
  namespace :api do
    get '/version/' => 'app_versions#crup'
    constraints ApiVersion.new(1) do
      namespace :v1 do
        get '/cars/:slug' => 'cars#show'
      end
    end
  end
end
