class UserTexture1m_F;

class PVAR(stencil_black): UserTexture1m_F {

        _generalMacro=QPVAR(stencil_black);

        author="$STR_cvo_Author";
        scope = 2;
        scopeCurator = 2;

        displayName= "Stencil Black (CVO)";

        hiddenSelectionsTextures[] = {
            QPATHTOF(data\stencils\cvo_stencil_black_ca.paa)
        };
};

class PVAR(stencil_red): PVAR(stencil_black) {

        _generalMacro=QPVAR(stencil_red);

        displayName= "Stencil Red (CVO)";

        hiddenSelectionsTextures[] = {
            QPATHTOF(data\stencils\cvo_stencil_red_ca.paa)
        };
};

class PVAR(stencil_white): PVAR(stencil_black) {

        _generalMacro=QPVAR(stencil_white);

        displayName= "Stencil White (CVO)";

        hiddenSelectionsTextures[] = {
            QPATHTOF(data\stencils\cvo_stencil_white_ca.paa)
        };
};
