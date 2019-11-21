RSpec.describe Web::Controllers::TestResults::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:test_result_repo) { TestResultRepository.new }
  let!(:test_results) { Fabricate.times(2, :test_result) }

  before do
    System::Container.stub('repositories.test_result', test_result_repo)
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'should be test_results exposure' do
      expect(action.exposures.fetch(:test_results))
        .to match_array(test_results)
    end
  end
end
