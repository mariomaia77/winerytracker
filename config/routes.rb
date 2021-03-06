Rails.application.routes.draw do

  get 'directions/index'

  get 'directions/show'

  get 'directions/new'

  get 'directions/create'

  get 'directions/update'

  get 'directions/destroy'

  get 'regions/index'

  get 'regions/show'

  get 'regions/new'

  get 'regions/edit'

  get 'regions/search'

  get 'regions/search_result'

  get 'wineries/index'

  get 'wineries/show'

  get 'wineries/new'

  get 'wineries/edit'

  get 'wineries/search'

  get 'wineries/search_results'

  get 'wineries/index'

  get 'wineries/show'

  get 'wineries/new'

  get 'wineries/edit'

  # get 'wineries/search'

  # get 'wineries/search_results'

  root "pages#home"
  get "/home" => "pages#home"
  get "/about" => "pages#about"

  get "/wineries/searches" => "wineries#searches", :as => "search_wine"
  get "/wineries/search" => "wineries#search", :as => "search_wineries"
  get "/regions/search" => "regions#search", :as => "search_regions"
  get "/regions/search" => "region#search", :as => "search_region"
  get "/travellers/search_results" => "travellers#search_results", :as => "search_traveller"
  get "/travellers/additional_info" => "travellers#additional_info", :as => "additional_info_traveller"
  get "/travellers/edit" => "travellers#edit", :as => "edit_traveller"
  resources :travellers, :except =>[:edit]
  #Creates the CRUD urls for me (but ignoring EDIT)

  resources :wineries, :regions
  # this will allow you to have links and paths to wineries and regions

  get "/login" => "session#new", :as => "login"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"


end
