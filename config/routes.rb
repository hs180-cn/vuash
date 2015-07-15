Rails.application.routes.draw do
  get '/' => 'messages#new', as: 'messages'
  post '/' => 'messages#create'
  get '/:id/:secret' => 'messages#confirm', as: 'message'
  delete '/:id/:secret' => 'messages#show'

  root 'messages#new'
end
