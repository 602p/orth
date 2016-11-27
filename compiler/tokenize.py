from grammar import Tokens

def tokenize(text, file="_in", verbose=False):
	text+="\n "
	position=0
	line=0
	tokens=[Tokens.T_ENDOFSTATEMENT.make_token('')]
	while position<len(text):
		if verbose: print(text[position:])
		if text[position:].startswith("\\"):
			position+=2
			continue

		if text[position] in "\r\n":
			if verbose: print("(adding T_ENDOFSTATEMENT)")
			tokens.append(Tokens.T_ENDOFSTATEMENT.make_token(";", line=line))
			position+=1
			line+=1
			continue

		

		for token in Tokens.values():
			if verbose: print(token.name)
			if token.matches(text[position:], tokens[-1] if tokens else None):
				
				tok=token.make_token(text[position:], file=file, line=line)
				if tok:
					if verbose: print("Adding %s"%tok)
					tokens.append(tok)
				position+=len(token.regex.match(text[position:]).group())
				break
		else:
			if text[position] in " \t":
				position+=1
				continue
			print(tokens)
			raise SyntaxError("No match at %i: %s" % (position, text[position:]))

	return tokens[1:]