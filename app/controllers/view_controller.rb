class ViewController < ApplicationController
  def index
  	@publications = Publication.all
  end

  def show
  end
end
