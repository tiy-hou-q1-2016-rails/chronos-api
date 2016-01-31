Rails.application.routes.draw do

  use_doorkeeper
  namespace :api do
    get 'me' => 'me#show', as: "me"
    post 'checkin' => 'checkins#checkin'
  end

end
