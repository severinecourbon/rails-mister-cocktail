class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show,:create, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      p @cocktail.errors
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

    # @cocktail.destroy
    # cocktail_path(@cocktail)
  end

  private



  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
