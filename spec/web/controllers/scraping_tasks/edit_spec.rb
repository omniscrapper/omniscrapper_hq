RSpec.describe Web::Controllers::ScrapingTasks::Edit do
  let(:action) { described_class.new }
  let(:task) { Fabricate.create(:scraping_task) }

  it 'is successful' do
    response = action.call(id: task.id)
    expect(response[0]).to eq 200
  end

  it 'loads right scraping task' do
    action.call(id: task.id)
    expect(action.scraping_task).to eq task
  end
end