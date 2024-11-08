class PetsController < ApplicationController
    def index
    @pets = Pet.all
    @pets.each do |pet|
      puts pet.name
      puts pet.breed
      puts pet.age
      puts pet.bio
    end
  end

  def new
  end

  def create
    input_name = params[:pet_name]
    input_breed = params[:pet_breed]
    input_age = params[:pet_age]
    input_bio = params[:pet_bio]
    @pet_add = Pet.create(name: input_name, breed: input_breed, age: input_age, bio: input_bio)
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

    puts "*" * 100
    puts "params[:pet_breed]"
    puts params[:pet_breed].inspect
    puts "*" * 100
    @pet.breed = params[:pet_breed]

    puts "*" * 100
    puts "params[:pet_age]"
    puts params[:pet_age].inspect
    puts "*" * 100
    @pet.age = params[:pet_age]

    puts "*" * 100
    puts "params[:pet_bio]"
    puts params[:pet_bio].inspect
    puts "*" * 100
    @pet.bio = params[:pet_bio]
    @pet.save

    puts "*" * 100
    puts "params"
    puts params.inspect
    puts "*" * 100
    
    redirect_to "/pets/#{@pet.id}"

  end

  def destroy
    @pet = Pet.find_by(id: params[:id])
    @pet.destroy
    redirect_to "/pets"
  end

  # Action for rendering the signup form
  def new_signup
    @pet = Pet.new
  end

  # New action for handling user signup
  def signup
    @pet = Pet.new(pet_params)
    if @pet.save
      render json: @pet, status: :created
    else
      render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # New action for handling user login
  def login
    @pet = Pet.find_by(name: params[:name])
    if @pet&.authenticate(params[:password])
      render json: @pet, status: :ok
    else
      render json: { errors: 'Invalid name or password' }, status: :unauthorized
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :breed, :bio, :password, :password_confirmation)
  end
end
