RSpec.describe Web::Controllers::Sites::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { SiteRepository.new }

  after do
    repository.clear
  end

  context 'with valid params' do
    let(:attributes) { Fabricate.attributes_for(:site) }

    it 'is successful' do
      response = action.call(site: attributes)
      expect(response[0]).to eq 302
    end

    it 'creates a new site' do
      action.call(site: attributes)
      expect(action.site.id).to_not be_nil
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
