class ActionSimplesharesController < ApplicationController
  before_action :find_action_simpleshare, only: [:update]
  before_action :find_challenge, only: [:create, :update]

  def create
    @action_simpleshare = ActionSimpleshare.new(simpleshare_params.merge(challenge_id: @challenge.id))

    if @action_simpleshare.save
      redirect_to challenge_path(@challenge), notice: 'Action was successfully created.'
    else
      render 'challenges/show'
    end
  end

  def update
    if @action_simpleshare.update(simpleshare_params)
      redirect_to challenge_path(@challenge), notice: 'Action stub was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def find_action_simpleshare
      @action_simpleshare = ActionSimpleshare.find(params[:id])
    end

    def find_challenge
      @challenge ||= Challenge.find(params[:challenge_id])
    end

    def simpleshare_params
      params.require(:action_simpleshare).permit(:name, :description, :enabled, :challenge_id, :amt, :display_msg, :network_filter_list)
    end
end
