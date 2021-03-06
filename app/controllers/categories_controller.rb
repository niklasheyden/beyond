class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = policy_scope(Category)
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    authorize @category
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    @category.user = current_user
    authorize @category

    if @category.user.missions.count.zero?
      @category.save
      redirect_to new_mission_path(@user), notice: 'Category was successfully created.'
    elsif @category.save
      redirect_to root_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to root_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to root_path, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      authorize @category
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:title, :color)
    end
end
