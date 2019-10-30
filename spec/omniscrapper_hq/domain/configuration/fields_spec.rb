RSpec.describe Domain::Configuration::Fields do
  subject { described_class.new }

  describe '#list' do
    context 'valid schema' do
      let(:schema) { Schema.new(definition: definition) }
      let(:definition) do
        {
          "type": "object",
          "required": ["name", "description"],
          "properties": {
            "name": {"type": "string"},
            "phone": {"type": "string"},
            "description": {"type": "string"}
          }
        }
      end

      it 'returns list of required fields' do
        expect(subject.list(schema)).to match_array [
          {name: :name, required: true},
          {name: :phone, required: false},
          {name: :description, required: true}
        ]
      end
    end
  end
end
