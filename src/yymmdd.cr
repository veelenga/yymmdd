require "./yymmdd/*"

module YYMMDD
  macro define(formats)
    {% for fmt in formats %}
      def {{fmt.id}}
        DatePart.new {{fmt}}
      end
    {% end %}
  end

  define %w(yyyy yy y mm m dd d)

  class DatePart
    TIME_FORMATS = {
      "yyyy" => "%Y",
      "yy"   => "%y",
      "y"    => "%y",
      "mm"   => "%m",
      "m"    => "%-m",
      "dd"   => "%d",
      "d"    => "%-d"
    }

    def initialize(@format, @time = nil)
    end

    def to_s(io : IO)
      to_str io
    end

    def inspect(io : IO)
      to_str io
    end

    private def to_str(io : IO)
      time = @time || Time.now
      format = TIME_FORMATS[@format]
      Time.now.to_s format, io
    end
  end
end
