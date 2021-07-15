class ApplicationController < ActionController::Base
  def after_sign_up_path_for(_resources)
    'events#index'
  end
end
