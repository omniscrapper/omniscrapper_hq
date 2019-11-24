RSpec.describe Web::Controllers::Schemas::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'should be 422 http status' do
    response = action.call(params)
    expect(response.first).to eq 422
  end
end
