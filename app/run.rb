# frozen_string_literal: true

require 'active_record'
require 'sqlite3'

module Tasklite
  module App
    class Run
      
      SERVICES = {
        new: 'AddTask',
        update: 'UpdateTask',
        delete: 'DeleteTask'
      }

      def init(options)
        klass = "Tasklite::#{SERVICES[options[:command]]}".constantize
        klass.call(options[:value])
      rescue NameError
        puts "wrong command"
      end
    end
  end
end
