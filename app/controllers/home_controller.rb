class HomeController < ApplicationController
  def index
    render layout: 'app'
  	if signed_in?
  		redirect_to publications_path
  	end
  end

  def signed_in
    return signed_in?
  end

  def mine
  	@publications =Publication.all
  end

end
