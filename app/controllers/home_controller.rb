class HomeController < ApplicationController
  def index
  	if signed_in?
  		redirect_to publications_path
    else
      render layout: 'app'
  	end
  end

  def signed_in
    return signed_in?
  end

  def mine
  	@publications = Publication.all
  end

end
