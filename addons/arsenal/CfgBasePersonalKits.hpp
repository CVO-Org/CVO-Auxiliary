class GVAR(BasePersonalKits) {

    class Base {
        id = "";
        condition = "true";
        addon_dependency = "";
        class items {};
        code = ""; // needs to return array
    };

    class EDITOR_DEBUG: Base {
        id = "_SP_PLAYER_";
        class items {
            class ACE_Banana;
        };
        code = "systemChat 'CVO_A_Playerkit test Successful - ACE_Sandbag_empty Given'; 	['ACE_Sandbag_empty']";
    };

    class Zorn: Base {
        id = "76561197970306509";
        class items {
            class G_Spectacles_Tinted;
            class G_Balaclava_blk;
            class H_Beret_blk;

            class B_LegStrapBag_black_F;
            class ACE_SpraypaintBlack;
        };
    };
};
