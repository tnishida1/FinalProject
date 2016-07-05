class OwnerUsersController < ApplicationController
  before_action :set_owner_user, only: [:show, :edit, :update, :destroy]

  # GET /owner_users
  # GET /owner_users.json
  def index
    @owner_users = OwnerUser.all
  end

  # GET /owner_users/1
  # GET /owner_users/1.json
  def show
  end

  # GET /owner_users/new
  def new
    @owner_user = OwnerUser.new
  end

  # GET /owner_users/1/edit
  def edit
  end

  # POST /owner_users
  # POST /owner_users.json
  def create
    @owner_user = OwnerUser.new(owner_user_params)

    @owner_user.owner_id = params[:owner_id]

    respond_to do |format|
      if @owner_user.save
        format.html { redirect_to @owner_user, notice: 'Owner user was successfully created.' }
        format.json { render :show, status: :created, location: @owner_user }
      else
        format.html { render :new }
        format.json { render json: @owner_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owner_users/1
  # PATCH/PUT /owner_users/1.json
  def update
    respond_to do |format|
      if @owner_user.update(owner_user_params)
        format.html { redirect_to @owner_user, notice: 'Owner user was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner_user }
      else
        format.html { render :edit }
        format.json { render json: @owner_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owner_users/1
  # DELETE /owner_users/1.json
  def destroy
    @owner_user.destroy
    respond_to do |format|
      format.html { redirect_to owner_users_url, notice: 'Owner user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner_user
      @owner_user = OwnerUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_user_params
      params.require(:owner_user).permit(:owner_id, :user_id)
    end
end
