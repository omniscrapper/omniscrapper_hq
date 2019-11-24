RSpec.describe Web::Controllers::Tasks::Update, type: :action do
  let(:action) { described_class.new }
  let(:task_repo) { TaskRepository.new }
  let(:params) { { id: task.id, task: 'task' } }
  let(:task) { Fabricate.create(:task) }

  before do
    System::Container.stub('repositories.task', task_repo)
    allow(task_repo).to receive(:update).and_return(task)
    @response = action.call(params)
  end

  it 'should be 302 http status' do
    expect(@response.first).to eq 302
  end

  context 'exposures' do
    let(:flash_text) { 'Task was successfuly updated.' }

    it 'returns tasks exposure' do
      expect(action.exposures.fetch(:task)).to eq task
    end

    it 'should return flash message' do
      expect(action.exposures.fetch(:flash)[:success]).
        to eq flash_text
    end
  end
end
