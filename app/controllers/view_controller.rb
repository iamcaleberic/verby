class ViewController < ApplicationController
  def index
  	@publications = Publication.all
  end

  def show
  end
   def publications
    @writer = Writer.find(params[:id])
    @publications = @writer.publications
  end
end
