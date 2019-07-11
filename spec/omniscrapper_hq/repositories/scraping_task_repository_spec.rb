RSpec.describe ScrapingTaskRepository, type: :repository do
  let(:repository) { described_class.new }
  context '.find_with_schema' do
    it 'finds schema with scraping task' do
      schema = Fabricate(:schema)
      task = Fabricate(:scraping_tasks, schema_id: schema.id)

      task_with_schema = repository.find_with_schema(task.id)
      expect(task_with_schema.schema).to eq schema
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_schema(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_schema('999999999')
      expect(found).to be_nil
    end
  end

  context '.find_with_scraping_schedule' do
    it 'finds schema with scraping task' do
      schedule = Fabricate(:scraping_schedule)
      task = Fabricate(:scraping_tasks, scraping_schedule_id: schedule.id)

      task_with_schedule = repository.find_with_scraping_schedule(task.id)
      expect(task_with_schedule.scraping_schedule).to eq schedule
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_scraping_schedule(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_scraping_schedule('999999999')
      expect(found).to be_nil
    end
  end

  context '.find_with_sites' do
    it 'finds schema with scraping task' do
      site = Fabricate(:site)
      task = Fabricate(:scraping_tasks)
      Fabricate(:site_task_relationship, scraping_task_id: task.id, site_id: site.id)

      task_with_site = repository.find_with_sites(task.id)
      expect(task_with_site.sites).to eq [site]
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_sites(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_sites('999999999')
      expect(found).to be_nil
    end
  end
end
