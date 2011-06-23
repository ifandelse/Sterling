-module(sterling_test).

-include_lib("eunit/include/eunit.hrl").

substitute_chars_test() ->
    "Bugs Bunny" = sterling:substitute_chars("Daffy Bunny" ,"Daffy", "Bugs").

gsubstitute_chars_test() ->
    "Department of Redundancy Department" = sterling:gsubstitute_chars("Division of Redundancy Division", "Division", "Department").

