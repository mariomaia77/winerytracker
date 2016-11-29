class SessionController < ApplicationController
  def new
  end

  def create
      traveller = Traveller.find_by :email => params[:email]

      if traveller.present? && traveller.authenticate( params[:password])
        flash[:success] = "You successfully logged in"
        session[:traveller_id] = traveller.id
        redirect_to travellers_path
      else
        flash[:error] = "The password or email was incorrect"
        render :new
      end
      # We need to find the right traveller (typically using params[:email])
           # We also need to make sure that that traveller exists
         # We need to make sure that the password is correct for that traveller (.authenticate - given us to bcrypt)
         # We need to show some HTML based on whether they were able to log in or not
  end

  def destroy
    session[:traveller_id] = nil
    redirect_to root_path()
      # def destroy means loggin out in this case
  end
end
