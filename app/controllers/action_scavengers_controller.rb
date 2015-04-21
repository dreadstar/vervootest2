class ActionScavengersController < ApplicationController
  before_action :find_action_scavenger, only: [:update]
  before_action :find_challenge, only: [:create, :update]

  def create
    @action_scavenger = ActionScavenger.new(scavenger_params.merge(challenge_id: @challenge.id))

    if @action_scavenger.save
      redirect_to challenge_path(@challenge), notice: 'Action was successfully created.'
    else
      render 'challenges/show'
    end
  end

  def update
    if @action_scavenger.update(scavenger_params)
      redirect_to challenge_path(@challenge), notice: 'Action stub was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def find_action_scavenger
      @action_scavenger = ActionScavenger.find(params[:id])
    end

    def find_challenge
      @challenge ||= Challenge.find(params[:challenge_id])
    end

    def scavenger_params
      params.require(:action_scavenger).permit(:name, :description, :enabled, :challenge_id, :amt, :team, :start_msg, :complete_msg,:seqreveal_flag)
    end
end
