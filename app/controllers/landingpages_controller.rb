class LandingpagesController < ApplicationController

  def index
    @ta = InterestedPerson.new
  end

  def create
    @ta = InterestedPerson.new(ta_params)
    if @ta.save
      redirect_to success_landingpages_path
    else
      flash[:fail] = "暱稱與信箱為必填"
      render :index
    end
  end

  def success

  end

  private

  def ta_params
    params.require(:interested_person).permit(:name, :gender, :email)
  end

end
