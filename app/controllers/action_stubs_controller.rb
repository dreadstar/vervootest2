class ActionStubsController < ApplicationController
  before_action :set_action_stub, only: [:show, :edit, :update, :destroy]
  before_action :find_challenge, except: [:index]

  def new
    @action_type = params[:action_type]
    if @action_type == 'simpleshare'
      @action_stub = ActionSimpleshare.new(challenge: @challenge)
    else
      @action_stub = ActionScavenger.new(challenge: @challenge)
    end
  end

  def edit
    @action_stub = ActionStub.find(params[:id])
    @action_type = @action_stub.action_type
  end

  def create
    action_params = params[:action_scavenger].present? ? scavenger_params : simpleshare_params

    @action_stub = create_action(action_params.merge(challenge_id: @challenge.id))

    if @action_stub.save
      redirect_to challenge_path(@challenge), notice: 'Action was successfully created.'
    else
      render 'challenges/show'
    end
  end

  def update
    if @action_stub.specific.update(action_stub_params)
      redirect_to challenge_path(@challenge), notice: 'Action stub was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @action_stub.destroy
    redirect_to challenge_path(@challenge)
  end

  private
    def set_action_stub
      @action_stub = ActionStub.find(params[:id])
    end

    def find_challenge
      @challenge ||= Challenge.find(params[:challenge_id])
    end

    def action_stub_params
      params.require(:action_stub).permit(:name, :description, :enabled, :challenge_id, :amt, :team, :start_msg, :complete_msg, :display_msg, :network_filter_list)
    end

    def scavenger_params
      params.require(:action_scavenger).permit(:name, :description, :enabled, :challenge_id, :amt, :team, :start_msg, :complete_msg)
    end

    def simpleshare_params
      params.require(:action_simpleshare).permit(:name, :description, :enabled, :challenge_id, :amt, :display_msg, :network_filter_list)
    end

    def create_action(action_params)
      if params[:action_scavenger].present?
        ActionScavenger.new(action_params)
      else
        ActionSimpleshare.new(action_params)
      end
    end
end
