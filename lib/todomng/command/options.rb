require 'optparse'

module TodoMng

  class Command
    module Options

      def self.parse!(argv)

        options = {}

        # サブコマンドの処理をする前に、未定義のkeyを指定されたら例外を発生させる
        sub_command_parsers = Hash.new do |k, v|
          raise ArgumentError, "'#{v}' is not todomng sub command."
        end

        # サブコマンド用の定義
        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.on('-n VAL', '--name=VAL',    'task name')    { |v| options[:name]    = v }
          opt.on('-c VAL', '--content=VAL', 'task content') { |v| options[:content] = v }
        end

        # サブコマンド以外の引数の定義
        command_parser = OptionParser.new do |opt|
          opt.on_head('-v', '--version', 'Show program version') do |v|
            opt.version = TodoMng::VERSION
            puts opt.ver
            exit
          end
        end

        # 引数の解析を行う
        begin
          command_parser.order!(argv)

          options[:command] = argv.shift

          sub_command_parsers[options[:command]].parse!(argv)

          rescue OptionParser::MissingArgment, OptionParser::InvalidOption, ArgumentError => e
          abort e.message
        end

        options
      end
    end
  end
end
