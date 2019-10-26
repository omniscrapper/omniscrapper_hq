RSpec.describe ScrapingTaskCreator do
  let(:attributes) {
    {
      name: 'test',
      schema_id: Fabricate(:schema).id
    }
  }

  let(:action) { described_class.new(attributes) }
end
