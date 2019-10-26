RSpec.describe SiteRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:site) { Fabricate(:site) }
end
