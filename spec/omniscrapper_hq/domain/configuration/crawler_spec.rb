RSpec.describe Domain::Configuration::Crawler do
  subject { described_class.new }

  describe '#required_fields' do
    let(:crawler_name) { :gallery }
    let(:required_fields) { [:a, :b, :c] }
    let(:crawlers) { double }

    before do
      allow(crawlers).to receive(:by_name).and_return(dummy_crawler)
      System::Container.stub('omniscrapper.crawlers', crawlers)
    end

    context 'crawler exists' do
      let(:dummy_crawler) do
        double(required_attributes: required_fields)
      end

      it 'returns list of required fields' do
        expect(subject.required_fields(crawler_name)).to match_array required_fields
      end
    end

    context 'crawler does not exist' do
      let(:dummy_crawler) { nil }

      it 'raises error' do
        expect { subject.required_fields(crawler_name) }
          .to raise_error(Domain::Configuration::Crawler::CrawlerDoesNotExist)
      end
    end
  end
end
