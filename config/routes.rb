Rails.application.routes.draw do
  get 'poll/:id', :controller => 'polls', :action => 'show'
  post 'poll', :controller => 'polls', :action => 'create'
  post 'poll/:id/vote', :controller => 'votes', :action => 'create'
end
