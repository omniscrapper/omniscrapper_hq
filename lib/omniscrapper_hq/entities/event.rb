class Event
  attr_reader :id, :name, :task_id, :frequency_period, :frequency_quantity

  def initialize(id:, name:, task_id:, frequency_period:, frequency_quantity:)
    @id = id
    @name = name
    @task_id = task_id
    @frequency_period = frequency_period
    @frequency_quantity = frequency_quantity
  end

  def frequency
    "#{frequency_quantity} #{frequency_period}"
  end
end
