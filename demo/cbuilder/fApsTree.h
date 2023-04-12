//---------------------------------------------------------------------------

#ifndef fApsTreeH
#define fApsTreeH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
//---------------------------------------------------------------------------
class TfrmApcTree : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControl;
	TMainMenu *MainMenu;
	TControlBar *ControlBar;
	TStatusBar *StatusBar;
	TPanel *PanelLeft;
	TTreeView *TreeView;
	TPanel *PanelTop;
	TPanel *PanelBottom;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmApcTree(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmApcTree *frmApcTree;
//---------------------------------------------------------------------------
#endif
