RSpec.describe Web::Controllers::ScrapingTasks::New, type: :action do
  let(:action) { described_class.new }

  it 'is successful' do
    response = action.call({})
    expect(response[0]).to eq 200
  end
end
