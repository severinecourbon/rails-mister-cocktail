class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]

  def new

    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(dose_params[:ingredient_id])
    # @dose.save!
    # redirect_to cocktail_path(@cocktail)


    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail), notice: 'Restaurant was successfully created.' }
        # format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end


  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy!
    redirect_to cocktail_path(@cocktail)

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
     @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
