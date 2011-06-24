-module(sterling).

-export([substitute_chars/3, gsubstitute_chars/3, find_all_positions/2]).

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

% This can technically be done using Regex - but here's a string alternative
% In case Regex proves to be less performant
find_all_positions(InStr, TargetSeq) ->
    find_all_positions(InStr, TargetSeq, [], 0).

find_all_positions(InStr, TargetSeq, Accum, PriorLen)->
    TPos = string:str(InStr, TargetSeq),
    if
        TPos =:= 0 ->
            lists:reverse(Accum);
        true ->
            NewAccum = [ TPos + PriorLen | Accum ],
            NewOffset = TPos + string:len(TargetSeq),
            NewStr = string:substr(InStr,NewOffset),
            NewPriorLen = string:len(InStr) - string:len(NewStr) + PriorLen,
            find_all_positions(NewStr, TargetSeq, NewAccum, NewPriorLen)
    end.
