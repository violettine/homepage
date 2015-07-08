require 'rails_helper'

RSpec.describe(ShortMoviesHelper, type: :helper) do
  describe '#sub_link_address' do
    it 'changes the link address to embedded' do
      movie = ShortMovie.new(link: 'https://www.youtube.com/watch?v=aUN6RPMIoeo')

      expect(helper.sub_link_address(movie)).to have_text('embed')
    end
  end
end
