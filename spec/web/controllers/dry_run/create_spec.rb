RSpec.describe Web::Controllers::DryRun::Create, type: :action do
  let(:action) { described_class.new }

  before do
    @response = action.call(params)
  end

  describe 'if a task is found' do
    let(:task) { Fabricate.build(:task) }
    let(:params) { { task_id: 1 } }
    let(:task_repo) { TaskRepository.new }

    before do
      allow(task_repo).to receive(:find).and_return(task)
      System::Container.stub('repositories.task', task_repo)
    end

    it 'should be 200 http status' do
      expect(@response.first).to eq 200
    end

    context 'exposures' do
      it 'should return the task' do
        expect(action.exposures.fetch(:task)).to eq task
      end
    end

    context 'if required params is sent' do
      it 'should return flash message'

      context 'exposures' do
        it 'should return the result'
      end
    end
  end
end
