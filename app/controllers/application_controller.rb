class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ErrorSerializer

  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers["Content-Type"] =~ /application\/json/
      render :body => nil, :status => 406
  end

end
