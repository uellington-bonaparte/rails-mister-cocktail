class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to new_ingredient_path, notice: "#{@ingredient.name} was successfully created."
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    redirect_to new_ingredient_path, notice: "#{@ingredient.name} was successfully deleted."
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
