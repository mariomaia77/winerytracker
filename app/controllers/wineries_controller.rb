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
      redirect_to wineries_search_results_path
    end

    def search_results
      @wineries = Winery.all
      @winery = Winery.find_by :id => params[:id]

    end
    # def searches
    #   @start = Winery.find_by(id: params[:start])
    #   @end = Winery.find_by(id: params[:end])
    #
    #   if @start && @end
    #     flash[:success] =
    #    "The distance between <b>#{@start.name}</b> and <b>#{@end.name}</b> is about #{@start.distance_from(@end.to_coordinates).round} km by helicopter."
    #  end
    #   redirect_to wineries_search_results_path
    # end


    private
      def winery_params
        params.require(:winery).permit(:email, :website, :name, :winery_image, :winery_location, :winery_pitch, :winery_description, :cellar_door, :restaurant, :must_try_wines)
      end
  end

  #
  # def search_results
  # end
