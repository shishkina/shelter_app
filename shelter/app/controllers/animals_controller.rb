class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @comment = Comment.new
    @comment.animal_id = @animal.id
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.find(params[:id])
    @animal.save
    redirect_to animal_path
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to animal_path
  end

  private
  def animal_params
    params.require(:animal).permit(:animal_name, :type, :age, :image_url, :story, :status)
  end

end
