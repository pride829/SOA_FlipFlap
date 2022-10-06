require_relative 'flip_flap'

usage = 'Usage:  tsv_to_yml [TSV_file] [YML_file]\n'
raise ArgumentError, usage if ARGV.count.zero?

tsv_filename = ARGV[0]
yml_filename = ARGV[1]

tsv = File.read(tsv_filename)
yaml = File.read(yml_filename)

flipper1 = FlipFlap.new
flipper1.take_tsv(tsv)

flipper2 = FlipFlap.new
flipper2.take_yaml(yaml)


yaml2 = flipper2.to_yaml()
#File.write(yml_filename, flipper.to_yaml)


File.open("yaml1", 'w') { |f| f.write(yaml)}
File.open("yaml2", 'w') { |f| f.write(yaml2)}

nil

