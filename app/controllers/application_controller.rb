class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user
  
  private
  def fetch_user
    # If in the session hash, there a traveller_id key
      # Find the traveller with that ID and save them in a instance variable called @current_traveller
      # If you weren't able to find a traveller with that ID, set session[:traveller_id] to nil
      @current_traveller = Traveller.find_by :id => session[:traveller_id] if
      session[:traveller_id]
      session[:traveller_id] = nil unless @current_traveller.present?

  end
end
