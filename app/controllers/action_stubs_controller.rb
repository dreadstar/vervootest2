class ActionStubsController < ApplicationController
  before_action :set_action_stub, only: [:show, :edit, :update, :destroy]

  # GET /action_stubs
  # GET /action_stubs.json
  def index
    @action_stubs = ActionStub.all
  end

  # GET /action_stubs/1
  # GET /action_stubs/1.json
  def show
  end

  # GET /action_stubs/new
  def new
    @action_stub = ActionStub.new
    @action_stub.challenge_id= params[:challenge_id]
  end

  # GET /action_stubs/1/edit
  def edit
  end

  # POST /action_stubs
  # POST /action_stubs.json
  def create
    @action_stub = ActionStub.new(action_stub_params)

    respond_to do |format|
      if @action_stub.save
        format.html { redirect_to @action_stub, notice: 'Action stub was successfully created.' }
        format.json { render action: 'show', status: :created, location: @action_stub }
      else
        format.html { render action: 'new' }
        format.json { render json: @action_stub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_stubs/1
  # PATCH/PUT /action_stubs/1.json
  def update
    respond_to do |format|
      if @action_stub.update(action_stub_params)
        format.html { redirect_to @action_stub, notice: 'Action stub was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @action_stub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_stubs/1
  # DELETE /action_stubs/1.json
  def destroy
    @action_stub.destroy
    respond_to do |format|
      format.html { redirect_to action_stubs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_stub
      @action_stub = ActionStub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_stub_params
      params.require(:action_stub).permit(:name, :description, :enabled, :challenge_id, :amt, :heir, :heir_type)
    end
end
