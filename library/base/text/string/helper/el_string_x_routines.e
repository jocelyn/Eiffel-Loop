﻿note
	description: "Summary description for {EL_STRING_X_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-12-26 17:07:53 GMT (Saturday 26th December 2015)"
	revision: "1"

deferred class
	EL_STRING_X_ROUTINES [S -> STRING_GENERAL create make_empty, make end]

inherit
	STRING_HANDLER

feature -- Search operations

	search_interval_at_nth (text, search_string: S; n: INTEGER): INTEGER_INTERVAL
			--
		local
			l_occurrences: EL_OCCURRENCE_SUBSTRINGS [S]
		do
			create l_occurrences.make (text, search_string)
			from l_occurrences.start until l_occurrences.after or l_occurrences.index > n loop
				l_occurrences.forth
			end
			Result := l_occurrences.item_interval
		end

feature -- Measurement

	maximum_count (strings: INDEXABLE [READABLE_STRING_GENERAL, INTEGER]): INTEGER
			--
		local
			i, count: INTEGER
		do
			count := strings.index_set.upper
			from i := 1 until i > count loop
				if strings.item (i).count > Result then
					Result := strings.item (i).count
				end
				i := i + 1
			end
		end

feature -- Transformation

	delimited_list (text, delimiter: S): LIST [S]
			-- string delimited list
		local
			intervals: EL_DELIMITED_SUBSTRING_INTERVALS [S]
		do
			create intervals.make (text, delimiter)
			Result := intervals.substrings
		end

	enclosed (str: READABLE_STRING_GENERAL; left, right: CHARACTER_32): S
			--
		do
			create Result.make (str.count + 2)
			Result.append_code (left.natural_32_code)
			Result.append (str)
			Result.append_code (right.natural_32_code)
		end

	leading_delimited (text, delimiter: S; include_delimiter: BOOLEAN): S
			--
		local
			l_occurrences: EL_OCCURRENCE_SUBSTRINGS [S]
		do
			create l_occurrences.make (text, delimiter)
			l_occurrences.start
			if l_occurrences.after then
				create Result.make (0)
			else
				if include_delimiter then
					Result := text.substring (1, l_occurrences.item_upper)
				else
					Result := text.substring (1, l_occurrences.item_lower - 1)
				end
			end
		end

	prune_all_leading (str: S; c: CHARACTER_32)
		deferred
		end

	quoted (str: READABLE_STRING_GENERAL): S
			--
		do
			Result := enclosed (str, '%"', '%"')
		end

	remove_bookends (str: S; ends: READABLE_STRING_GENERAL)
			--
		require
			ends_has_2_characters: ends.count = 2
		do
			if str.item (1) = ends.item (1) then
				str.keep_tail (str.count - 1)
			end
			if str.item (str.count) = ends.item (2) then
				str.set_count (str.count - 1)
			end
		end

	remove_double_quote (quoted_str: S)
			--
		do
			remove_bookends (quoted_str, once "%"%"" )
		end

	remove_single_quote (quoted_str: S)
			--
		do
			remove_bookends (quoted_str, once "''" )
		end

	replace_character (target: S; uc_old, uc_new: CHARACTER_32)
		local
			i: INTEGER; code_old, code_new: NATURAL
		do
			code_old := uc_old.natural_32_code; code_new := uc_new.natural_32_code
			from i := 1 until i > target.count loop
				if target.code (i) = code_old then
					target.put_code (code_new, i)
				end
				i := i + 1
			end
		end

	spaces (width, count: INTEGER): S
			-- width * count spaces
		local
			i, n: INTEGER
		do
			n := width * count
			create Result.make (n)
			from i := 1 until i > n loop
				Result.append_code (32)
				i := i + 1
			end
		end

	translate (target, old_characters, new_characters: S)
		do
			translate_deleting_null_characters (target, old_characters, new_characters, False)
		end

	translate_and_delete (target, old_characters, new_characters: S)
		do
			translate_deleting_null_characters (target, old_characters, new_characters, True)
		end

	translate_deleting_null_characters (target, old_characters, new_characters: S; delete_null: BOOLEAN)
		require
			each_old_has_new: old_characters.count = new_characters.count
		local
			source: S; c, new_c: CHARACTER_32; i, index: INTEGER
		do
			source := target.twin
			target.set_count (0)
			from i := 1 until i > source.count loop
				c := source [i]
				index := old_characters.index_of (c, 1)
				if index > 0 then
					new_c := new_characters [index]
					if delete_null implies new_c > '%U' then
						target.append_code (new_c.natural_32_code)
					end
				else
					target.append_code (c.natural_32_code)
				end
				i := i + 1
			end
		end

	unbracketed (str: READABLE_STRING_GENERAL; left_bracket: CHARACTER_32): S
			-- Returns text enclosed in one of matching paired characters: {}, [], (), <>
		require
			valid_left_bracket: ({STRING_32} "{[(<").has (left_bracket)
		local
			right_chararacter: CHARACTER_32
			offset: NATURAL; left_index, right_index, i: INTEGER
			l_result: READABLE_STRING_GENERAL
		do
			create Result.make_empty

			if left_bracket = '(' then
				offset := 1
			else
				offset := 2
			end
			right_chararacter := (left_bracket.natural_32_code + offset).to_character_32
			left_index := str.index_of (left_bracket, 1)
			right_index := str.index_of (right_chararacter, left_index + 1)
			if left_index > 0 and then right_index > 0 and then right_index - left_index > 1 then
				l_result := str.substring (left_index + 1, right_index - 1)
				from i := 1 until i > l_result.count loop
					Result.append_code (l_result.code (i))
					i := i + 1
				end
			end
		end

	unescape (
		str: STRING_GENERAL; escape_character: CHARACTER_32;  escaped_characters: HASH_TABLE [CHARACTER_32, CHARACTER_32]
	)
		require
			double_escapes_are_literal_escapes: escaped_characters [escape_character] = escape_character
		local
			pos_escape, start_index: INTEGER
		do
			from pos_escape := str.index_of (escape_character, 1) until pos_escape = 0 loop
				if pos_escape + 1 <= str.count then
					escaped_characters.search (str [pos_escape + 1])
					if escaped_characters.found then
						str.put_code (escaped_characters.found_item.natural_32_code, pos_escape + 1)
						str.remove (pos_escape)
						start_index := pos_escape + 1
					else
						start_index := pos_escape + 2
					end
					pos_escape := str.index_of (escape_character, start_index)
				else
					pos_escape := 0
				end
			end
		end

	words (str: READABLE_STRING_GENERAL): LIST [S]
			-- unpunctuated words
		local
			i: INTEGER; l_str: S
		do
			create l_str.make (str.count)
			from i := 1 until i > str.count loop
				if not is_punctuation (str [i]) then
					l_str.append_code (str.code (i))
				end
				i := i + 1
			end
			Result := l_str.split (' ')
		end

