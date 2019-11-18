class ConferenceroomsController < ApplicationController
  def new
    @conferenceroom = Conferenceroom.new
  end
  
  def create
    @conferenceroom = facility.conferencerooms.create(post_params)
    debugger
    redirect_to root_path
  end
  
  private
    def post_params
      params.require(:conferenceroom).permit(:people, :price, :availabletime, :remarks).merge(facility_id: current_user.id)
    end
end
