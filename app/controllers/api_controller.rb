class ApiController < ApplicationController
  http_basic_authenticate_with name: 'root', password: 'secret'
  
  rescue_from Exception,                      with: :render_exception
  rescue_from ActiveRecord::RecordNotFound,   with: :render_not_found
  rescue_from ActionController::RoutingError, with: :render_not_found
  
  private
  
  def render_server_error( exception )
    logger.warn "500 Server Error: #{exception}"
    render nothing true, status: :internal_server_error
  end

  def render_not_found
    render nothing: true, status: :not_found
  end
end