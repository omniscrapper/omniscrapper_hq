RSpec.describe ScrapingTaskCreator do
  let(:attributes) {
    {
      name: 'test',
      scraping_schedule: Fabricate.attributes_for(:scraping_schedule),
      schema: Fabricate.attributes_for(:schema)
    }
  }

  let(:action) { described_class.new(attributes) }

  it 'creates schedule' do
    action.call
    expect(action.schedule.id).to_not be_nil
  end

  it 'creates schema' do
    action.call
    expect(action.schema.id).to_not be_nil
  end

  it 'creates scraping task' do
    action.call
    expect(action.task.id).to_not be_nil
  end
end