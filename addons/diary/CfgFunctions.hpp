class CfgFunctions
{
    class ADDON
    {
        class COMPONENT
        {

            file = PATH_TO_FUNC;

            // class example { postInit = 1; };

        };
        
        class diary {
            file = PATH_TO_FUNC_SUB(diary);

            class createDiaryCategory {};
            class createDiarySubject {};

            class setEntry {};

            class setPersonality {};

        };

    };
};