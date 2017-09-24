class ErrorsController < ApplicationController
  def not_found
  	render(:status => 404)
  end

  def internal_server
  	render(:status => 500)
  end

  def unauthorized
  	render(:status => 422)
  end

  def illegal
  	render(:status => 403)
  end
end
