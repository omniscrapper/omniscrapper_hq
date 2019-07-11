class ScrapingTaskCreator
  attr_reader :task, :schedule, :schema

  def initialize(params)
    @schedule = create_schedule(params[:scraping_schedule])
    @schema = create_schema(params[:schema])
    @task = create_task(schedule, schema, params)
  end

  def self.call(params)
    service = new(params)
    return service.task
  end

  def create_schedule(data)
    ScrapingScheduleRepository.new.create(data)
  end

  def create_schema(data)
    SchemaRepository.new.create(metadata: JSON.parse(data[:metadata]))
  end

  def create_task(schedule, schema, data)
    ScrapingTaskRepository.new.create(schema_id: schema.id, scraping_schedule_id: schedule.id, name: data[:name])
  end
end
