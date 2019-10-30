RSpec.describe Domain::Configuration::Crawler do
  subject { described_class.new }

  describe '#required_fields' do
    let(:crawler_name) { :gallery }
    let(:required_fields) { [:a, :b, :c] }

    before do
      dummy_crawler = Module.new do
        const_set('REQUIRED_ATTRIBUTES', [:a, :b, :c])
      end
      crawlers = double
      allow(crawlers).to receive(:by_name).and_return(dummy_crawler)
      System::Container.stub('omniscrapper.crawlers', crawlers)
    end

    context 'crawler exists' do
      it 'returns list of required fields' do
        expect(subject.required_fields(crawler_name)).to match_array required_fields
      end
    end

    context 'crawler does not exist' do
    end
  end
end
