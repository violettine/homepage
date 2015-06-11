class FunPageController < ApplicationController
  def index
    # @bubbling_variable = 'I am '+ ['blue','red', 'yellow', 'green', 'purple', 'orange'].sample + '!'
    @bubbling_variable = 'I am ' + %w[blue red yellow green purple orange].sample + '!'
  end
end
