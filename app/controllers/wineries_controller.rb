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
    redirect_to winery_path ( @winery )
  end

  def edit
    @winery = Winery.find_by :id => params[:id]
  end

  def update
    @winery = Winery.find_by :id => params[:id]
     if @winery.update( winery_params )
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


    private
      def winery_params
        params.require(:winery).permit(:email, :website, :name, :winery_image, :winery_location, :winery_pitch, :winery_description, :cellar_door, :restaurant, :must_try_wines)
      end
  end

  # def search
  # end
  #
  # def search_results
  # end