feature -- Status query

	has_enclosing (s, ends: READABLE_STRING_GENERAL): BOOLEAN
			--
		require
			ends_has_2_characters: ends.count = 2
		do
			Result := s.count >= 2
				and then s.item (1) = ends.item (1) and then s.item (s.count) = ends.item (2)
		end

	has_double_quotes (s: READABLE_STRING_GENERAL): BOOLEAN
			--
		do
			Result := has_enclosing (s, once "%"%"")
		end

	has_single_quotes (s: READABLE_STRING_GENERAL): BOOLEAN
			--
		do
			Result := has_enclosing (s, once "''")
		end

	is_punctuation (c: CHARACTER_32): BOOLEAN
		do
			Result := c.is_punctuation
		end

	is_word (str: S): BOOLEAN
		do
			Result := not str.is_empty
		end

feature -- Hexadecimal conversion

	hexadecimal_to_integer (str: S): INTEGER
			--
		local
			str_lower: STRING; x_pos: INTEGER
		do
			str_lower := str.as_string_8
			str_lower.to_lower
			x_pos := str_lower.index_of ('x', 1)
			Result := String_8.hexadecimal_to_integer (str_lower.substring (x_pos + 1, str_lower.count))
		end

	hexadecimal_to_natural_64 (str: S): NATURAL_64
			--
		local
			l_str: S; i: INTEGER; place_value: NATURAL_64
		do
			l_str := str.twin
			if l_str.count > 2 and then l_str.code (2) = ('x').natural_32_code then
				l_str.put_code (Code_zero, 2)
			end
			prune_all_leading (l_str, '0')
			from i := 1 until i > l_str.count loop
				place_value := hex_digit_to_decimal (l_str.code (i)).to_natural_64
				Result := Result | place_value.bit_shift_left ((l_str.count - i) * 4)
				i := i + 1
			end
		end

feature -- Measurement

	occurrences (text, search_string: S): INTEGER
			--
		local
			l_occurrences: EL_OCCURRENCE_SUBSTRINGS [S]
		do
			create l_occurrences.make (text, search_string)
			from l_occurrences.start until l_occurrences.after loop
				Result := Result + 1
				l_occurrences.forth
			end
		end

	word_count (str: READABLE_STRING_GENERAL): INTEGER
		do
			across str.split ('%N') as line loop
				across words (line.item) as word loop
					if is_word (word.item) then
						Result := Result + 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	hex_digit_to_decimal (code: NATURAL): NATURAL
		do
			if code >= Code_a_lower then
				Result := code - Code_a_lower + 10

			elseif code >= Code_a_upper then
				Result := code - Code_a_upper + 10

			elseif code >= Code_zero then
				Result := code - Code_zero

			end
		end

feature {NONE} -- Constants

	String_8: KL_STRING_ROUTINES
		once
			create Result
		end

	Code_a_lower: NATURAL
		once
			Result := ('a').natural_32_code
		end

	Code_a_upper: NATURAL
		once
			Result := ('A').natural_32_code
		end

	Code_zero: NATURAL
		once
			Result := ('0').natural_32_code
		end

end
