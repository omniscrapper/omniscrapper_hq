RSpec.describe Web::Controllers::ScrapingTasks::Update, type: :action do
  let(:action) { described_class.new }
  let(:repository) { ScrapingTaskRepository.new }
  let(:task) { Fabricate(:scraping_task) }

  after do
    repository.clear
  end

  context 'with valid params' do
    let(:attributes) { { id: task.id, scraping_task: Fabricate.attributes_for(:scraping_task, name: 'hello') } }

    it 'is redirects' do
      response = action.call(attributes)
      expect(response[0]).to eq 302
    end

    it 'updates a task' do
      action.call(attributes)
      expect(repository.find(task.id).name).to eq 'hello'
    end
  end

  context 'with invalid params' do
    let(:attributes) { { scraping_task: {} } }

    it 'returns HTTP client error' do
      response = action.call(attributes)

      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(attributes)
      errors = action.params.errors

      expect(errors.dig(:scraping_task, :name)).to eq(['is missing'])
    end
  end
end
