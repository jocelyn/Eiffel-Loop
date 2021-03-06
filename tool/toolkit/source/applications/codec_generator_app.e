note
	description: "Summary description for {CODEC_GENERATER_APP}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-07-19 6:35:19 GMT (Tuesday 19th July 2016)"
	revision: "1"

class
	CODEC_GENERATOR_APP

inherit
	EL_TESTABLE_COMMAND_LINE_SUB_APPLICATION [CODEC_GENERATOR]
		redefine
			Option_name
		end

create
	make

feature -- Test

	test_run
			--
		do
			Test.set_binary_file_extensions (<< "evc" >>)
			Test.do_file_tree_test ("codec-generation", agent test_generation, 3741528401)
		end

	test_generation (dir_path: EL_DIR_PATH)
			--
		local
			template_path, source_path: EL_FILE_PATH
		do
			template_path := dir_path + "template.evol"
			source_path := dir_path + "test-decoder.c"
			create command.make (source_path, template_path)
			normal_run
		end

feature {NONE} -- Implementation

	make_action: PROCEDURE [like command, like default_operands]
		do
			Result := agent command.make
		end

	default_operands: TUPLE [source_path, template_path: EL_FILE_PATH]
		do
			create Result
			Result.source_path := ""
			Result.template_path := ""
		end

	argument_specs: ARRAY [like Type_argument_specification]
		do
			Result := <<
				required_argument ("c_source", "C source code path"),
				required_argument ("template", "Eiffel codec template")
			>>
		end

feature {NONE} -- Constants

	Option_name: STRING = "generate_codecs"

	Description: STRING = "Generate Eiffel codecs from VTD-XML C source"

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{CODEC_GENERATOR_APP}, All_routines],
				[{CODEC_GENERATOR}, All_routines]
			>>
		end

end