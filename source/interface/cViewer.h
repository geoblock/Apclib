//---------------------------------------------------------------------------

#ifndef cViewerH
#define cViewerH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "GLS.BaseClasses.hpp"
#include "GLS.Cadencer.hpp"
#include "GLS.Scene.hpp"
#include "GLS.SceneViewer.hpp"
#include "GLS.SimpleNavigation.hpp"
#include <Vcl.ExtCtrls.hpp>
#include "GLS.Coordinates.hpp"
#include "GLS.LensFlare.hpp"
#include "GLS.Objects.hpp"
#include "GLS.SkyDome.hpp"
#include "GLS.VectorFileObjects.hpp"
#include <Vcl.Menus.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TFormViewerC : public TForm
{
__published:	// IDE-managed Components
	TGLSceneViewer *GLSceneViewer;
	TPanel *Panel1;
	TGLCadencer *GLCadencer;
	TGLSimpleNavigation *GLSimpleNavigation;
	TMainMenu *MainMenu;
	TMenuItem *File1;
	TMenuItem *New1;
	TMenuItem *Open1;
	TMenuItem *Save1;
	TMenuItem *SaveAs1;
	TMenuItem *N2;
	TMenuItem *Print1;
	TMenuItem *PrintSetup1;
	TMenuItem *N1;
	TMenuItem *Exit1;
	TMenuItem *Edit1;
	TMenuItem *Undo1;
	TMenuItem *Repeat1;
	TMenuItem *N5;
	TMenuItem *Cut1;
	TMenuItem *Copy1;
	TMenuItem *Paste1;
	TMenuItem *PasteSpecial1;
	TMenuItem *N4;
	TMenuItem *Find1;
	TMenuItem *Replace1;
	TMenuItem *GoTo1;
	TMenuItem *N3;
	TMenuItem *Links1;
	TMenuItem *Object1;
	TMenuItem *Window1;
	TMenuItem *NewWindow1;
	TMenuItem *Tile1;
	TMenuItem *Cascade1;
	TMenuItem *ArrangeAll1;
	TMenuItem *N6;
	TMenuItem *Hide1;
	TMenuItem *Show1;
	TMenuItem *Help1;
	TMenuItem *Contents1;
	TMenuItem *SearchforHelpOn1;
	TMenuItem *HowtoUseHelp1;
	TMenuItem *About1;
	TGLScene *GLScene;
	TGLSkyDome *SkyDome;
	TGLCamera *Camera;
	TGLLightSource *LightSourceSun;
	TGLLensFlare *LensFlareSun;
	TGLDummyCube *DummyCube;
	TGLSphere *sphPlanet;
	TGLFreeForm *ffPlanet;
	TTimer *Timer;
	TRadioGroup *RadioGroupCoordinates;
	TRadioGroup *RadioGroupPlanet;
	TRadioGroup *RadioGroupForm;
	TPanel *PanelLeft;
	TTreeView *TreeView;
	TPanel *PanelTop;
	TPanel *PanelButton;
private:	// User declarations
public:		// User declarations
	__fastcall TFormViewerC(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormViewerC *FormViewerC;
//---------------------------------------------------------------------------
#endif
