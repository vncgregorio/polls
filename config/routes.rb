Rails.application.routes.draw do
  get 'poll/:id', :controller => 'polls', :action => 'show'
  post 'poll', :controller => 'polls', :action => 'create'
end
