# frozen_string_literal: true

module FirebaseDynamicLink
  class Connection
    extend Forwardable

    # @!method post
    #   see Faraday::Connection#post
    def_delegators :client, :post

    def initialize(end_point)
      @client = Faraday::Connection.new(url: end_point,
                                        headers: { "Content-Type" => "application/json" })

      client.options.timeout = FirebaseDynamicLink.config.timeout
      client.options.open_timeout = FirebaseDynamicLink.config.open_timeout
    end

    def timeout=(time)
      client.options.timeout = time
    end

    def timeout
      client.options.timeout
    end

    def open_timeout=(time)
      client.options.open_timeout = time
    end

    def open_timeout
      client.options.open_timeout
    end

    private

    attr_reader :client
  end
end
