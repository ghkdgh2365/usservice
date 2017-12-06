class HomeController < ApplicationController
  def index
    @univs = Univ.all
  end
  
  def search_receipts
    @univ_id = params[:univ_id]
    # @user = User.find(@univ_id).id
    @univ = Univ.find(@univ_id)
    @colleges = College.where(univ_id: @univ_id)
    @majors = Major.where(univ_id: @univ_id)
  end
  def new_ask
  end
  def create_ask
    @ask = Ask.new
    @ask.content = params[:content]
    @ask.user_id = params[:user_id]

    respond_to do |format|
      if @ask.save
        format.html { redirect_to :back, notice: '작성 완료 !' }
      end
    end
  end
  def admin
    @univ_alarm = User.where('univ_alarm=?', "1").order(:univ_id)
    @college_alarm = User.where('college_alarm=?', "1").order(:college_id)
    @major_alarm = User.where('major_alarm=?', "1").order(:major_id)
  
  end
  
  def filter_user

  end
end
