require 'rails_helper'

RSpec.describe(ShortMovie, type: :model) do 
  context 'create new short movies' do
    it 'adds two additional movies' do
      curr = ShortMovie.all.count
      movie1 = ShortMovie.create!(link: 'test1')
      movie2 = ShortMovie.create!(link: 'test2')

      expect(ShortMovie.all.count).to eq(curr+2)
    end
  end

  context 'delete short movie' do
    it 'delete one movie' do
      movie1 = ShortMovie.create!(link: 'test1')
      curr = ShortMovie.all.count
      movie1.delete

      expect(ShortMovie.all.count).to eq(curr-1)
    end
  end
end
