require 'rails_helper'

RSpec.describe 'Routes for posts', type: :routing do
  context 'routes /notas to the PostsController' do
    it { expect(get: '/notas').to route_to(controller: 'posts', action: 'index') }
  end

  context 'routes /notas/1 to the PostsController' do
    it { expect(get: '/notas/1').to route_to(controller: 'posts', action: 'show', id: '1') }
  end

  context 'routes /notas/buscar to the PostsController' do
    it { expect(get: '/notas/buscar').to route_to(controller: 'posts', action: 'search') }
  end
end
