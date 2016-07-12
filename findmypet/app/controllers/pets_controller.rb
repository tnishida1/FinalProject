class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :destroy]


  def index
    @owners = Owner.all
    @owner = current_user.owner
    
  end
  # GET owners/:owner_id/pets/new
  # Create a new pet in the context of a Owner object
  # that way the Pet's foreign key (owner_id) will be
  # initialized correctly.
  def show
    @pet = Pet.find_by id: params[:id]
  end

  def new
    # if no one is logged in, redirect to loging
    if current_user == nil
        redirect_to new_user_registration_url
    # if somone is logged in but there that user has not created
    # an owner object yet, redirect to the new owner page
    elsif Owner.where(user_id: current_user.id) == nil
        redirect_to new_owner_path
    else
        @owner = current_user.owner
        @pet = @owner.pets.new
        @post = Post.new
	@post_type = params[:post_type]
    end
  end

  # GET /pets/1/edit
  def edit
    # edit routes are not nested (we already know our owner's foreign_key)
  end

  def create
    @owner = Owner.find params[:owner_id]
    @pet = Pet.new(pet_params)
    @pet.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable
    @pet.owner = @owner



    @uploaded_io = params[:pet][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @pet.filename), 'wb') do |file|
        if @uploaded_io != nil
            file.write(@uploaded_io.read)
        else
            @pet.save == false
        end
    end    
    if @pet.save
      post = Post.new
      post.owner = @pet.owner
      post.pet_id = @pet.id
      post.post_type = params[:post_type]
      post.save

      redirect_to pet_url(@pet) , notice: 'Pet was successfully created.'
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
      params.require(:pet).permit(:name, :description, post_attributes: [:post_type])
    end
end
