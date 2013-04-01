class PastesController < ApplicationController

  def index
    @pastes = Paste.expires_after().paginate(page: params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pastes }
    end
  end

  def expired
    @pastes = Paste.expired.paginate(page: params[:page])
    respond_to do |format|
      format.html { render :index } # index.html.erb
      format.json { render json: @pastes }
    end
  end

  def show
    @paste = Paste.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paste }
    end
  end

  def new
    @paste = Paste.new

    respond_to do |format|
      format.html # new.html.erb
      # format.json { render json: @paste }
    end
  end

  def edit
    @paste = Paste.find_by_id(params[:id])
  end

  def create
    @paste = Paste.new(params[:paste])

    respond_to do |format|
      if @paste.save
        format.html { redirect_to @paste, notice: 'Paste was successfully created.' }
        # format.json { render json: @paste, status: :created, location: @paste }
      else
        format.html { render action: "new" }
        # format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @paste = Paste.find_by_id(params[:id])

    respond_to do |format|
      if @paste.update_attributes(params[:paste])
        format.html { redirect_to @paste, notice: 'Paste was successfully updated.' }
        # format.json { head :ok }
      else
        format.html { render action: "edit" }
        # format.json { render json: @paste.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paste = Paste.find_by_id(params[:id])
    @paste.destroy

    respond_to do |format|
      format.html { redirect_to pastes_url }
      # format.json { head :ok }
    end
  end

end
