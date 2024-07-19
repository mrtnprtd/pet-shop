class PetsController < ApplicationController
    def index
    @pets = Pet.all
    @pets.each do |pet|
      puts pet.name
      puts pet.breed
      puts pet.age
    end
  end

  def new
  end

  def create
    input_name = params[:pet_name]
    input_breed = params[:pet_breed]
    input_age = params[:pet_age]
    @pet_add = Pet.create(name: input_name, breed: input_breed, age: input_age)
  end

  def show
    pet_id = params[:id]
    @pet = Pet.find_by(id: pet_id)
  end

  def edit
    pet_id = params[:id]
    @pet = Pet.find_by(id: pet_id)
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.name = params[:name]
    @pet.breed = params[:breed]
    @pet.age = params[:age]
    @pet.save
    
    redirect_to "/pets/#{@pet.id}"

  end

  def destroy
    @pet = Pet.find_by(id: pet_id)
    @pet.destroy
    redirect_to "/pets"
  end
end
