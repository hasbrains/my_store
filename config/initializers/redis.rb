class Redis
  module Objects
    module ClassMethods
      # include Rails app name and env into the prefix
      # This is what a key may look like:
      #
      #  MyStore:development:item:17:views 
      #
      def redis_prefix(klass = self) #:nodoc:
        @redis_prefix ||= "#{Rails.application.class.parent_name}:#{Rails.env}:" +
          klass.name.to_s.
          sub(%r{(.*::)}, '').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          downcase
      end
    end
  end
end

Redis.current = Redis.new(host: '127.0.0.1', port: 6379)
