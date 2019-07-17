RSpec.describe Web::Controllers::ScrapingTasks::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { ScrapingTaskRepository.new }


  after do
    repository.clear
  end

  context 'with valid params' do
    let(:attributes) {
      {
        name: 'test',
        scraping_schedule: Fabricate.attributes_for(:scraping_schedule),
        schema: Fabricate.attributes_for(:schema)
      }
    }

    it 'is successful' do
      response = action.call(scraping_task: attributes)
      expect(response[0]).to eq 302
    end

    it 'creates a new scraping task' do
      action.call(scraping_task: attributes)
      expect(action.scraping_task.id).to_not be_nil
    end
  end

  context 'with invalid params' do
    let(:attributes) { {} }

    it 'returns HTTP client error' do
      response = action.call(attributes)

      expect(response[0]).to eq(422)
    end
  end
end
