module Nyaplot
  class CircularPlot < Plot
    include Jsonizable
    undef_method :add_with_df
    define_properties(:extension)

    def initialize(df, group_label, nested_label)
      super()
      @df = df
      @group_by = group_label
      @nested_label = nested_label
      @inner_num = 0
      @outer_num = 1
      @matrix = nil
      extension('Bionya')
    end

    def add_chord(matrix)
      @matrix = matrix
    end

    def add(layer, type, *labels)
      if(layer>0)
        @outer_num += 1
      elsif
        @inner_num += 1
      end

      diagram = Diagram.new(@df, type, labels.push(@nested_label))
      diagram.layer(layer)
      @axis = diagram.x
      self.diagrams.push(diagram)
      return diagram
    end

    def before_to_json
      zoom(true)
      width(800) if width.nil?
      height(800) if height.nil?

      self.options[:axis_extra_options] = {
        group_by: @group_by,
        inner_num: @inner_num,
        outer_num: @outer_num,
        matrix: @matrix,
        df_id: @df.name,
        axis: @axis
      }
    end
  end
end
