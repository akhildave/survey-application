class Admin::AboutStudiesController < Admin::BaseController
  before_action :set_about_study, only: [:show, :update, :destroy]

  # GET /admin/about_studies
  # GET /admin/about_studies.json
  def index
    @about_studies = AboutStudy.all
  end

  # GET /admin/about_studies/1
  # GET /admin/about_studies/1.json
  def show
  end

  # GET /admin/about_studies/new
  def new
    @about_study = AboutStudy.new
  end

  # GET /admin/about_studies/1/edit
  def edit
    if params[:mission_id] && !params[:mission_id].blank?
      @mission = Mission.find(params[:mission_id])
      @about_study = @mission.about_study
      @about_study = AboutStudy.new if !@mission.about_study.present?
    else
      redirect_to root_path, :alert => "Mission Id cannot be nil."
    end
  end

  # POST /admin/about_studies
  # POST /admin/about_studies.json
  def create
    @about_study = AboutStudy.new(about_study_params)

    respond_to do |format|
      if @about_study.save
        format.html { redirect_to [:admin, @about_study], notice: 'About study was successfully created.' }
        format.json { render action: 'show', status: :created, location: @about_study }
      else
        format.html { render action: 'new' }
        format.json { render json: @about_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/about_studies/1
  # PATCH/PUT /admin/about_studies/1.json
  def update
    respond_to do |format|
      if @about_study.update(about_study_params)
        format.html { redirect_to [:admin, @about_study], notice: 'About study was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @about_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/about_studies/1
  # DELETE /admin/about_studies/1.json
  def destroy
    @about_study.destroy
    respond_to do |format|
      format.html { redirect_to admin_about_studies_url, notice: 'About study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_study
      @about_study = AboutStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_study_params
      params.require(:about_study).permit(:heading, :subheading, :description1, :description2, :description3, :interest, :mission_id, :picture_attributes =>[:id, :image, :filename],  :translations_attributes => [:id, :locale, :heading,:subheading, :description1,:description2,:description3])
    end
end
