RSpec.describe Web::Controllers::TestResults::Clear, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:clear_results) { double 'Operations::SingleRun::Clear', call: nil }

  before do
    System::Container.stub('operations.single_run.clear', clear_results)
    @response = action.call(params)
  end

  it 'should be 302 http status' do
    expect(@response.first).to eq 302
  end

  context 'exposures' do
    let(:flash_message) { 'Test results table was cleared' }

    it 'should return success flash message' do
      expect(action.exposures.fetch(:flash)[:success])
        .to eq flash_message
    end
  end
end
