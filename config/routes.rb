Rails.application.routes.draw do

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

  get 'wineries/search'

  get 'wineries/search_results'

  root "pages#home"
  get "/home" => "pages#home"
  get "/about" => "pages#about"

  get "/travellers/search_results" => "traveller#search_results", :as => "search_traveller"
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
