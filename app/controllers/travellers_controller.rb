class TravellersController < ApplicationController
  before_action :authorise, :only => [:edit, :update]

  def landing
  end

  def index
    @travellers = Traveller.all
  end

  def show
    @traveller = Traveller.find_by :id => params[:id]
  end

  def new
    @traveller = Traveller.new
  end

  def create
    @traveller = Traveller.new traveller_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @traveller.image = req['public_id']
    end
    if @traveller.save
      session[:traveller_id] = @traveller.id
      # redirect_to traveller_path( @traveller )
      redirect_to additional_info_traveller_path
    else
      render :new
    end
  end

  def additional_info
    @traveller = @current_traveller
    # if @traveller.save
    #   session[:traveller_id] =@traveller.id
    #   redirect_to traveller_path( @traveller )
    # else
    #   render :new
    # end
  end

  def edit
    # @traveller = Traveller.find_by :id => params[:id]
    @traveller = @current_traveller
  end

  def update
      @traveller = @current_traveller
      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        @traveller.image = req['public_id']
      end
      @traveller.assign_attributes( traveller_params )
      if @traveller.save
        redirect_to @traveller
      else
        render :edit
      end
    end

    def destroy
      traveller = @current_traveller
      traveller.destroy
      redirect_to root_path()
    end

    def search
    end

    def search_results
    end

    private
      def traveller_params
        params.require(:traveller).permit(:email, :first_name, :last_name, :password, :password_confirmation, :image, :dob, :phone, :city, :country, :fav_winery, :fav_region, :location)
      end

      def authorise
        unless @current_traveller.present?
        flash[:error] = "You need to be logged in to do that"
        redirect_to login_path()
        end
        # If there is no @current_traveller variable defined
          # Create a temporary error message
          # Redirect them to the login page
      end
end
