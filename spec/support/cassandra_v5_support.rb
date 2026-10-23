# -*- encoding : utf-8 -*-
# cassandra-driver 3.2.5 only knows schema fetchers up to Cassandra 4.x and
# raises "unsupported release version" against 5.x. Register 5.x with the same
# fetcher used for 3.x/4.x so specs can run against a Cassandra 5 server.
# Mirrors the initializer used by the webapp.
module Cassandra
  class Driver
    private

    unless private_method_defined?(:create_schema_fetcher_picker_without_v5)
      alias_method :create_schema_fetcher_picker_without_v5,
                   :create_schema_fetcher_picker

      def create_schema_fetcher_picker
        create_schema_fetcher_picker_without_v5.tap do |picker|
          picker.when('5.') do
            Cluster::Schema::Fetchers::V3_0_x.new(schema_cql_type_parser,
                                                  cluster_schema)
          end
        end
      end
    end
  end
end
