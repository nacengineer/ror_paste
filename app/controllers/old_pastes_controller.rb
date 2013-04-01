class OldPastesController < ApplicationController
  def index
    @pastes = Paste.expired.paginate(page: params[:page])
    respond_to do |format|
      format.html { render :index } # index.html.erb
      format.json { render json: @pastes }
    end
  end
end
