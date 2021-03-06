note
	description: "[
		Classes which inherit from `EVOLICITY_SERIALIZEABLE' can be serialized as text files using an Evolicity
		template. A template contains a mixture of literal text and Evolicity code that outputs data from Eiffel
		objects. The template can be an either an external file or hard coded in the class by implementing the
		function `template: READABLE_STRING_GENERAL'.
	]"

	notes: "See end of page"

	

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-08-02 12:55:58 GMT (Tuesday 2nd August 2016)"
	revision: "2"

deferred class
	EVOLICITY_SERIALIZEABLE

inherit
	EVOLICITY_EIFFEL_CONTEXT
		redefine
			new_getter_functions, make_default
		end

	EL_ENCODEABLE_AS_TEXT

	EL_MODULE_EVOLICITY_TEMPLATES

	EL_MODULE_FILE_SYSTEM

feature {NONE} -- Initialization

	make_default
			--
		require else
			template_attached: attached template
		do
			Precursor
			output_path := Empty_file_path
			template_path := Empty_file_path
			set_default_encoding
			if has_string_template then
				Evolicity_templates.put (template_name, stripped_template)
			end
		end

	make_from_file (a_output_path: like output_path)
			--
		do
			make_from_template_and_output (Empty_file_path, a_output_path)
			if file_must_exist and not output_path.exists then
				serialize
			end
		ensure
			output_path_exists: file_must_exist implies output_path.exists
		end

	make_from_template (a_template_path: like output_path)
			--
		do
			make_from_template_and_output (a_template_path, Empty_file_path)
		end

	make_from_template_and_output (a_template_path, a_output_path: like output_path)
			--
		require
			template_exists: not a_template_path.is_empty implies a_template_path.exists
		do
			make_default
			output_path := a_output_path; template_path := a_template_path
			if not template_path.is_empty then
				Evolicity_templates.put_from_file (template_path)
			end
		end

feature -- Access

	output_path: EL_FILE_PATH

feature -- Conversion

	as_text: ZSTRING
			--
		do
			Evolicity_templates.set_text_encoding (Current)
			Result := Evolicity_templates.merged (template_name, Current)
		end

	as_utf_8_text: STRING
			--
		do
			Evolicity_templates.set_encoding_utf_8
			Result := Evolicity_templates.merged_utf_8 (template_name, Current)
		end

feature -- Element change

	set_default_encoding
		do
			set_utf_encoding (8)
		end

	set_output_path (a_output_path: like output_path)
		do
			output_path := a_output_path
		end

feature -- Basic operations

	serialize
		do
			File_system.make_directory (output_path.parent)
			serialize_to_file (output_path)
		end

	serialize_to_file (file_path: like output_path)
			--
		do
			Evolicity_templates.set_text_encoding (Current)
			Evolicity_templates.merge_to_file (template_name, Current, new_open_write_file (file_path))
		end

	serialize_to_stream (stream_out: EL_OUTPUT_MEDIUM)
			--
		do
			Evolicity_templates.set_text_encoding (Current)
			Evolicity_templates.merge (template_name, Current, stream_out)
		end

feature -- Status query

	has_string_template: BOOLEAN
		do
			Result := not template.is_empty
		end

	is_bom_enabled: BOOLEAN
		do
			Result := False
		end

