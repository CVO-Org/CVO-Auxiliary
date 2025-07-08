class Destination_List: RscListBox {
    idc = CVO_IDC_CSC_Destination_ListBox;

    style = LB_TEXTURES;

    x = Q(20.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(04.50 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(19.50 * GUI_GRID_CENTER_W);
    h = Q(04.00 * GUI_GRID_CENTER_H);

    colorBackground[] = {0,0,0,0.6};            
};

class Destination_Mode_Desc: RscText {
    idc = CVO_IDC_CSC_Destination_Description;

    x = Q(20.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(08.75 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(19.50 * GUI_GRID_CENTER_W);
    h = Q(04.00 * GUI_GRID_CENTER_H);

    colorBackground[] = {0,0,0,0.6};            
};
