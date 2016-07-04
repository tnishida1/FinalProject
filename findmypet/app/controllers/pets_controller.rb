class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :destroy]

  # GET owners/:owner_id/pets/new
  # Create a new pet in the context of a Owner object
  # that way the Pet's foreign key (owner_id) will be
  # initialized correctly.
  def new
    # since our the pet new path contains the owner's id
    # we can use params[:owner_id] to get that id
    @owner = Owner.find params[:owner_id]

    # This is similar to Pet.new, BUT it creates the new pet
    # in the context of a Owner object and sets the foreign key
    @pet = @owner.owners.new
  end

  # GET /pets/1/edit
  def edit
    # edit routes are not nested (we already know our owner's foreign_key)
  end

  # POST owners:/:owner_id/pets
  # we need the owner's key in the URL to make sure that someone 
  # isn't trying to hack the id of the new pet's owner
  # rails ensures that the URL has not be tampered with
  def create
    @owner = Owner.find params[:owner_id]
    @pet = @owner.pets.new(pet_params)
    @pet.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable
    @pet.user = current_user

    @uploaded_io = params[:owner][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @pet.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end    

    if @pet.save
      redirect_to owner_pets_url(@owner) , notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pets/1
  # updates don't have to be nested because the owner foreign key is already set
  # and cannot be changed by edit (note that owner_id is not permitted in pet_params())
  def update
    if @pet.update(pet_params)
      redirect_to owner_pets_url(@pet.owner), notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
    redirect_to owner_pets_url(@pet.owner) , notice: 'Pet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :claimed, :owner_id)
    end
end
