RSpec.describe Web::Controllers::Tasks::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:params) { { id: task.id } }
  let(:task_repo) { double 'Repositories::Task' }
  let(:task) { double 'Task', id: 1 }

  before do
    System::Container.stub('repositories.task', task_repo)
    allow(task_repo).to receive(:find).and_return(task)
    allow(task_repo).to receive(:delete_with_dependencies)
    @response = action.call(params)
  end

  it 'should be 302 http status' do
    expect(@response.first).to eq 302
  end

  it 'should be called #delete_with_dependencies' do
    expect(task_repo).to have_received(:delete_with_dependencies)
  end
end
