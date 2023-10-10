require 'rails_helper'

RSpec.describe 'Routes for home', type: :routing do
  context 'routes / to the HomeController' do
    it { expect(get: '/').to route_to(controller: 'home', action: 'index') }
  end

  context 'routes /buscar for home' do
    it { expect(get: '/buscar').to route_to(controller: 'home', action: 'search') }
  end
end
