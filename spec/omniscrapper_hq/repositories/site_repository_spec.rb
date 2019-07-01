RSpec.describe SiteRepository, type: :repository do
  let(:repository) { described_class.new }
  let(:site_attributes) { Fabricate.attributes_for(:site) }
  let(:schema_attributes) { Fabricate.attributes_for(:schema) }
  let!(:site) { Fabricate(:site) }

  context '.create_with_schemas' do
    it 'creates site with schema' do
      site = repository.create_with_schemas(name: 'test', url: 'test', schemas: [ schema_attributes ])
      expect(site.schemas.count).to eq 1
    end

    it 'does not create site without schema' do
      expect { repository.create_with_schemas(site_attributes) }.to raise_error Hanami::Model::Error
    end
  end

  context '.find_with_schemas' do
    it 'finds site with schemas' do
      schema = Fabricate(:schema, site_id: site.id)
      site_with_schemas = repository.find_with_schemas(site.id)
      expect(site_with_schemas.schemas).to eq [schema]
    end

    it 'returns nil when nil is given' do
      found = repository.find_with_schemas(nil)
      expect(found).to be_nil
    end

    it 'returns nil for missing record' do
      found = repository.find_with_schemas('9999999')
      expect(found).to be_nil
    end
  end

  context '.add_schema' do
    it 'adds a schema' do
      repository.add_schema(site, schema_attributes)
      site_with_schemas = repository.find_with_schemas(site.id)
      expect(site_with_schemas.schemas.count).to eq 1
    end

    it 'does not add a schema if attributes not supplied' do
      expect { repository.add_schema(site, {}) }.to raise_error Hanami::Model::NotNullConstraintViolationError
    end
  end
end
