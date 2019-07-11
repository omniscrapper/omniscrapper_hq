RSpec.describe SiteRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:site) { Fabricate(:site) }

  context '.find_with_scraping_tasks' do
    it 'finds schema with scraping task' do
      task = Fabricate(:scraping_task)
      Fabricate(:site_task_relationship, site_id: site.id, scraping_task_id: task.id)

      site_with_task = repository.find_with_scraping_tasks(site.id)
      expect(site_with_task.scraping_tasks).to eq [task]
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
end
