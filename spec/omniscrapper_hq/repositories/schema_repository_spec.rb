RSpec.describe SchemaRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:schema) { Fabricate(:schema) }
  context '.find_with_site' do
    it 'finds schema with site' do
      schema_with_site = repository.find_with_site(schema.id)
      expect(schema_with_site.site).to_not be_nil
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_site(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_site('9999999')
      expect(found).to be_nil
    end
  end
end
