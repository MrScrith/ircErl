%% Copyright (c) 2009, Trouser Enthusiast LLC
%% All rights reserved.
%% 
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted provided that the following conditions are met:
%%     * Redistributions of source code must retain the above copyright
%%       notice, this list of conditions and the following disclaimer.
%%     * Redistributions in binary form must reproduce the above copyright
%%       notice, this list of conditions and the following disclaimer in the
%%       documentation and/or other materials provided with the distribution.
%%     * Neither the name of the Trouser Enthusiast nor the
%%       names of its contributors may be used to endorse or promote products
%%       derived from this software without specific prior written permission.
%% 
%% THIS SOFTWARE IS PROVIDED BY Trouser Enthusiast LLC ''AS IS'' AND ANY
%% EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
%% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
%% DISCLAIMED. IN NO EVENT SHALL Trouser Enthusiast LLC BE LIABLE FOR ANY
%% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
%% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
%% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
%% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
%% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%%%----FILE ircErl_server_manager.erl
-module(ircErl_server_manager).
-export([server_manager_start/0]).
-include("ircErl_config.erl").
-include("ircErl_records.erl").


server_manager_start() ->
    register(server_manager,spawn(server_manager([]))).
    

servermanager(ServerList) ->
    receive
        {#serverMessage{message=Message}, ServerList} ->
            if
                [58|_] == Message ->
                    %% 58 = :, catches those pesky reversed message formats.
                    ok; %% or at least it will once I write all that...
                list:prefix("JOIN",Message) ->
                    %% the start of the regular messages. I think...
                    ok
            end,
            servermanager(ServerList);
        shutdown ->
            exit(normal);
        big_bada_boom ->
            exit(big_bada_boom)
    end.
    