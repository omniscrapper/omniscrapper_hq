RSpec.describe Web::Controllers::DryRun::Create, type: :action do
  let(:action) { described_class.new }

  describe 'if a task is found' do
    let(:task) { Fabricate.build(:task) }
    let(:params) { { task_id: 1 } }
    let(:task_repo) { double 'TaskRepository' }

    before do
      allow(task_repo).to receive(:find).and_return(task)
      System::Container.stub('repositories.task', task_repo)
    end

    it 'should be 200 http status' do
      response = action.call(params)

      expect(response.first).to eq 200
    end

    context 'exposures' do
      it 'should return the task' do
        action.call(params)

        expect(action.exposures.fetch(:task)).to eq task
      end
    end

    context 'if optional params is sent' do
      let(:params) do
        { task_id: 1, dry_run: { url: Faker::Internet.url } }
      end

      context 'exposures' do
        let(:flash_text) { 'Dry run was successfully performed.' }
        let(:result) { double 'Operations::DryRun' }
        let(:another_task) { Fabricate.build(:task) }

        before do
          allow(result).to receive(:call).and_return(another_task)
          System::Container.stub('operations.dry_run.perform', result)
          action.call(params)
        end

        it 'should return flash message' do
          expect(action.exposures.fetch(:flash)[:success]).
            to eq flash_text
        end

        it 'should return the result' do
          expect(action.exposures.fetch(:result)).to eq task
        end
      end
    end
  end
end
