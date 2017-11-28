class ReplyController < ApplicationController
  def show
  end

  def create
    reply=Reply.new
    reply.content=params[:content]
    reply.board_id=params[:board_id]
    reply.user_id=params[:user_id]
    reply.save
    redirect_to :back
  end

  def delete
  end

  def update
  end

  def edit
  end

  def new
  end
end
