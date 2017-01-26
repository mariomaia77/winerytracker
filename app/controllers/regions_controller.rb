class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find_by :id => params[:id]
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new region_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @region.region_img = req['public_id']
    end
    redirect_to region_path ( @region )
  end


  def edit
    @region = Region.find_by :id => params[:id]
  end

  def update
    @region = Region.find_by :id => params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @region.region_img = req['public_id']
    end
     @region.assign_attributes( region_params )
    if @region.save
      redirect_to @region
     else
        render :edit
    end
  end

    def destroy
      region = Region.find_by :id => params[:id]
      region.destroy
      redirect_to regions_path()
    end

    def search
      @regions = Region.all
      redirect_to regions_search_result_path
    end

    def search_result
      @regions = Region.all
      @region = Region.find_by :id => params[:id]

    end

    # def search
    #   @regions = Region.all
    #   redirect_to regions_search_result_path
    # end
    #
    # def search_results
    #   @regions = Region.all
    #   @region = Region.find_by :id => params[:id]
    # end


    private
      def region_params
        params.require(:region).permit(:name, :location, :vintages, :region_img, :region_description, :region_varieties, :region_event )
      end





  # def search
  # end
  #
  # def search_result
  # end
end
