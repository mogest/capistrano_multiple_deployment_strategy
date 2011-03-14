require 'capistrano/recipes/deploy/strategy/base'

module Capistrano
  module Deploy
    module Strategy
      class Multiple < Base
        def initialize(config = {})
          super
          @strategies = {}
          configuration[:deploy_strategies].keys.each do |strategy|
            @strategies[strategy] = Capistrano::Deploy::Strategy.new(strategy, config)
          end
        end

        def deploy!
          original_roles = ENV['ROLES']
          begin
            configuration[:deploy_strategies].each do |strategy, roles|
              roles = Array(roles)
              puts "  * deploying roles #{roles.join(", ")} using strategy #{strategy}"
              ENV['ROLES'] = roles.join(",")
              @strategies[strategy].deploy!
            end
          ensure
            ENV['ROLES'] = original_roles
          end
        end

        def check!
          @strategies.values.each do |strategy|
            strategy.check!
          end
        end
      end
    end
  end
end
