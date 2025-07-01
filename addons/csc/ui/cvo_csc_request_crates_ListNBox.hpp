class Crates_ListNBox: RscListNBox {
    idc = CVO_CSC_Crate;

    type = CT_LISTNBOX;
    style = LB_TEXTURES;

    // onLBSelChanged = Q(_this call FUNC(ui_onLBSelChanged););

    x = Q(00.00 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(04.50 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(19.50 * GUI_GRID_CENTER_W);
    h = Q(09.00 * GUI_GRID_CENTER_H);

    colorBackground[] = {0,0,0,0.8};

	drawSideArrows = 1;
    
    idcLeft = CVO_CSC_Crate_arrowMinus;
    idcRight = CVO_CSC_Crate_arrowPlus;

    collumns[] = { 0.1, 0.8, 0.9 };

    // collumns[] = {
    //     Q(01.00 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X),
    //     Q(16.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X)
    // };

};

class ArrowLeft: RscButton {
    idc = CVO_CSC_Crate_arrowMinus;
    text = "-";
    colorBackground[] = {0,0,0,1};
    onButtonClick = ""; // QUOTE([ARR_2(ctrlParent (_this select 0),-1)] call FUNC(buttonCargo));
    fade = 1;
    enable = 0;
    x = Q(00.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(00.50 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(01.00 * GUI_GRID_CENTER_W);
    h = Q(01.00 * GUI_GRID_CENTER_H);
    sizeEx = QUOTE(7 * GRID_H);
};

class ArrowRight: ArrowLeft {
    idc = CVO_CSC_Crate_arrowPlus;
    onButtonClick = ""; // QUOTE([ARR_2(ctrlParent (_this select 0),1)] call FUNC(buttonCargo));
    text = "+";
};
