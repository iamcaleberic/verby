class PublicationsController < ApplicationController
  before_action :authenticate_writer!, only: [:create ,:edit ,:update, :destroy]
  before_filter :find_publication, only: [:show]
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource :only => :index

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publications }
      format.js
    end
    # byebug
  end


  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
    authorize! :edit, @publication
  end

  # publication /publications
  # publication /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.writer_id = current_writer.id
    @publication.email = current_writer.email
    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    authorize! :update, @publication 
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    authorize! :destroy, @publication 
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :pen_name, :body, :email, :comments, :likes, :dislikes ,:writer_id, :genre, :tags)
    end

    # Find publications using old id
    def find_publication
      @publication = Publication.friendly.find params[:id]

      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the publication_path, and we should do
      # a 301 redirect that uses the current friendly id.
      if request.path != publication_path(@publication)
        return redirect_to @publication, :status => :moved_permanently
      end
    end
end
