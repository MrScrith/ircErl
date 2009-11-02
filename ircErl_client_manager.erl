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

%%%----FILE ircErl_client_manager.erl
-module(ircErl_client_manager).
-export([client_manager_start/0]).
-include("ircErl_config.erl").
-include("ircErl_records.erl").
-include("ircErl_numeric_replies.hrl").

client_manager_start() ->
    register(clientmanager,spawn(client_manager())).
    
client_manager(ClientList) ->
    receive
        {#newClient{
        {#clientMessage{message=Message}} ->
            if
                [PREFIX|_] == Message ->
                    %% 58 == :, catches those pesky reversed message formats.
                    ok; %% or at least it will once I write all that...
                list:prefix("PASS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("NICK",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("USER",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("OPER",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("QUIT",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("SQUIT",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("JOIN",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("PART",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("MODE",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("TOPIC",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("NAMES",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("LIST",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("INVITE",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("KICK",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("VERSION",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("STATS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;                    
                list:prefix("LINKS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("TIME",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("CONNECT",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("TRACE",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("ADMIN",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("INFO",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("PRIVMSG",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("NOTICE",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("WHO",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("WHOIS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("WHOWAS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;                    
                list:prefix("KILL",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("PING",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("PONG",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("ERROR",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("AWAY",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("REHASH",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("RESTART",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("SUMMON",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("USERS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("WALLOPS",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("USERHOST",Message) ->
                    %% the start of the regular messages. I think...
                    ok;
                list:prefix("ISON",Message) ->
                    %% the start of the regular messages. I think...
                    ok
            end,
            servermanager(ClientList);
        {#remoteClientMessage{message=Message,name=Name}} ->
        shutdown ->
            exit(normal);
        big_bada_boom ->
            exit(big_bada_boom)
    end.
    client_manager().