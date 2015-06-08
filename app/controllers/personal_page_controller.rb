class PersonalPageController < ApplicationController
	def index
		@bubbling_variable = 'I am '+ ['blue','red', 'yellow', 'green', 'purple'].sample + '!'
	end
end
