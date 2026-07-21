class RecipesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe.increment!(:total_views) if helpers.logged_in?
    @recipe.increment!(:weekly_views)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.steps.build #renderiza aunque no haya pasos
  end

  # GET /recipes/1/edit
  def edit
    @recipe.steps.build if @recipe.steps.empty?
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @recipe.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @recipe.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_path, notice: "Recipe was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.expect(recipe: [ :name, :description, :image, :total_views, :weekly_views, :total_scores, :score
        #steps_attributes: [:id, :description, :_destroy] #se debe poner en los params el atrinuto de los pasos
        #ya que tiene la relacion uno a muchos, se coloca tambien el id para saberlo en la edicion
 ])
    end
end
