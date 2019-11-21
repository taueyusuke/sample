class ConferenceroomsController < ApplicationController
  def new
    @conferenceroom = Conferenceroom.new
  end
  
  def create
    facility = Facility.new
    facility.save
    @conferenceroom = Conferenceroom.new(conferenceroom_params)
    if @conferenceroom.save
      flash[:success] = "会議室を登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    def conferenceroom_params
      params.require(:conferenceroom).permit(:people, :price, :availabletime, :remarks)
    end
end
