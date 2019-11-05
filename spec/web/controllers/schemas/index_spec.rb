RSpec.describe Web::Controllers::Schemas::Index, type: :action do
  let(:schema) { Fabricate.build(:schema) }
  let(:params) { Hash[] }

  before { @response = action.call(params) }

  it 'should be 200 http status' do
    expect(@response[0]).to eq 200
  end

  context 'exposures' do
    it 'returns schemas exposure' do

    end

    it 'returns pagination_data exposure' do

    end
  end
end
