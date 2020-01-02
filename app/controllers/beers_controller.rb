class BeersController < ProtectedController
  before_action :set_beer, only: [:show, :update, :destroy]

  # GET /beers
  def index
    @beers = current_user.beers.all.order('id DESC')
    
    render json: @beers
  end
  
  # GET /beers/1
  def show
    render json: @beer
  end
  
  # POST /beers
  def create
    @beer = current_user.beers.new(beer_params)
    
    if @beer.save
      render json: @beer, status: :created, location: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /beers/1
  def update
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /beers/1
  def destroy
    @beer.destroy
  end
  
  # OPEN BEER DATABASE USING HTTPARTY
  def search_beer
    search_beer = params.require(:search)
    render json: HTTParty.get("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&q=#{search_beer}&rows=30&facet=style_name&facet=cat_name&facet=name_breweries&facet=country")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = current_user.beers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def beer_params
      params.require(:beer).permit(:name, :description, :brewery, :rating, :location, :beer_type)
    end
end
