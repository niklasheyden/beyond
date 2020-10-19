class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

  # GET /habits
  def index
    @habits = policy_scope(Habit)
  end

  # GET /habits/1
  def show
  end

  # GET /habits/new
  def new
    @habit = Habit.new
    authorize @habit
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits
  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    authorize @habit

    if @habit.save
      redirect_to root_path, notice: 'Habit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /habits/1
  def update
    if @habit.update(habit_params)
      redirect_to root_path, notice: 'Habit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /habits/1
  def destroy
    @habit.destroy
    redirect_to habits_url, notice: 'Habit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habit
      @habit = Habit.find(params[:id])
      authorize @habit
    end

    # Only allow a trusted parameter "white list" through.
    def habit_params
      params.require(:habit).permit(:title, :status, :category_id, :mission_id)
    end
end
