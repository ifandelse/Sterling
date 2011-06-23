-module(sterling).

-export([substitute_chars/3, gsubstitute_chars/3]).

% One time replacement
substitute_chars(InStr, TargetSeq, ReplaceSeq) ->
	TPos = string:str(InStr, TargetSeq),
	if
		TPos =:= 0 ->
			InStr;
		true -> 
    		SeqLen = string:len(TargetSeq),
			string:concat(string:concat(string:substr(InStr, 1, TPos -1), ReplaceSeq),string:substr(InStr,TPos + SeqLen))
	end.

% Global replacement - replaces all occurrences
gsubstitute_chars(InStr, TargetSeq, ReplaceSeq) ->
	NewStr = substitute_chars(InStr, TargetSeq, ReplaceSeq),
	substitute_chars(NewStr, TargetSeq, ReplaceSeq),
	gsubstitute_chars(NewStr, TargetSeq, ReplaceSeq, InStr).

gsubstitute_chars(InStr, _, _, InStr) ->
	InStr;
gsubstitute_chars(InStr, TargetSeq, ReplaceSeq, _) ->
	NewStr = substitute_chars(InStr, TargetSeq, ReplaceSeq),
	gsubstitute_chars(NewStr, TargetSeq, ReplaceSeq, InStr).
