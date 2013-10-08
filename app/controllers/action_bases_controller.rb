class ActionBasesController < ApplicationController
  before_action :set_action_base, only: [:show, :edit, :update, :destroy]

  # GET /action_bases
  # GET /action_bases.json
  def index
    @action_bases = ActionBase.all
    # @action_bases = ActionBase.find(:all, :conditions => { challenge_id: params[:challenge_id]})
    # @challenge_id= params[:challenge_id]
  end

  # GET /action_bases/1
  # GET /action_bases/1.json
  def show
  end

  # GET /action_bases/new
  def new
    @action_base = ActionBase.new
    @action_base.challenge_id= params[:challenge_id]
  end

  # GET /action_bases/1/edit
  def edit
  end

  # POST /action_bases
  # POST /action_bases.json
  def create
    @action_base = ActionBase.new(action_base_params)

    respond_to do |format|
      if @action_base.save
        # format.html { redirect_to @action_basis, notice: 'Action base was successfully created.' }
        @challenge = Challenge.new
        @challenge.id= @action_base.challenge_id
        format.html { redirect_to edit_challenge_path(@challenge), notice: 'Action base was successfully created.' }
        format.json { render action: 'show', status: :created, location: @action_base }
      else
        format.html { render action: 'new' }
        format.json { render json: @action_base.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_bases/1
  # PATCH/PUT /action_bases/1.json
  def update
    respond_to do |format|
      if @action_base.update(action_base_params)
        format.html { redirect_to @action_base, notice: 'Action base was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @action_base.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_bases/1
  # DELETE /action_bases/1.json
  def destroy
    @action_base.destroy  #was @action_basis
    respond_to do |format|
      format.html { redirect_to action_bases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_base
      @action_base = ActionBase.find(params[:id]) #was @action_basis
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_base_params
      params.require(:action_base).permit(:name, :description, :enabled, :challenge_id, :amt)
    end
end
