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

%%%---FILE ircErl_central_manger.erl
-module([ircErl_central_manager]).
-export([start/0]).
-include("ircErl_client_manager.erl").
-include("ircErl_server_manager.erl").
-include("ircErl_config.hrl").
-include("ircErl_records.hrl").

start() ->
    server_manager_start(),
    client_manager_start(),
    register(central_manager,spawn(start([],[])).
    
central() ->
    receive
        {version,From,By} ->
             if By == clientmanager ->
                clientmanager ! VersionMessage(From,By),
        #clientMessage ->
            clientmanager ! #clientMessage;
        #serverMessage ->
            servermanager ! #serverMessage;
        shutdown ->
            clientManager ! shutdown,
            serverManager ! shutdown,
            exit(normal);
        big_bada_boom ->
            clientManager ! big_bada_boom,
            serverManager ! big_bada_boom,
            exit(big_bada_boom)
    end.
    central().


VersionMessage(From,By) ->
    %%<version>.<debuglevel> <server> :<comments>
    %% <version> is from config ServerVersion
    %% <debuglevel> is from config DebugOn?? (not sure what is expected for this value)
    %% <server> is current server identification
    %% <comments> probably not used.
    
    
    
    