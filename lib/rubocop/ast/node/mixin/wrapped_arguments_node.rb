# frozen_string_literal: true

module RuboCop
  module AST
    # Common functionality for nodes that may have their arguments
    # wrapped in a `begin` node
    module WrappedArgumentsNode
      # Returns the arguments of the `return`.
      #
      # @return [Array] The arguments of the `return`.
      def arguments
        first = children.first
        if first&.begin_type?
          first.children
        else
          children
        end
      end
    end
  end
end
