-module(sterling_test).

-include_lib("eunit/include/eunit.hrl").

substitute_chars_test() ->
    "Bugs Bunny" = sterling:substitute_chars("Daffy Bunny" ,"Daffy", "Bugs").

gsubstitute_chars_test() ->
    "Department of Redundancy Department" = sterling:gsubstitute_chars("Division of Redundancy Division", "Division", "Department").

find_all_positions_test() ->
    [3,9,10,28] = sterling:find_all_positions("10,\"Yep\",,\"Some \"\"quotes\"\"\",\"\"", ",").

find_all_positions2_test() ->
    [5,11,24] = sterling:find_all_positions("Monday is a very fine day", "a").

find_all_positions3_test() ->
    [] = sterling:find_all_positions("You ain't going to find it here...", ":").

find_all_positions4_test() ->
    [1,13,22] = sterling:find_all_positions("it could be iterated itself", "it").

find_all_positions5_test() ->
    [1,5,9,13,17,21,25] = sterling:find_all_positions("dah dah dah dah dah dah dah", "dah").
