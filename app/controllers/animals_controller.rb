class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @user = User.find(@animal.user_id)
    @comment = Comment.new
    @comment.animal_id = @animal.id
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new animal_params
    @animal.user_id = current_user.id
    @animal.save
    redirect_to animal_path @animal
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to animal_path
  end
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    # flash.notice = "Animal '#{@animal.animal_name}' DELETED!"
    redirect_to animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:animal_name, :kind, :age, :image, :story, :status, :user_id)
  end

end
