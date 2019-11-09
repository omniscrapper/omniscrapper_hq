class OutputRepository < Hanami::Repository
  # TODO: for now it serves as a source of configuration metadata
  # for any chosen output.
  # We need to move this to output gem, as it is done with scrappers configuration.
  def configuration
    {
      kafka: {
        kafka_host: {
          required: true
        },
        kafka_topic: {
          required: true
        }
      }
    }
  end
end
