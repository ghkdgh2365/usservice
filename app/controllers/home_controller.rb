class HomeController < ApplicationController
  def index
    @univs = Univ.all
  end
  
  def search_receipts
    @univ_id = params[:univ_id]
    @user = User.find(@univ_id).id
    @univ = Univ.find(@univ_id)
    @colleges = College.where(univ_id: @univ_id)
    @majors = Major.where(univ_id: @univ_id)
  end
end
