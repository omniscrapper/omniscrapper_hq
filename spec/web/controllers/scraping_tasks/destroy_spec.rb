RSpec.describe Web::Controllers::ScrapingTasks::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:repository) { ScrapingTaskRepository.new }
  let(:task) { Fabricate(:scraping_task) }

  after do
    repository.clear
  end

  it 'redirects' do
    response = action.call(id: task.id)
    expect(response[0]).to eq 302
  end

  it 'destroys the scraping task' do
    action.call(id: task.id)
    expect(repository.find(task.id)).to be_nil
  end
end
