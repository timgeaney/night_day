class LikesController < ApplicationController

  def create
    @like = Like.create(params[:like])
    @event = @like.event
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @event = like.event
    respond_to do |format|
      format.js
    end
  end
end