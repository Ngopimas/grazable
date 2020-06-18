class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = Animal.all.shuffle
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @animal.update(animal_params)

    redirect_to animal_path(@animal)
  end

  def destroy
    @animal.destroy

    redirect_to root_path
  end

  private

  def set_animal
    @animal = animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :description, :category, :address)
  end
end
