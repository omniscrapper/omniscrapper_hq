RSpec.describe ScrapingTasksValidator do
  let(:action) { described_class }

  it 'is valid' do
    params = {
        name: 'test',
        scraping_schedule: Fabricate.attributes_for(:scraping_schedule),
        schema: Fabricate.attributes_for(:schema)
    }
    expect(action.new(scraping_task: params).validate.success?).to eq true
  end

  it 'is not valid' do
    params = {}
    expect(action.new(scraping_task: params).validate.success?).to eq false
  end
end