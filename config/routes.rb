ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  #map.root :controller => 'pages', :action => 'index'
  
  map.resources :user_sessions
  map.resources :podcasts
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login '/login', :controller => 'user_sessions', :action => 'new'

  #Admin Routes
  map.admin_dashboard 'admin', :controller => 'admin/dashboard', :action => 'index'

  map.namespace(:admin) do |admin|
    admin.resources :users
    admin.resources :podcasts
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
