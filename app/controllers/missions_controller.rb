class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  # GET /missions
  def index
    @missions = policy_scope(Mission)
  end

  # GET /missions/1
  def show
  end

  # GET /missions/new
  def new
    @mission = Mission.new
    authorize @mission
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions
  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    authorize @mission
    if @mission.save
      redirect_to root_path, notice: 'Mission was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /missions/1
  def update
    if @mission.update(mission_params)
      redirect_to root_path, notice: 'Mission was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /missions/1
  def destroy
    @mission.destroy
    redirect_to missions_url, notice: 'Mission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
      authorize @mission
    end

    # Only allow a trusted parameter "white list" through.
    def mission_params
      params.require(:mission).permit(:title, :category_id)
    end
end
