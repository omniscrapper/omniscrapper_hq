RSpec.describe Web::Controllers::ScrapingTasks::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { ScrapingTaskRepository.new }

  after do
    repository.clear
  end
end
