RSpec.describe Web::Controllers::Sites::Destroy, type: :action do
  let(:action) { described_class.new }
  let!(:site) { Fabricate(:site) }
  let(:repository) { SiteRepository.new }

  after do
    repository.clear
  end

  it 'is redirects' do
    response = action.call(id: site.id)
    expect(response[0]).to eq 302
  end

  it 'destroys the site' do
    action.call(id: site.id)
    expect(repository.all.count).to eq 0
  end
end
