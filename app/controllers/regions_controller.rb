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
    redirect_to region_path ( @region )
  end

  def edit
    @region = @current_region
  end

  def update
    @region = @current_region
    if @region.update( region_params )
      redirect_to @region
    else
      render :edit
    end
  end

    def destroy
      region = @current_region
      region.destroy
      redirect_to regions_path()
    end

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