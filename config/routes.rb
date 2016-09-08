Rails.application.routes.draw do
  resources :orgs, except: :show do
    resources :events
  end

  root "orgs#index"
end
