require File.dirname(__FILE__) + '/braintree1'
require File.dirname(__FILE__) + '/braintree2'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class BraintreeGateway
      def self.new(options = {})
        if options[:login]
          Braintree1Gateway.new(options)
        elsif options[:merchant_id]
          Braintree2Gateway.new(options)
        else
          raise ArgumentError, "Expected #{options.inspect} to contain either :merchant_id or :login"
        end
      end
    end
  end
end