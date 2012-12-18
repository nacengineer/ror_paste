class OldPastesController < ApplicationController
  def index
    @pastes = Paste.expired.paginate(:per_page => 10, :page => params[:page]).order('created_at DESC')
    respond_to do |format|
      format.html { render :index } # index.html.erb
      format.json { render json: @pastes }
    end
  end
end
