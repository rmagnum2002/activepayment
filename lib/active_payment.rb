require "bundler/setup"

require 'uri'
require 'net/http'
require 'net/https'

require "active_support/core_ext"
require "builder"
require "nokogiri"
require "money"
require "uuid"

require "activepayment/version"
require "activepayment/response"
require "activepayment/gateways/wirecard"

module ActivePayment
  class Exception < RuntimeError

  end

  Symbol.class_eval do
    define_method :to_node_name do
      if self.to_s.match('[0-9]')
        self.to_s.upcase
      else
        self.to_s.camelize.gsub('Id', 'ID')
      end
    end
  end
end
