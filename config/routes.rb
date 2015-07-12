Rails.application.routes.draw do
  get 'messages/new'

  get 'messages/show'

  get '/' => 'messages#new'
  post '/' => 'messages#create'
  get '/:uuid' => 'messages#show'
  patch '/:uuid' => 'messages#update'
end
