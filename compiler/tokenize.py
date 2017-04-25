from grammar import Tokens

def tokenize(text, file="_in", verbose=False, emit_whitespace=False):
	"""Dead simple regex stream parser. Try parsing all of the patterns in the grammar
	(in ordereddict Tokens) in order, until one matches. Tokens match if their regex match
	and they are preeceded by a token that they have in their preeceding_in list (or that
	list is None.) The token is then emitted into the (seperate) output stream. Eventually
	that is returned. Being unable to match the stream at any point is an error."""

	text+="\n " #Trailing newline required for correct ENDOFSTATMENT insertion
	position=0
	line=0
	#Start with a ENDOFSTATMENT for stuff like function declarations to bind after
	tokens=[Tokens.T_ENDOFSTATEMENT.make_token('')]

	while position<len(text):
		if verbose: print(text[position:])
		if text[position:].startswith("\\"):
			if emit_whitespace: tokens.append(Tokens.T_WHITESPACE.make_token("\\\n", line=line))
			position+=2
			continue

		if text[position] in "\r\n":
			if verbose: print("(adding T_ENDOFSTATEMENT)")
			tokens.append(Tokens.T_ENDOFSTATEMENT.make_token("\n", line=line))
			position+=1
			line+=1
			continue

		prev=None
		for t in reversed(tokens):
			if t.type.name!="T_WHITESPACE":
				prev=t
				break

		for token in Tokens.values():
			if verbose: print(token.name)
			if token.matches(text[position:], prev):
				
				tok=token.make_token(text[position:], file=file, line=line, force_create=emit_whitespace)
				if tok:
					if verbose: print("Adding %s"%tok)
					tokens.append(tok)
				position+=len(token.regex.match(text[position:]).group())
				break
		else:
			if text[position] in " \t":
				if emit_whitespace: tokens.append(Tokens.T_WHITESPACE.make_token(text[position], line=line))
				position+=1
				continue
			raise SyntaxError("No match at %i: %s" % (position, text[position:]))

	return tokens[1:]