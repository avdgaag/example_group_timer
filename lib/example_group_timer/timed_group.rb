module ExampleGroupTimer
  class TimedGroup < TimedItem
    attr_reader :subgroups, :examples, :current_example

    def initialize(*args)
      super
      @subgroups, @examples = [], []
    end

    def add_group(group)
      g = TimedGroup.new(group, self)
      @subgroups << g
      g
    end

    def add_example(example)
      @current_example = TimedItem.new(example, self)
      examples << @current_example
    end

    def finish_current_example
      @current_example.finish
      @current_example = nil
    end

    def report
      super
      puts "<ol>"
      (examples + subgroups).sort_by(&:duration).reverse.each(&:report)
      puts "</ol>"
    end
  end
end
