class HomeController < ApplicationController
  def index
  	if signed_in?
  		redirect_to publications_path
  	end
  end

end
