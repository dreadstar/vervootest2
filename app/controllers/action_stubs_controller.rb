class ActionStubsController < ApplicationController
  before_action :set_action_stub, only: [:show, :edit, :update, :destroy]
  before_action :find_challenge, except: [:index]

  def show
    @action_type = @action_stub.action_type
  end

  def new
    @action_type = params[:action_type]
    @action_stub = generate_action_stub
  end

  def edit
    @action_type = @action_stub.action_type
  end

  def destroy
    @action_stub.destroy
    flash[:notice] = 'Action was successfully deleted'
    redirect_to challenge_path(@challenge)
  end

  private

    def set_action_stub
      @action_stub = ActionStub.find(params[:id])
    end

    def find_challenge
      @challenge ||= Challenge.find(params[:challenge_id])
    end

    def generate_action_stub
      if @action_type == 'simpleshare'
        @action_stub = ActionSimpleshare.new(challenge: @challenge)
      else
        @action_stub = ActionScavenger.new(challenge: @challenge)
      end
    end
end
