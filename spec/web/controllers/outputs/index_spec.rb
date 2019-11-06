RSpec.describe Web::Controllers::Outputs::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:output) { Fabricate.build(:output) }
  let(:output_repo) { double 'Output' }

  before do
    allow(output_repo).to receive(:all).and_return([output])
    System::Container.stub('repositories.output', output_repo)
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'should return existed outputs' do
      expect(action.exposures.fetch(:outputs)).to match_array([output])
    end
  end
end
