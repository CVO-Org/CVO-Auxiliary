class Delivery_Mode_List: RscListBox {
    idc = CVO_IDC_CSC_Delivery_ListBox;

    style = LB_TEXTURES;

    x = Q(20.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(15.50 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(19.50 * GUI_GRID_CENTER_W);
    h = Q(04.00 * GUI_GRID_CENTER_H);

    colorBackground[] = {0,0,0,0.6};            
};

class Delivery_Mode_Desc: RscText {
    idc = CVO_IDC_CSC_Delivery_Description;

    x = Q(20.50 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
    y = Q(19.75 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
    w = Q(19.50 * GUI_GRID_CENTER_W);
    h = Q(04.00 * GUI_GRID_CENTER_H);

    colorBackground[] = {0,0,0,0.6};            
};
