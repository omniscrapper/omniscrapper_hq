RSpec.describe SchemaRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:schema) { Fabricate(:schema) }
  let(:task_attributes) { Fabricate.attributes_for(:scraping_tasks) }

  context '.find_with_scraping_tasks' do
    it 'finds schema with scraping task' do
      task = Fabricate(:scraping_tasks, schema_id: schema.id)

      schema_with_task = repository.find_with_scraping_tasks(schema.id)
      expect(schema_with_task.scraping_tasks).to eq [task]
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_scraping_tasks(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_scraping_tasks('9999999')
      expect(found).to be_nil
    end
  end

  context '.add_scraping_task' do
    it 'adds a scraping task' do
      repository.add_scraping_task(schema, task_attributes)
      schema_with_task = repository.find_with_scraping_tasks(schema.id)
      expect(schema_with_task.scraping_tasks.count).to eq 1
    end

    it 'does not add a schema if attributes not supplied' do
      expect { repository.add_scraping_task(schema, nil) }.to raise_error StandardError
    end
  end
end
