RSpec.describe Web::Controllers::ScrapingTasks::Show, type: :action do
  let(:action) { described_class.new }
  let(:repo) { SchemaRepository.new }
  let(:task) { Fabricate.create(:scraping_task) }

  it 'is successful' do
    response = action.call(id: task.id)
    expect(response[0]).to eq 200
  end

  it 'loads right task' do
    action.call(id: task.id)
    expect(action.scraping_task).to eq task
  end
end
