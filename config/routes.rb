Rails.application.routes.draw do
  resources :volunteers, :nonprofits, :volunteer_engagements, except: :destroy
end
