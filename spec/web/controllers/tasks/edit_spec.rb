RSpec.describe Web::Controllers::Tasks::Edit, type: :action do
  let(:action) { described_class.new }
  let(:params) { { id: task.id } }
  let(:task) { double 'Task', id: 1 }
  let(:task_repo) { double 'Repositories::Task' }

  before do
    System::Container.stub('repositories.task', task_repo)
    allow(task_repo).to receive(:find).and_return(task)
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'should be task exposure' do
      expect(action.exposures.fetch(:task)).to eq task
    end
  end
end
