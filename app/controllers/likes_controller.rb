class LikesController < ApplicationController

  def create
    @like = Like.create(params[:like])
    @share = @like.share
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find(params[:id]).destroy
    @share = like.share
    respond_to do |format|
      format.js
    end
  end
end