//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "cMainViewer.h"
#include "cAbout.h"
// #include "cPointto.h"  // need to be converted from dPointto.pas

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
#pragma link "GLS.GeomObjects"
#pragma resource "*.dfm"
TFormViewerC *FormViewerC;
//---------------------------------------------------------------------------
__fastcall TFormViewerC::TFormViewerC(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------

void __fastcall TFormViewerC::FormCreate(TObject *Sender)
{
  // Load map for Planet
  DataDir = ExtractFilePath(ParamStr(0));
  DataDir = DataDir + "data\\map\\";
  SetCurrentDir(DataDir);

  sfPlanet->Material->Texture->Disabled = false;
  RadioGroupPlanetClick(this);

}


//---------------------------------------------------------------------------
void __fastcall TFormViewerC::miAboutClick(TObject *Sender)
{
   TfrmAbout*  frmAbout;
   frmAbout = new TfrmAbout(this);
	try {
	  frmAbout->ShowModal();
	}
	__finally {
	  frmAbout->Free();
	}
 }

//---------------------------------------------------------------------------

void __fastcall TFormViewerC::miPointtoClick(TObject *Sender)
{
/*
  TFormPointto*  FormPointto;
  FormPointto = new TFormPointto(this);
  try {
	  FormPointto->ShowModal();
	}
	__finally {
	  FormPointto->Free();
  }
*/
}


//---------------------------------------------------------------------------

void __fastcall TFormViewerC::RadioGroupPlanetClick(TObject *Sender)
{
	// switch
	{
		sfPlanet->Material->Texture->Image->LoadFromFile("earth.jpg");
		sfPlanet->Radius = 6371;
		TorusMeridian->MajorRadius = 6371;
		TorusEquator->MajorRadius = 6371;
		// add Moon as child
	}
}
//---------------------------------------------------------------------------


void __fastcall TFormViewerC::GLCadencerProgress(TObject *Sender, const double DeltaTime, const double NewTime)

{
 sfPlanet->TurnAngle = 10 * NewTime;
}

//---------------------------------------------------------------------------

void __fastcall TFormViewerC::miExitClick(TObject *Sender)
{
 Close();
}

//---------------------------------------------------------------------------

