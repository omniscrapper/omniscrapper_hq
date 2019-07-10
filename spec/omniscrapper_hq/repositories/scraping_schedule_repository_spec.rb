RSpec.describe ScrapingScheduleRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:schedule) { Fabricate(:scraping_schedule) }
  let(:task_attributes) { Fabricate.attributes_for(:scraping_task) }

  context '.find_with_scraping_tasks' do
    it 'finds schedule with scraping task' do
      task = Fabricate(:scraping_task, scraping_schedule_id: schedule.id)

      schedule_with_task = repository.find_with_scraping_tasks(schedule.id)
      expect(schedule_with_task.scraping_tasks).to eq [task]
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
      repository.add_scraping_task(schedule, task_attributes)
      schedule_with_task = repository.find_with_scraping_tasks(schedule.id)
      expect(schedule_with_task.scraping_tasks.count).to eq 1
    end

    it 'does not add a schema if attributes not supplied' do
      expect { repository.add_scraping_task(schedule, nil) }.to raise_error StandardError
    end
  end
end
