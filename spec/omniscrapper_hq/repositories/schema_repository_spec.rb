RSpec.describe SchemaRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:schema) { Fabricate(:schema) }
  let(:task_attributes) { Fabricate.attributes_for(:scraping_task) }
end
