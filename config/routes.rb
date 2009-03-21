ActionController::Routing::Routes.draw do |map|
  # hosts
  map.root :controller => "hosts"
  map.resources :hosts, :only => :index
  map.host "host", :controller => "hosts", :action => "show"
  map.host_loader "loader.js", :controller => "hosts", :action => "loader", :format => :js

  map.resource :session, :only => [:new, :create]

  map.resources :happies, :only => [:create]
end
