class WineriesController < ApplicationController

  def index
    @wineries = Winery.all
  end

  def show
    @winery = Winery.find_by :id => params[:id]
  end

  def new
    @winery = Winery.new
  end

  def create
    @winery = Winery.new winery_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @winery.winery_image = req['public_id']
    end
    redirect_to winery_path ( @winery )
  end

  def edit
    @winery = Winery.find_by :id => params[:id]
  end

  def update
    @winery = Winery.find_by :id => params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @winery.winery_image = req['public_id']
    end
     @winery.assign_attributes( winery_params )
    if @winery.save
      redirect_to @winery
     else
        render :edit
    end
  end

    def destroy
      winery = Winery.find_by :id => params[:id]
      winery.destroy
      redirect_to wineries_path()
    end

    def search
      @wineries = Winery.all
    end

    def searches
      @from = Winery.find_by(id: params[:from])
      @to = Winery.find_by(id: params[:to])

      if @from && @to
        flash[:success] =
       "The distance between <b>#{@from.name}</b> and <b>#{@to.name}</b> is about #{@from.distance_from(@to.to_coordinates).round} km"
     end
      redirect_to wineries_search_results_path
    end


    private
      def winery_params
        params.require(:winery).permit(:email, :website, :name, :winery_image, :winery_location, :winery_pitch, :winery_description, :cellar_door, :restaurant, :must_try_wines)
      end
  end

  #
  # def search_results
  # end