feature {NONE} -- Implementation

	file_must_exist: BOOLEAN
			-- True if output file always exists after creation
		do
			Result := False
		end

	new_getter_functions: like getter_functions
			--
		do
			Result := Precursor
			Result [Default_variable.template_name] := agent template_name
			Result [Default_variable.encoding_name] := agent encoding_name
			Result [Default_variable.current_object] := agent: EVOLICITY_CONTEXT do Result := Current end
		end

	new_open_read_file (file_path: like output_path): PLAIN_TEXT_FILE
		do
			create Result.make_open_read (file_path)
		end

	new_open_write_file (file_path: like output_path): EL_PLAIN_TEXT_FILE
			--
		do
			create Result.make_open_write (file_path)
			Result.set_encoding_from_other (Current)
			if is_bom_enabled then
				Result.enable_bom; Result.put_bom
			end
		end

	stored_successfully (a_file: like new_open_read_file): BOOLEAN
		do
			Result := True
		end

	stripped_template: ZSTRING
			-- template stripped of any leading tabs
		local
			tab_count: INTEGER; l_template: like template
		do
			l_template := template
			if attached {ZSTRING} l_template as str_z then
				Result := str_z.twin
			else
				create Result.make_from_unicode (l_template)
			end
			if not Result.is_empty then
				from until Result.z_code (tab_count + 1) /= Tabulation_code loop
					tab_count := tab_count + 1
				end
			end
			if tab_count > 1 then
				Result.prepend (new_line)
				Result.replace_substring_all (create {ZSTRING}.make_filled ('%N', tab_count), New_line)
				Result.remove_head (1)
			end
		end

	template: READABLE_STRING_GENERAL
			--
		deferred
		end

	template_name: EL_FILE_PATH
			--
		do
			if template_path.is_empty then
				Template_names.search (generator)
				if Template_names.found then
					Result := template_names.found_item
				else
					create Result
					Result.set_base (generator)
					Result.base.prepend_character ('{')
					Result.base.append_string_general (once "}.template")
					template_names.extend (Result, generator)
				end
			else
				Result := template_path
			end
		end

	template_path: like output_path

feature {NONE} -- Constants

	Empty_file_path: EL_FILE_PATH
			--
		once
			create Result
		end

	Empty_template: STRING
		once
			create Result.make_empty
		end

	New_line: ZSTRING
		once
			Result := "%N"
		end

	Tabulation_code: NATURAL
			--
		once
			Result := {ASCII}.Tabulation.to_natural_32
		end

	Template_names: HASH_TABLE [EL_FILE_PATH, STRING]
		once
			create Result.make (7)
		end

	Default_variable: TUPLE [encoding_name, template_name, current_object: ZSTRING]
			-- built-in variables
		once
			create Result
			Result.encoding_name := "encoding_name"
			Result.template_name := "template_name"
			Result.current_object := "current"
		end

