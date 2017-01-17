//The no-good C preprocess is to blame for this
//For (imho) no good reason PCRE2 uses a bunch of macros for crap it should just do
// normally (vars and functions) like the actual function invocation and flags.
//It was simplest to just write this adaptor.

#define PCRE2_CODE_UNIT_WIDTH 8
#include <stdio.h>
#include <string.h>
#include <pcre2.h>

int _w_PCRE2_ZERO_TERMINATED = PCRE2_ZERO_TERMINATED;
int _w_PCRE2_NO_MATCH = PCRE2_ERROR_NOMATCH;


void* _w_pcre2_compile(char* str, size_t size, uint32_t flags, int* errno, size_t* errpos){
	return pcre2_compile(str, size, flags, errno, errpos, NULL);
}

void* _w_pcre2_get_error_message(int errno, char* buf, size_t bufsz){
	pcre2_get_error_message(errno, buf, bufsz);
}

void* _w_pcre2_match_data_create_from_pattern(void* re){
	return pcre2_match_data_create_from_pattern(re, NULL);
}

int _w_pcre2_match(void* re, char* str, int len, int off, int options, void* match_data){
	return pcre2_match(re, str, len, off, options, match_data, NULL);
}

void _w_pcre2_free_match_data(void* data){
	pcre2_match_data_free(data);
}

void _w_pcre2_free_pattern(void* data){
	pcre2_code_free(data);
}

void* _w_pcre2_get_ovector_ptr(void* data){
	return pcre2_get_ovector_pointer(data);
}