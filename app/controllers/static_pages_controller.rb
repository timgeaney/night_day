class StaticPagesController < ApplicationController
  def home
    respond_to do |format|
      format.html { render layout: 'home' }
      format.json { render json: @events }
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
