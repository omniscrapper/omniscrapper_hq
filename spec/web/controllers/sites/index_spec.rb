RSpec.describe Web::Controllers::Sites::Index, type: :action do
  let(:action) { described_class.new }
  let(:sites) { [Fabricate.build(:site)] }
  let(:pagy) { double 'Pagy' }

  before(:all) do
    site_repo = double 'SiteRepository'
    System::Container.stub('repositories.site', site_repo)
  end

  before do
    allow(action).to receive(:pagy).and_return([pagy, sites])
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'returns sites exposure' do
      expect(action.exposures.fetch(:sites)).to match_array(sites)
    end

    it 'returns pagination_data exposure' do
      expect(action.exposures.fetch(:pagination_data)).to eq pagy
    end
  end
end
