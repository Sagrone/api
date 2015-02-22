module API
  module Formatters
    module JsonError
      def self.call(message, backtrace, options, env)
        { error_message: message, backtrace: backtrace }.to_json
      end
    end
  end
end
