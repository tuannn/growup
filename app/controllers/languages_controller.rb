class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :correct_user
  #before_action :load_user
  # GET /languages
  # GET /languages.json
  def index
    #@user = User.find(params[:id])
    @languages = @user.languages.all unless @user.nil?
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
  end

  # GET /languages/new
  def new
    #@user = User.find(params[:id])
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = @user.languages.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to user_language_path(@user, @language), notice: 'Language was successfully created.' }
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to user_language_path(@user, @language), notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to user_languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @user = User.find(params[:user_id])
      @language = @user.languages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit(:name, :note)
    end
    
    def signed_in_user
      redirect_to root_url unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def load_user
      @user = User.find(params[:user_id])
    end
end
