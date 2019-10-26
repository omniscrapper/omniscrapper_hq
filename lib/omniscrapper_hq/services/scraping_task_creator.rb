class ScrapingTaskCreator
  attr_reader :task, :schema, :params

  def initialize(params)
    @params = params
  end

  def call
  end
end
