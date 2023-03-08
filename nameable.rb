class Nameable
    def correct_name
      raise NotImplementedError, "Subclasses must implement the correct_name method"
    end
end

class Decorator < Nameable
    def initialize(nameable)
      @nameable = nameable
    end
    
    def correct_name
      @nameable.correct_name
    end
  end

  