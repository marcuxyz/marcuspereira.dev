require 'rails_helper'

RSpec.describe 'Routes for home', type: :routing do
  context 'routes / to the HomeController' do
    it { expect(get: '/').to route_to(controller: 'home', action: 'index') }
  end
end
