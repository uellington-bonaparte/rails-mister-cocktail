class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show delete]

  def index
    @cocktails = Cocktail.all
  end

  def show
    # @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "#{@cocktail.name} was successfully created."
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to cocktails_path, notice: "#{@cocktail.name} was successfully deleted."
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
