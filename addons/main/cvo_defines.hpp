// This file is used to store some more or less important Numbers, values etc. as macros


#define GUI_TEXT_SIZE_SMALL 	(GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM 	(GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE 	(GUI_GRID_H * 1.2)


// CVO IDDs

#define CVO_IDD_DEPLOY 69000
#define CVO_IDD_CSC_REQUEST 69100


// CVO CSC IDCs
// Crates
#define CVO_IDC_CSC_Crates_Subtitle_Text 1500
#define CVO_IDC_CSC_Crates_Subtitle_Background 1501

#define CVO_IDC_CSC_Crates_ListNBox 1510
#define CVO_IDC_CSC_Crates_ListNBox_Description 1511

#define CVO_IDC_CSC_Crates_ListNBox_arrowMinus 1521
#define CVO_IDC_CSC_Crates_ListNBox_arrowPlus 1522

// Delivery
#define CVO_IDC_CSC_Delivery_Subtitle_Text 1600
#define CVO_IDC_CSC_Delivery_Subtitle_Background 1601

#define CVO_IDC_CSC_Delivery_ListBox 1610
#define CVO_IDC_CSC_Delivery_Description 1611

// Destination
#define CVO_IDC_CSC_Destination_Subtitle_Text 1700
#define CVO_IDC_CSC_Destination_Subtitle_Background 1701

#define CVO_IDC_CSC_Destination_ListBox 1710
#define CVO_IDC_CSC_Destination_Description 1711

// Others
#define CVO_IDC_CSC_Status 1100
#define CVO_IDC_CSC_ButtonOK 1
#define CVO_IDC_CSC_ButtonCancel 2



// CVO COLORS

#define CVO_RED_HEX #690000
#define QCVO_RED_HEX Q(#690000)
#define QQCVO_RED_HEX QQ(#690000)

#define CVO_RED_RGBA(ALPHA) 0.411765, 0, 0, ALPHA
#define CVO_RED_RGBA_ARRAY(ALPHA) [CVO_RED_RGBA(ALPHA)]
#define CVO_RED_RGBA_ARRAY_CONFIG(ALPHA) {CVO_RED_RGBA(ALPHA)}
