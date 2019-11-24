RSpec.describe Web::Controllers::Schemas::New, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'should be 200 http status' do
    response = action.call(params)
    expect(response.first).to eq 200
  end
end
