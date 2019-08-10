class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters,if: :devise_controller?

	def after_sign_in_path_for(resource)
		books_path
		#flash[:notice]= 'ログインは成功しました。'
	end

	def after_sign_out_path_for(resource)
		home_index_path
	end

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:passward,:passward_confirmation])
    	devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:passward,:passward_confirmation])
    end
end