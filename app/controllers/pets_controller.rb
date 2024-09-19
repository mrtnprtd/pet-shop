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

    puts "*" * 100
    puts "params[:pet_name]"
    puts params[:pet_name].inspect
    puts "*" * 100
    @pet.name = params[:pet_name]

    puts "params[:pet_breed]"
    puts params[:pet_breed].inspect
    puts "*" * 100
    @pet.breed = params[:pet_breed]

    puts "*" * 100
    puts "params[:pet_age]"
    puts params[:pet_age].inspect
    puts "*" * 100
    @pet.age = params[:pet_age]
    @pet.save

    puts "*" * 100
    puts "params"
    puts params.inspect
    puts "*" * 100
    
    redirect_to "/pets/#{@pet.id}"

  end

  def destroy
    @pet = Pet.find_by(id: pet_id)
    @pet.destroy
    redirect_to "/pets"
  end
end
