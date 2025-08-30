class CfgFunctions
{
	class ADDON            // Tag
	{
        class groups {
            file = PATH_TO_FUNC_SUB(groups);
            
            class addIntelToGroup {};
            class handleIntelGroup {};

            class checkGroup {};

            class diary_createSubject {};
            class diary_getText {};
            class diary_setRecordText {};
            class diary_updateRecord {};
        };

        class intel {
            file = PATH_TO_FUNC_SUB(intel);

            class init { postInit = 1; };

            class createIntel {};
            class addIntelEntry {};
        };

        class action {
            file = PATH_TO_FUNC_SUB(action);
            
            class addIntelAction {};
            class action_statement {};
        };
        
	}; 
};
