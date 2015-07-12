Rails.application.routes.draw do
  get '/' => 'messages#new'
  post '/' => 'messages#create'
  get '/:secret' => 'messages#show'
  patch '/:secret' => 'messages#update'
end
