RSpec.describe Web::Controllers::Sites::Show, type: :action do
  let(:action) { described_class.new }
  let(:params) { { id: site.id } }
  let(:site) { Fabricate.create(:site) }

  before(:all) do
    site_repo = SiteRepository.new
    System::Container.stub('repositories.site', site_repo)
  end

  before do
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'returns site exposure' do
      expect(action.exposures.fetch(:site)).to eq site
    end
  end
end
