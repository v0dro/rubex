module Rubex
  module DataType
    # FIXME: Find out a better way to generically find the old type of a typedef
    #   when the new type is encountered. Should cover cases where the new type
    #   is aliased with some other name too. In other words, reach the actual
    #   type in the most generic way possible without too many checks.
    class TypeDef
      #      include Helpers
      attr_reader :type, :old_type, :new_type

      def initialize(old_type, new_type, type)
        @old_type = old_type
        @new_type = new_type
        @type = type
      end

      def alias_type?
        true
      end

      def to_s
        @new_type.to_s
      end

      def base_type
        @old_type
      end

      def method_missing(meth, *args, &block)
        @old_type.send(meth, *args, &block)
      end
    end
  end
end
