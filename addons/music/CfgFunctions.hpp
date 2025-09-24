class CfgFunctions
{
    class ADDON            // Tag
    {
        class debug
        {
            file = PATH_TO_FUNC_SUB(debug);
            class getTrackDuration {  };
        };

        class action
        {
            file = PATH_TO_FUNC_SUB(action);
            class init_zeusAction { postInit = 1; };
            class createAction {};
            class createActionChildren {};
        };

        class config
        {
            file = PATH_TO_FUNC_SUB(config);

            class initial_playlists { preInit = 1; };
            class fromConfig {};
            class getPlaylistName {};
            class getMusicName {};
            class getTrackCfg {};
        };

        class diary
        {
            file = PATH_TO_FUNC_SUB(diary);

            class createDiary { postInit = 1; };
            class updateHistory {};
            class fade_local {};
        };

        class internal
        {
            file = PATH_TO_FUNC_SUB(internal);

            class init_musicEventHandlers { preInit = 1; };
            class init_cbaEvents { preInit = 1; };
            
            class publicArray {};
            class request_client {};
            class catalog {};
            class select {};
            class verify {};
            class queue {};
            class play {};
        };

        class remote
        {
            file = PATH_TO_FUNC_SUB(remote);
            class request_server {};
            class fade_client {};
            class play_client {};
        };
    }; 
};
