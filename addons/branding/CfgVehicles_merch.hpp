// Branded Merch
class B_LegStrapBag_black_F;
class PVAR(LegStrapBag_black): B_LegStrapBag_black_F
{
    _generalMacro=QPVAR(LegStrapBag_black);
    displayName = "Leg Strap Bag (Black - CVO)";
    author = "$STR_cvo_Author";
    maximumLoad = 120;
    hiddenSelectionsTextures[] = {QPATHTOF(data\legstrap\V_LegStrapBag_black_CVO_CO.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOF(data\legstrap\V_LegStrapBag_CVO.rvmat)};
};

class B_Kitbag_Base;
class PVAR(Kitbag_blk): B_Kitbag_Base
{
    _generalMacro=QPVAR(Kitbag_blk);
    displayName = "Kitbag (Black - CVO)";
    scope = 2;
    author = "$STR_cvo_Author";
    maximumLoad = 300;
    hiddenSelectionsTextures[] = {QPATHTOF(data\kitbag\backpack_fast_blk_cvo_co.paa)};
};