Rails.application.routes.draw do
  get '/' => 'messages#new', as: 'messages'
  post '/' => 'messages#create'
  get '/:id' => 'messages#show', as: 'message'
  delete '/:id' => 'messages#destroy'
end
