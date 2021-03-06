note
	description: "Summary description for {EL_IMAGE_UTILS_C_API}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2016 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"

	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2016-10-03 16:46:49 GMT (Monday 3rd October 2016)"
	revision: "2"

class
	EL_CURL_C_API

inherit
	EL_POINTER_ROUTINES

	EL_CURL_OPTION_CONSTANTS
		rename
			is_valid as is_valid_option_constant
		export
			{NONE} all
		end

feature {NONE} -- C externals

	c_getinfo (function: POINTER; a_curl_handle: POINTER; a_opt: INTEGER; a_data: POINTER): INTEGER
			-- C implementation of `curl_easy_getinfo'.
			-- Declared as curl_easy_setopt ().
		require
			function_attached: is_attached (function)
			valid_handle: is_attached (a_curl_handle)
			valid_option: is_valid_option_constant (a_opt)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				return (FUNCTION_CAST(CURLcode, (CURL *, CURLINFO info, ...)) $function)
												((CURL *) $a_curl_handle,
												(CURLINFO)$a_opt,
												$a_data);
			]"
		end

	c_global_cleanup (function: POINTER)
		require
			function_attached: is_attached (function)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				(FUNCTION_CAST(void, ()) $function)();
			]"
		end

	c_global_init (function: POINTER; a_opt: NATURAL_64)
			-- `a_opt' is intialization option.
		require
			function_attached: is_attached (function)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				(FUNCTION_CAST(void, (long)) $function)((long) $a_opt);
			]"
		end

	c_cleanup (function: POINTER; a_curl_handle: POINTER)
			-- Declared as curl_easy_cleanup ().
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				(FUNCTION_CAST(void, (CURL *)) $function)((CURL *)$a_curl_handle);
			]"
		end

	c_init (function: POINTER): POINTER
			-- Declared curl_easy_init ().
		require
			function_attached: is_attached (function)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				return (FUNCTION_CAST(CURL *, ()) $function)();
			]"
		end

	c_perform (function: POINTER; a_curl_handle: POINTER): INTEGER
			-- Declared as curl_easy_perform().
		require
			function_attached: is_attached (function)
			valid_handle: is_attached (a_curl_handle)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				return (FUNCTION_CAST(CURLcode, (CURL *)) $function)
											((CURL *) $a_curl_handle);
			]"
		end

	c_setopt (function: POINTER; a_curl_handle: POINTER; a_opt: INTEGER; a_data: POINTER)
			-- C implementation of `setopt_void_star'.
			-- Declared as curl_easy_setopt ().
		require
			function_attached: is_attached (function)
			valid_handle: is_attached (a_curl_handle)
			valid_option: is_valid_option_constant (a_opt)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				{
					(FUNCTION_CAST(void, (CURL *, CURLoption, ...)) $function)
													((CURL *) $a_curl_handle,
													(CURLoption)$a_opt,
													$a_data);			
				}
			]"
		end

	c_setopt_int (function: POINTER; a_curl_handle: POINTER; a_opt: INTEGER; a_data: INTEGER)
			-- Same as `c_setopt' except we can pass `a_data' as integer.
		require
			function_attached: is_attached (function)
			valid_handle: is_attached (a_curl_handle)
			valid_option: is_valid_option_constant (a_opt)
		external
			"C inline use <curl/curl.h>"
		alias
			"[
				{
					(FUNCTION_CAST(void, (CURL *, CURLoption, ...)) $function)
													((CURL *) $a_curl_handle,
													(CURLoption)$a_opt,
													$a_data);			
				}
			]"
		end

end
