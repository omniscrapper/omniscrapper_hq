RSpec.describe Web::Controllers::SingleRun::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { { task_id: task.id } }
  let(:task) { Fabricate.create(:task) }

  before do
    allow(Workers::SingleRun).to receive(:perform_async)
    @response = action.call(params)
  end

  it 'should be 302 http status' do
    expect(@response.first).to eq 302
  end

  it 'should be ran async worker' do
    expect(Workers::SingleRun)
      .to have_received(:perform_async).with(task.id)
  end

  context 'exposures' do
    let(:flash_text) { "Single run for task #{task.name} was started." }

    it 'should be a success flash' do
      expect(action.exposures.fetch(:flash)[:success]).to eq flash_text
    end
  end
end
