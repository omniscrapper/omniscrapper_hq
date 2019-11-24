RSpec.describe Web::Controllers::Tasks::Index, type: :action do
  let(:action) { described_class.new }
  let(:task_repo) { double 'Repositories::Task' }
  let(:pagy) { double 'Pagy' }
  let(:tasks) { [Fabricate.build(:task)] }
  let(:params) { Hash[] }

  before do
    System::Container.stub('repositories.task', task_repo)
    allow(action).to receive(:pagy).and_return([pagy, tasks])
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'returns tasks exposure' do
      expect(action.exposures.fetch(:tasks)).to match_array(tasks)
    end

    it 'returns pagination_data exposure' do
      expect(action.exposures.fetch(:pagination_data)).to eq pagy
    end
  end
end
