class PersonalPageController < ApplicationController
	def index
		@bubbling_variable = Time.now.strftime('%H:%M:%S')
	end
end
