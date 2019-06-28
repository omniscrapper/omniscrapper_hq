RSpec.describe Web::Controllers::Sites::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:site) { Fabricate(:site) }
  let(:params) { { id: site.id } }

  it 'is redirects' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
