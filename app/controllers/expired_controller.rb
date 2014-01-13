class ExpiredController < ApplicationController
  def index
    @pastes      = Paste.expired.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @pastes }
    end
  end
end
