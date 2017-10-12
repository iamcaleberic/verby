class PublicationsController < ApplicationController
  before_action :authenticate_writer!, only: [:create ,:edit ,:update, :destroy]
  before_action :find_publication, only: [:show]
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource :only => :index

  # GET /publications
  # GET /publications.json
  def index

    @publications = Publication.paginate(:page => params[:page]).order('created_at DESC')

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
    @comments = @publication.comment_threads.order('created_at desc')
    unless !writer_signed_in?
      @new_comment = Comment.build_from(@publication, current_writer.id, "")
    end
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

  def publications
    @writer = Writer.find(params[:id])
    @publications = @writer.publications
  end

   # acts_as_votable functions
  def upvote
    if !writer_signed_in?
      redirect_to new_writer_session_path
    else
      @publication = Publication.friendly.find(params[:id])
      @publication.upvote_by current_writer
      redirect_back fallback_location: root_path
    end
  end

  def downvote
    if !writer_signed_in?
      redirect_to new_writer_session_path
    else
      @publication = Publication.friendly.find(params[:id])
      @publication.downvote_by current_writer
      redirect_back fallback_location: root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :pen_name, :body, :email, :comments, :likes, :dislikes ,:writer_id, :genre, :tags, :slug ,:likees_count, :superuser_id)
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
