RSpec.describe Site, type: :entity do
  it 'can be initialized' do
    site = Site.new(name: 'Hello', url: 'test')
    expect(site.name).to eq 'Hello'
  end
end
