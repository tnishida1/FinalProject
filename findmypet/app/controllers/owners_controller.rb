class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  def index
    @owners = Owner.all
  end

  # GET /owners/1
  def show
    @pet = @owner.pets.new
  end

  # GET /owners/new
  def new
    @owner = Owner.new

    @owner.pets.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  def create
    @owner = Owner.new(owner_params)
    @image.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable
    @image.user = current_user

    @uploaded_io = params[:image][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @owner.save
      redirect_to @owner, notice: 'Owner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /owners/1
  def update
    if @owner.update(owner_params)
      redirect_to @owner, notice: 'Owner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /owners/1
  def destroy
    @owner.destroy
    redirect_to owners_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:first, :last, :zipcode, pets_attributes: [:name, :claimed])
    end
end
