RSpec.describe Web::Controllers::Schemas::Index, type: :action do
  let(:action) { described_class.new }
  let(:schemas) { [Fabricate.build(:schema)] }
  let(:params) { Hash[] }
  let(:schema_repo) { double 'SchemaRepository' }
  let(:pagy) { double 'Pagy' }

  before do
    allow(action).to receive(:pagy).and_return([pagy, schemas])
    System::Container.stub('repositories.schema', schema_repo)
    @response = action.call(params)
  end

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'returns schemas exposure' do
      expect(action.exposures.fetch(:schemas)).to match_array(schemas)
    end

    it 'returns pagination_data exposure' do
      expect(action.exposures.fetch(:pagination_data)).to eq pagy
    end
  end
end