note
	notes: "[
		**VARIABLE CONTEXTS**
		
		Variables which can be referenced in the template are specified by implementing the function `getter_function_table'
		that returns a table mapping variable names to agent functions.
		
			getter_function_table: like getter_functions
					--
				do
					create Result.make (<<
						["<varible-name>",		agent some_function],
						..
					>>)
				end
			
		The return type of each agent function must conform to one of the following:

		**1.** Basic Types

		A basic type is one of: `READABLE_STRING_GENERAL, INTEGER_REF, NATURAL_REF, BOOLEAN_REF or DOUBLE_REF'

		**2.** Evolicity Context

		A type conforming to `EVOLICITY_CONTEXT' or `EVOLICITY_CONTEXT_IMP' or `EVOLICITY_SERIALIZEABLE'. In the
		client template page, you use the standard feature call dot notation to select which object within
		the context you want to substitute into the template.
		
		**3.** An Iterable List
		
		An iterable list `ITERABLE [G]' where G conforms to one of the types 1, 2, 3, or 4. (Yes this is a recursive
		definition.)

		**4.** A Sequence List
		
		An iterable list `SEQUENCE [G]' where G conforms to one of the types 1, 2, 3, or 4. (Yes this is a recursive
		definition.)
		
		These function agents can either be anonymous agents that reference a class attribute or a class function.
		
		**STANDARD VARIABLES**
		
		Contexts which inherit `EVOLICITY_SERIALIZEABLE' have a number of built-in standard variables. These are:
		
		* **encoding_name:** the output encoding for the current template. For example: `UTF-8'
		* **template_name:** the name of the current template. Internally this is of type `EL_FILE_PATH'.
		* **current:** the current context of the template

		**SYNTAX REFERENCE**
		
		**Variable Identifiers**
		Evolicity identifiers must start with an alphabetical character optionally followed by a string of alphanumeric or
		underscore characters. The standard way to substitute Evolicity variables into the text template is to place the 
		variable name in curly braces prefixed with the '$' symbol, for example ''foo'' or ''foo.bar'' is: `${foo}' or `${foo.bar}'.
		However if there are no identifier characters adjoining the left or right of the variable name as for example `${foo}_x',
		then this syntax may be abbreviated to just: `$foo' or `$foo.bar'
		
		**Conditional Directives**

			#if <boolean expression> then
				<directive block>
			#else
				<directive block>
			#end

		Currently only a limited range of boolean expressions are possible. A future release will implement a more complete expression parser.
		For the time being the following types of non-recursive expression are supported:

		* Numeric comparisons where a and b are numeric variables or integer constants: `$a < $b', `$a > 0', `$a = 0', `$a /= 0'
		* Logical conjunction: `<expr> and <expr>' where <expr> is a numeric comparison or boolean reference variable.
		* Logical negation: `not <expr>' where <expr> is a numeric comparison or boolean reference variable.
		* Container status: `<sequence-name>.is_empty' where ''<sequence-name>'' is a reference to an Eiffel object conforming to
		type `SEQUENCE'.

		More complicated expressions can be implemented an Eiffel function returning a boolean and then
		referenced as an Evolicity variable.

		**''Foreach'' Loop Iteration**
		
		It is possible to iterate any object which conforms to the type `SEQUENCE [G]' where G is either an Evolicity context

			#foreach $<variable-name> in $<sequence-name> loop
				<directive block>
			#end

		The loop index can be referenced using the implicit variable: `$loop_index'.

		**''Across'' Loop Iteration**

		An alternative loop syntax which uses an Eiffel like syntax is as follows:

			#across $<iterable-name> as $<variable-name> loop
				<directive block>
			#end

		The object referenced by `<iterable-name>' must conform to type `ITERABLE [G]'. Just like in Eiffel
		you reference the item values in the directive block using the syntax `$<variable-name>.item', and you can reference the
		cursor index as: `$cursor_index.item'.

		**The Evaluate Directive**

		The ''#evaluate'' directive exists to include the contents of a substituted template inside another template.
		The ''#evaluate'' directive takes two arguments, the first is a reference to a template, and the second to some
		data that can be referenced from the specified template.

		There are three ways to reference a template for an ''#evaluate'' directive. These are as follows

			1. First way
			#evaluate ({<CLASS-NAME>}.template, $<variable-name>)

		Here `<CLASS-NAME>' must be some type which conforms to type `EVOLICITY_SERIALIZEABLE' and therefore has a template.
		The variable in the second argument is some Eiffel data accessible as an Evolicity variable which is referenced
		by the nested template.

			2. Second way
			#evaluate ($<variable-name>.template_name, $<variable-name>)

		Here the first argument is a reference to an object that conforms to type `EVOLICITY_SERIALIZEABLE' and
		therefore has a template name which be referenced with the implicit variable name `template_name'.

			3. Third way
			#evaluate ($<template-variable-name>, $<variable-name>)

		Here the `<template-variable-name>' references a file path to an externally loadable template.

		You can merge nested templates in a loop using the following syntax.

			#across $<iterable-name> as $<variable-name> loop
				#evaluate ($<variable-name>.item.template_name, $<variable-name>.item)
			#end

		Here the iterable container must conform to type `ITERABLE [EVOLICITY_SERIALIZEABLE]'. Note that even if the
		the nested text spans multiple lines, as it most likely will do, it will be indented to same indent level as
		the `#evaluate' directive.
		
		**The Include Directive**
		
			#include ($<file-path>)
		
		The ''#include'' directive exists to include another file containing "static text" with no substitution code.
		
		(TO DO: Allow relative path as a string constant argument)
	]"

end
