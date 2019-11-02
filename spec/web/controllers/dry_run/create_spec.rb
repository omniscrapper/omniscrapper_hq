RSpec.describe Web::Controllers::DryRun::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { { dry_run: { url: Faker::Internet.url } } }
  let(:dry_run_create) { double 'DryRun::Perform', call: omniscrapper }
  let(:omniscrapper) { double 'OmniScrapper' }

  before do
    allow_any_instance_of(described_class)
      .to receive(:dry_run_create).and_return(dry_run_create)
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response[0]).to eq 200
  end

  context 'exposures' do
    it 'returns result exposure' do
      expect(action.exposures).to include(result: omniscrapper)
    end
  end
end
