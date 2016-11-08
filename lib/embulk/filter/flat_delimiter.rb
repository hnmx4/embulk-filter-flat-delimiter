module Embulk
  module Filter

    class FlatDelimiter < FilterPlugin
      Plugin.register_filter("flat_delimiter", self)

      def self.transaction(config, in_schema, &control)
        task = {
            'convert_columns' => config.param('convert_columns', :array, default: []),
        }

        yield(task, in_schema)
      end

      def init
        @convert_columns = task['convert_columns']
      end

      def close
      end

      def delimiters2str(str)
        delimiters = %w[- :].push(' ')
        src = [/1/, /2/, /3/, /4/, /5/, /6/, /7/, /8/, /9/, /0/]
        res = %w(One Two Three Four Five Six Seven Eight Nine Zero)

        ret = str
        unless str.nil?
          delimiters.each { |del| ret = ret.delete(del) }
          src.zip(res).each { |item| ret = ret.gsub(item[0], item[1]) }
        end
        return ret
      end

      def add(page)
        col_indexs = []
        @convert_columns.each do |col|
          col_indexs.push((page.schema.select { |c| c.name == col['name'] })[0].index)
        end
        page.each do |record|
          col_indexs.each { |idx| record[idx] = delimiters2str(record[idx]) }
          page_builder.add(record)
        end
      end

      def finish
        page_builder.finish
      end
    end

  end
end
