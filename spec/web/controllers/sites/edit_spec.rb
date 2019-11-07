RSpec.describe Web::Controllers::Sites::Edit, type: :action do
  let(:action) { described_class.new }
  let(:params) { { id: site.id } }
  let(:site) { Fabricate.create(:site) }

  before { @response = action.call(params) }

  it 'should be 200 http status' do
    expect(@response.first).to eq 200
  end

  context 'exposures' do
    it 'should be site exposure' do
      expect(action.exposures.fetch(:site)).to eq site
    end
  end
end
