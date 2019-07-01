RSpec.describe Schema, type: :entity do
  it 'can be initialized' do
    schema = Fabricate.build(:schema, url: 'Hello')
    expect(schema.url).to eq 'Hello'
  end
end
