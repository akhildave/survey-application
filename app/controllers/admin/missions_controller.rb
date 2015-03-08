class Admin::MissionsController < Admin::BaseController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  

  # GET /admin/missions
  # GET /admin/missions.json
  def index
    @missions = Mission.all
  end

  # GET /admin/missions/1
  # GET /admin/missions/1.json
  def show 
    available_users
  end

  # GET /admin/missions/new
  def new
    @mission = Mission.new
    @mission.build_about_study
    available_users
  end

  # GET /admin/missions/1/edit
  def edit
    available_users
  end

  # POST /admin/missions
  # POST /admin/missions.json
  def create
    
    @mission = Mission.new(mission_params)
    
    #assign users to mission
    if params[:user_ids].present?
      user = params[:user_ids].delete_if{ |x| x.empty? }
      @mission.users << User.find(params[:user_ids]) 
    end
    
    
    respond_to do |format|
      if @mission.save
        format.html { redirect_to [:admin, @mission], notice: 'Mission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mission }
      else
        format.html { render action: 'new' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/missions/1
  # PATCH/PUT /admin/missions/1.json
  def update

    available_users
    
    #assign users to mission
    if params[:user_ids].present?
      user = params[:user_ids].delete_if{ |x| x.empty? }
      @mission.users = []
      @mission.users << User.find(params[:user_ids])  
    end
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to [:admin, @mission], notice: 'Mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/missions/1
  # DELETE /admin/missions/1.json
  def destroy
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to admin_missions_url, notice: 'Mission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	SEND_FILE_METHOD = :default

	def get_picture

		head(:not_found) and return if (track = Picture.find_by_id(params[:id])).nil?
		#head(:forbidden) and return unless track.downloadable?(current_user) 

		path = track.image.path(params[:style]) 

		head(:bad_request) and return unless File.exist?(path) && params[:format].to_s == File.extname(path).gsub(/^\.+/, '')
		contenttype = MIME::Types.type_for(path).first.content_type # => "image/gif"
		send_file_options = { :type =>  contenttype  }

		case SEND_FILE_METHOD
		  when :apache then send_file_options[:x_sendfile] = true
		  when :nginx then head(:x_accel_redirect => path.gsub(Rails.root, ''), :content_type => send_file_options[:type]) and return
		end

		send_file(path, send_file_options)
	end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:name, :description, :start_date, :end_date, :contact, :country_id, :language_id, :user_ids, :active, :translations_attributes => [:id, :locale, :name, :description], :picture_attributes =>[:id, :image, :filename] )
    end
    
    def available_users  
      @selected_users = @mission.users
      @available_users = User.team_member
      @available_users += User.team_leader
    end
end
