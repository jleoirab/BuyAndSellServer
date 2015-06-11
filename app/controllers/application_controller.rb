class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  after_filter  :set_csrf_cookie_for_ng, :set_access_control_header

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def set_access_control_header
    # Very bad. Don't release this app untill security is 100% rock solid.
    # Don't forget, we are trying to release this product in Nigeria
    verified_host()
  end

  protected

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
 
  def verified_host
    host_name = request.headers['ORIGIN']

    secure = (host_name == 'https://localhost:9000')
    unsecure = (host_name == 'http://localhost:9000')

    print(secure)
    print('\n')
    print(unsecure)
    if secure || unsecure 
      headers['Access-Control-Allow-Origin'] = host_name
      headers['Access-Control-Allow-Method'] = '*'
    end
  end
end
