RSpec.describe Web::Controllers::Sites::Update, type: :action do
  let(:action) { described_class.new }
  let(:repository) { SiteRepository.new }
  let(:site) { Fabricate(:site) }

  after do
    repository.clear
  end

  context 'with valid params' do
    let(:attributes) { { id: site.id, site: Fabricate.attributes_for(:site, name: 'hello') } }

    it 'is redirects' do
      response = action.call(attributes)
      expect(response[0]).to eq 302
    end

    it 'updates a site' do
      action.call(attributes)
      expect(repository.find(site.id).name).to eq 'hello'
    end
  end

  context 'with invalid params' do
    let(:attributes) { { site: {} } }

    it 'returns HTTP client error' do
      response = action.call(attributes)

      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(attributes)
      errors = action.params.errors

      expect(errors.dig(:site, :name)).to eq(['is missing'])
      expect(errors.dig(:site, :url)).to eq(['is missing'])
    end
  end
end
