class ExpiredController < ApplicationController
  def index
    @pastes      = Paste.expired.paginate(page: params[:page])
    @non_expired = Paste.expires_after
    respond_to do |format|
      format.html
      format.json { render json: @pastes }
    end
  end
end
