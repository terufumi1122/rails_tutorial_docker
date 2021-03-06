# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for static_pages', type: :routing do
  describe '静的ページのルーティング' do
    it 'rootルーティングが正しく動作する' do
      expect(get('/')).to route_to('static_pages#home')
    end
    it 'helpページへのルーティングが正しく動作する' do
      expect(get('/help')).to route_to('static_pages#help')
    end
    it 'aboutページへのルーティングが正しく動作する' do
      expect(get('/about')).to route_to('static_pages#about')
    end
    it 'contactページへのルーティングが正しく動作する' do
      expect(get('/contact')).to route_to('static_pages#contact')
    end
  end
end
