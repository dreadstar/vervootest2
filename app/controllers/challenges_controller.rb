class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
    action_stub= @challenge.action_stubs.build
  end

  def edit
    action_stub= @challenge.action_stubs.build
  end

  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_nonprofit
    @challenge = Challenge.find(params[:challenge_id])
    @nonprofit = Nonprofit.find(params[:nonprofit_id])

    if @nonprofit
      return already_added_error(@nonprofit) if @challenge.nonprofits.include?(@nonprofit)
      @challenge.nonprofits << @nonprofit
      @challenge.save!

      flash[:notice] = "#{@nonprofit.name} was successfully added to this challenge"
      redirect_to challenge_path(@challenge)
    else
      flash.now[:alert] = 'There was an error adding this nonprofit to the challenge'
      render :show
    end
  end

  def add_sponsor
    @challenge = Challenge.find(params[:challenge_id])
    @sponsor = Sponsor.find(params[:sponsor_id])

    if @sponsor
      return already_added_error(@sponsor) if @challenge.sponsors.include?(@sponsor)

      @challenge.sponsors << @sponsor
      @challenge.save!

      flash[:notice] = "#{@sponsor.name} was successfully added to this challenge"
      redirect_to challenge_path(@challenge)
    else
      flash.now[:alert] = 'There was an error adding this sponsor to the challenge'
      render :show
    end
  end

  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def already_added_error(resource)
      flash.now[:alert]= "#{resource.name} has already been added to this Challenge."
      render :show
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :start_date, :end_date, :challenge_img, :total_offer, :amount_raised, :sponsor_blurb, :charity_blurb, :enabled, :seo_name, :img_thumb_url, :logo_url)
    end
end
