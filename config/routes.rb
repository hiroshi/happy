ActionController::Routing::Routes.draw do |map|
  map.resources :happies, :only => [:index, :create]
end
