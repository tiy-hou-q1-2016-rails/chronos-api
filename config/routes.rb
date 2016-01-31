Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  use_doorkeeper
  namespace :api do
    get 'me' => 'me#show', as: "me"
    get 'me/history' => 'me#history'
    post 'checkin' => 'checkins#checkin'
    post "register" => "registration#create"
  end

end
