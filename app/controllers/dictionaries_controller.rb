class DictionariesController < ApplicationController
  before_action :set_dictionary, only: [:show, :edit, :update, :destroy]
  before_action :load_parent
  before_action :load_tag, only: [:new, :edit, :update]
  # GET /dictionaries
  # GET /dictionaries.json
  def index
    if params[:search] && params[:search].strip != ""
      @dictionaries = @language.dictionaries.search(params[:search])
    else
      @dictionaries = @language.dictionaries.all
    end
  end

  # GET /dictionaries/1
  # GET /dictionaries/1.json
  def show
  end

  # GET /dictionaries/new
  def new
    @dictionary = Dictionary.new
  end

  # GET /dictionaries/1/edit
  def edit
  end

  # POST /dictionaries
  # POST /dictionaries.json
  def create
    @dictionary = @language.dictionaries.new(dictionary_params)

    respond_to do |format|
      if @dictionary.save
         #@dictionary.word_tag_relation_ships.create(params[:dictionaris][:tag_id])
          format.html { redirect_to user_language_dictionary_path(@user, @language, @dictionary), notice: 'Dictionary was successfully created.' }
          format.json { render :show, status: :created, location: @dictionary }
      else
        format.html { render :new }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dictionaries/1
  # PATCH/PUT /dictionaries/1.json
  def update
    respond_to do |format|
      if @dictionary.update(dictionary_params)
        format.html { redirect_to user_language_dictionary_path(@user, @language, @dictionary), notice: 'Dictionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @dictionary }
      else
        format.html { render :edit }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dictionaries/1
  # DELETE /dictionaries/1.json
  def destroy
    @dictionary.destroy
    respond_to do |format|
      format.html { redirect_to user_language_dictionaries_url, notice: 'Dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    @grants = Grant.search params[:search]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dictionary
      @dictionary = Dictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dictionary_params
      params.require(:dictionary).permit(:word, :pronunciation, :example, :meaning)
    end
    
    def load_parent
      @user = User.find(params[:user_id])
      @language = @user.languages.find(params[:language_id])
    end
    
    def load_tag
      @tags = Tag.all
    end
end
