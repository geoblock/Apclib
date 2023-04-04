//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "cViewer.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma link "GLS.SimpleNavigation"
#pragma link "GLS.Coordinates"
#pragma link "GLS.LensFlare"
#pragma link "GLS.Objects"
#pragma link "GLS.SkyDome"
#pragma link "GLS.VectorFileObjects"
#pragma resource "*.dfm"
TcFormViewer *cFormViewer;
//---------------------------------------------------------------------------
__fastcall TcFormViewer::TcFormViewer(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
