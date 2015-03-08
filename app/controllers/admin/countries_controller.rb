class Admin::CountriesController < Admin::BaseController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  # GET /admin/countries
  # GET /admin/countries.json
  def index
    @countries = Country.all
  end

  # GET /admin/countries/1
  # GET /admin/countries/1.json
  def show
  end

  # GET /admin/countries/new
  def new
    @country = Country.new
  end

  # GET /admin/countries/1/edit
  def edit
  end

  # POST /admin/countries
  # POST /admin/countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to [:admin, @country], notice: 'Country was successfully created.' }
        format.json { render action: 'show', status: :created, location: @country }
      else
        format.html { render action: 'new' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/countries/1
  # PATCH/PUT /admin/countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to [:admin, @country], notice: 'Country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/countries/1
  # DELETE /admin/countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :code)
    end
end
