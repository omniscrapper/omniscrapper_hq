include Dry::Monads::Result::Mixin

RSpec.describe Web::Controllers::Tasks::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) do
    {
      task: {
        site_id: site.id,
        schema_id: schema.id,
        output_id: output.id,
        crawler: crawler,
        crawler_params: crawler_params,
        scrapper_params: scrapper_params
      }
    }
  end
  let(:site) { double 'Site', id: 1 }
  let(:schema) { double 'Schema', id: 1 }
  let(:output) { double 'Output', id: 1 }
  let(:crawler) { Hash.new }
  let(:crawler_params) { Hash.new }
  let(:scrapper_params) { Hash.new }
  let(:task_creator) { double 'Operations::Task::Create' }

  before do
    System::Container.stub('operations.task.create', task_creator)
    allow(task_creator).to receive(:call).and_return(result)
    @response = action.call(params)
  end

  context 'is successful' do
    let(:flash_text) { 'Task was successfully created.' }
    let(:result) { Success.new(:success) }

    it 'should be 302 http status' do
      expect(@response.first).to eq 302
    end

    it 'should return flash message' do
      expect(action.exposures.fetch(:flash)[:success]).
        to eq flash_text
    end
  end

  context 'is failure' do
    let(:flash_text) { 'There was an error during task creation.' }
    let(:result) { Failure.new(:failed) }

    it 'should be 302 http status' do
      expect(@response.first).to eq 200
    end

    it 'should return flash message' do
      expect(action.exposures.fetch(:flash)[:error]).
        to eq flash_text
    end
  end
end
