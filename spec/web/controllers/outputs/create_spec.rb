RSpec.describe Web::Controllers::Outputs::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:output_repo) { double 'Output' }

  before do
    allow(output_repo).to receive(:call)
    System::Container.stub('operations.output.create', output_repo)
    @response = action.call(params)
  end

  it 'should be 302 http status' do
    expect(@response.first).to eq 302
  end

  context "exposures" do
    let(:flash_text) { 'Output was successfully created' }

    it 'should be success flash' do
      expect(action.exposures.fetch(:flash)[:success]).to eq flash_text
    end
  end
end
