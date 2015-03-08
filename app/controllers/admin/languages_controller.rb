class Admin::LanguagesController < Admin::BaseController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # GET /admin/languages
  # GET /admin/languages.json
  def index
    @languages = Language.all
  end

  # GET /admin/languages/1
  # GET /admin/languages/1.json
  def show
  end

  # GET /admin/languages/new
  def new
    @language = Language.new
  end

  # GET /admin/languages/1/edit
  def edit
  end

  # POST /admin/languages
  # POST /admin/languages.json
  def create
    language_code = params[:language][:code]
  
    if language_code.present? 
      @language = Language.new(language_params)
      @language.name =  ISO::Language.find(language_code).name
      respond_to do |format|
        if @language.save
          format.html { redirect_to [:admin, @language], notice: 'Language was successfully created.' }
          format.json { render action: 'show', status: :created, location: @language }
        else
          format.html { render action: 'new' }
          format.json { render json: @language.errors, status: :unprocessable_entity }
        end
      end
    else 
      respond_to do |format| 
          format.html { redirect_to [:admin, @language], alert: 'Unable to add language. Language Code is nil.' }
         format.json { render json:'Unable to add language.', status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/languages/1
  # PATCH/PUT /admin/languages/1.json
  def update
    respond_to do |format|
      @language.name =  ISO::Language.find(params[:language][:code]).name
      if @language.update(language_params)
        format.html { redirect_to [:admin, @language], notice: 'Language was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/languages/1
  # DELETE /admin/languages/1.json
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to admin_languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit(:code)
    end
end
