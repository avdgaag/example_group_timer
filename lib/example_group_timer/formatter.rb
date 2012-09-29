module ExampleGroupTimer
  class Formatter < RSpec::Core::Formatters::ProgressFormatter
    attr_reader :groups
    attr_accessor :current_group

    def initialize(output)
      super
      self.current_group = RootTimedGroup.new
    end

    def example_group_started(group)
      super
      g = current_group.add_group(group)
      self.current_group = g
    end

    def example_group_finished(group)
      super
      current_group.finish
      self.current_group = current_group.parent
    end

    def example_started(example)
      super
      current_group.add_example example
    end

    def example_pending(example)
      super
      current_group.finish_current_example
    end

    def example_failed(example)
      super
      current_group.finish_current_example
    end

    def example_passed(example)
      super
      current_group.finish_current_example
    end

    def stop
      super
      current_group.finish
    end

    def dump_summary(*args)
      current_group.report
      super
    end
  end
end
