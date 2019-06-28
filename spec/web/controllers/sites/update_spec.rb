RSpec.describe Web::Controllers::Sites::Update, type: :action do
  let(:action) { described_class.new }
  let(:site) { Fabricate(:site) }
  let(:params) { { id: site.id, site: Fabricate.attributes_for(:site, name: 'Hello') } }

  it 'is redirects' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
