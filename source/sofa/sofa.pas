unit sofa;

(*
**  - - - - - - - - - - - - - - - - - - - - -
**  s o f a . pas converted from  s o f a . h
**  - - - - - - - - - - - - - - - - - - - - -
**
**  Prototype function declarations for SOFA library.
**
**  This file is part of the International Astronomical Union's
**  SOFA (Standards Of Fundamental Astronomy) software collection.
**
**  This revision:   2021 April 18
**
**  SOFA release 2021-05-12
**
**  Copyright (C) 2021 IAU SOFA Board.  See notes at end.
*)

{$MINENUMSIZE 4}

interface

const
  {$IF Defined(WIN32)}
  LIB_SOFA = 'sofa_win32.dll';
  _PU = '';
  {$ELSEIF Defined(WIN64)}
  LIB_SOFA = 'sofa_win64.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  DPI = (3.141592653589793238462643);
  D2PI = (6.283185307179586476925287);
  DR2D = (57.29577951308232087679815);
  DD2R = (1.745329251994329576923691e-2);
  DR2AS = (206264.8062470963551564734);
  DAS2R = (4.848136811095359935899141e-6);
  DS2R = (7.272205216643039903848712e-5);
  TURNAS = (1296000.0);
  DMAS2R = (DAS2R / 1e3); // div from chet
  DTY = (365.242198781);
  DAYSEC = (86400.0);
  DJY = (365.25);
  DJC = (36525.0);
  DJM = (365250.0);
  DJ00 = (2451545.0);
  DJM0 = (2400000.5);
  DJM00 = (51544.5);
  DJM77 = (43144.0);
  TTMTAI = (32.184);
  DAU = (149597870.7e3);
  CMPS = 299792458.0;
  AULT = (DAU / CMPS); // div from chet
  DC = (DAYSEC / AULT); // div from chet
  ELG = (6.969290134e-10);
  ELB = (1.550519768e-8);
  TDB0 = (-6.55e-5);
  SRS = 1.97412574336e-8;
  { TODO : Unable to convert function-like macro: }
  (* dint ( A ) ( ( A ) < 0.0 ? ceil ( A ) : floor ( A ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* dnint ( A ) ( fabs ( A ) < 0.5 ? 0.0 : ( ( A ) < 0.0 ? ceil ( ( A ) - 0.5 ) : floor ( ( A ) + 0.5 ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* dsign ( A , B ) ( ( B ) < 0.0 ? - fabs ( A ) : fabs ( A ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* gmax ( A , B ) ( ( ( A ) > ( B ) ) ? ( A ) : ( B ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* gmin ( A , B ) ( ( ( A ) < ( B ) ) ? ( A ) : ( B ) ) *)
  WGS84 = 1;
  GRS80 = 2;
  WGS72 = 3;

type
  // Forward declarations
  PiauASTROM = ^iauASTROM;
  PiauLDBODY = ^iauLDBODY;
  Parray = array [0..2] of double;  // Tarray3
  Tarray23 = array [0..1] of array [0..2] of double; // for functions
  Tarray33 = array [0..2] of array [0..2] of double; // for functions
  
(* Star-independent astrometry parameters *)
  iauASTROM = record
    pmt: double;                      (* PM time interval (SSB, Julian years) *)
    eb: array [0..2] of double;       (* SSB to observer (vector, au) *) 
    eh: array [0..2] of double;       (* Sun to observer (unit vector) *) 
    em: double;                       (* distance from Sun to observer (au) *)
    v: array [0..2] of double;        (* barycentric observer velocity (vector, c) *) 
    bm1: double;                      (* sqrt(1-|v|^2): reciprocal of Lorenz factor *)
    bpn: array [0..2] of array [0..2] of double; (* bias-precession-nutation matrix *)
    along: double;                    (* longitude + s' + dERA(DUT) (radians) *) 
    phi: double;                      (* geodetic latitude (radians) *)
    xpl: double;                      (* polar motion xp wrt local meridian (radians) *) 
    ypl: double;                      (* polar motion yp wrt local meridian (radians) *) 
    sphi: double;                     (* sine of geodetic latitude *)
    cphi: double;                     (* cosine of geodetic latitude *)  
    diurab: double;                   (* magnitude of diurnal aberration vector *)
    eral: double;                     (* "local" Earth rotation angle (radians) *)
    refa: double;                     (* refraction constant A (radians) *)
    refb: double;                     (* refraction constant B (radians) *)
  end;
  (* (Vectors eb, eh, em and v are all with respect to BCRS axes.) *)

  (* Body parameters for light deflection *)
  iauLDBODY = record
    bm: double;                       (* mass of the body (solar masses) *)
    dl: double;                       (* deflection limiter (radians^2/2) *) 
    pv: array [0..1] of array [0..2] of double;  (* barycentric PV of the body (au, au/day) *)
  end;


(* Astronomy/Calendars *)
function iauCal2jd(iy: Integer; im: Integer; id: Integer; djm0: PDouble; djm: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauCal2jd';
function iauEpb(dj1: double; dj2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEpb';
procedure iauEpb2jd(epb: double; djm0: PDouble; djm: PDouble); cdecl; external LIB_SOFA name _PU + 'iauEpb2jd';
function iauEpj(dj1: double; dj2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEpj';
procedure iauEpj2jd(epj: double; djm0: PDouble; djm: PDouble); cdecl; external LIB_SOFA name _PU + 'iauEpj2jd';
function iauJd2cal(dj1: double; dj2: double; 
                                iy: PInteger; im: PInteger; id: PInteger; fd: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauJd2cal';
function iauJdcalf(ndp: Integer; dj1: double; dj2: double; iymdf: PInteger): Integer; cdecl; external LIB_SOFA name _PU + 'iauJdcalf';

(* Astronomy/Astrometry *)
procedure iauAb(pnat: PDouble; v: PDouble; s: double; bm1: double; 
                ppr: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAb';
procedure iauApcg(date1: double; date2: double; 
                  ebpv: Tarray23; ehp: PDouble; 
                  astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApcg';
procedure iauApcg13(date1: double; date2: double; astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApcg13';
procedure iauApci(date1: double; date2: double; 
                  ebpv: Tarray23; ehp: PDouble; 
				  x: double; y: double; s: double; 
				  astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApci';
procedure iauApci13(date1: double; date2: double; 
                    astrom: PiauASTROM; eo: PDouble); cdecl; 
					external LIB_SOFA name _PU + 'iauApci13';

procedure iauApco(date1: double; date2: double;
                  ebpv: Tarray23; ehp: PDouble;
                  x: double; y: double; s: double; theta: double; 
				  elong: double; phi: double; hm: double; 
				  xp: double; yp: double; sp: double; 
				  refa: double; refb: double; astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApco';

function iauApco13(utc1: double; utc2: double; dut1: double; elong: double; phi: double; hm: double;
  xp: double; yp: double; phpa: double; tc: double; rh: double; wl: double; astrom: PiauASTROM; eo: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauApco13';

procedure iauApcs(date1: double; date2: double; pv: Tarray23; ebpv: Tarray23; ehp: PDouble; astrom: PiauASTROM); cdecl;
  external LIB_SOFA name _PU + 'iauApcs';

procedure iauApcs13(date1: double; date2: double; pv: Tarray23; 
                    astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApcs13';
procedure iauAper(theta: double; astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauAper';
procedure iauAper13(ut11: double; ut12: double; astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauAper13';
procedure iauApio(sp: double; theta: double; 
                  elong: double; phi: double; hm: double; xp: double; yp: double;
                  refa: double; refb: double; 
				  astrom: PiauASTROM); cdecl; external LIB_SOFA name _PU + 'iauApio';
function iauApio13(utc1: double; utc2: double; dut1: double; 
                   elong: double; phi: double; hm: double; xp: double; yp: double; 
				   phpa: double; tc: double; rh: double; wl: double; 
				   astrom: PiauASTROM): Integer; cdecl; external LIB_SOFA name _PU + 'iauApio13';
procedure iauAtcc13(rc: double; dc: double; 
                    pr: double; pd: double; px: double; rv: double; 
					date1: double; date2: double; ra: PDouble; da: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtcc13';
procedure iauAtccq(rc: double; dc: double; 
                   pr: double; pd: double; px: double; rv: double; 
				   astrom: PiauASTROM; ra: PDouble; da: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtccq';
procedure iauAtci13(rc: double; dc: double;
                    pr: double; pd: double; px: double; rv: double; 
					date1: double; date2: double; 
					ri: PDouble; di: PDouble; eo: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtci13';
procedure iauAtciq(rc: double; dc: double; pr: double; pd: double; 
                   px: double; rv: double; astrom: PiauASTROM; 
				   ri: PDouble; di: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtciq';
procedure iauAtciqn(rc: double; dc: double; pr: double; pd: double; 
                    px: double; rv: double; astrom: PiauASTROM; n: Integer; b: PiauLDBODY; 
					ri: PDouble; di: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtciqn';
procedure iauAtciqz(rc: double; dc: double; astrom: PiauASTROM; 
                    ri: PDouble; di: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtciqz';
function iauAtco13(rc: double; dc: double; 
                   pr: double; pd: double; px: double; rv: double; 
				   utc1: double; utc2: double; dut1: double; 
				   elong: double; phi: double; hm: double; xp: double; yp: double; 
				   phpa: double; tc: double; rh: double; wl: double; 
				   aob: PDouble; zob: PDouble; hob: PDouble; 
				   dob: PDouble; rob: PDouble; eo: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauAtco13';

procedure iauAtic13(ri: double; di: double; 
                    date1: double; date2: double; 
					rc: PDouble; dc: PDouble; eo: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAtic13';

procedure iauAticq(ri: double; di: double; astrom: PiauASTROM; 
                   rc: PDouble; dc: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAticq';
procedure iauAticqn(ri: double; di: double; astrom: PiauASTROM; n: Integer; b: PiauLDBODY; rc: PDouble; dc: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauAticqn';
function iauAtio13(ri: double; di: double; utc1: double; utc2: double; dut1: double; elong: double; phi: double; hm: double; xp: double; yp: double; phpa: double; tc: double; rh: double; wl: double; aob: PDouble; zob: PDouble; hob: PDouble; dob: PDouble; rob: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauAtio13';
procedure iauAtioq(ri: double; di: double; astrom: PiauASTROM; aob: PDouble; zob: PDouble; hob: PDouble; dob: PDouble; rob: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauAtioq';
function iauAtoc13(const &type: PUTF8Char; ob1: double; ob2: double; utc1: double; utc2: double; dut1: double; elong: double; phi: double; hm: double; xp: double; yp: double; phpa: double; tc: double; rh: double; wl: double; rc: PDouble; dc: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauAtoc13';
function iauAtoi13(const &type: PUTF8Char; ob1: double; ob2: double; utc1: double; utc2: double; dut1: double; elong: double; phi: double; hm: double; xp: double; yp: double; phpa: double; tc: double; rh: double; wl: double; ri: PDouble; di: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauAtoi13';
procedure iauAtoiq(const &type: PUTF8Char; ob1: double; ob2: double; astrom: PiauASTROM; ri: PDouble; di: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauAtoiq';
procedure iauLd(bm: double; p: PDouble; q: PDouble; e: PDouble; em: double; dlim: double; p1: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauLd';
procedure iauLdn(n: Integer; b: PiauLDBODY; ob: PDouble; sc: PDouble; sn: PDouble); cdecl; external LIB_SOFA name _PU + 'iauLdn';
procedure iauLdsun(p: PDouble; e: PDouble; em: double; p1: PDouble); cdecl; external LIB_SOFA name _PU + 'iauLdsun';
procedure iauPmpx(rc: double; dc: double; pr: double; pd: double; 
                  px: double; rv: double; pmt: double; pob: PDouble; 
				  pco: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPmpx';

function iauPmsafe(ra1: double; dec1: double; pmr1: double; pmd1: double;
                   px1: double; rv1: double;
				   ep1a: double; ep1b: double; ep2a: double; ep2b: double;
				   ra2: PDouble; dec2: PDouble; pmr2: PDouble; pmd2: PDouble;
				   px2: PDouble; rv2: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauPmsafe';

procedure iauPvtob(elong: double; phi: double; height: double; xp: double;
                   yp: double; sp: double; theta: double;  pv: Tarray23); cdecl;
                   external LIB_SOFA name _PU + 'iauPvtob';

procedure iauRefco(phpa: double; tc: double; rh: double; wl: double;
                   refa: PDouble; refb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauRefco';

(* Astronomy/Ephemerides *)
function iauEpv00(date1: double; date2: double; 
                  pvh: Tarray23; pvb: Tarray23): Integer; cdecl;
                  external LIB_SOFA name _PU + 'iauEpv00';

procedure iauMoon98(date1: double; date2: double; pv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauMoon98';

function iauPlan94(date1: double; date2: double; np: Integer; pv: Tarray23): Integer; cdecl;
                   external LIB_SOFA name _PU + 'iauPlan94';

(* Astronomy/FundamentalArgs *)
function iauFad03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFad03';
function iauFae03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFae03';
function iauFaf03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFaf03';
function iauFaju03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFaju03';
function iauFal03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFal03';
function iauFalp03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFalp03';
function iauFama03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFama03';
function iauFame03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFame03';
function iauFane03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFane03';
function iauFaom03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFaom03';
function iauFapa03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFapa03';
function iauFasa03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFasa03';
function iauFaur03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFaur03';
function iauFave03(t: double): double; cdecl; external LIB_SOFA name _PU + 'iauFave03';

(* Astronomy/PrecNutPolar *)
procedure iauBi00(dpsibi: PDouble; depsbi: PDouble; dra: PDouble); cdecl; external LIB_SOFA name _PU + 'iauBi00';
procedure iauBp00(date1: double; date2: double; 
                  rb: Tarray23; rp: Tarray23; rbp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauBp00';
procedure iauBp06(date1: double; date2: double; 
                  rb: Tarray23; rp: Tarray23; rbp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauBp06';
procedure iauBpn2xy(rbpn: Tarray23; x: PDouble; y: PDouble); cdecl; external LIB_SOFA name _PU + 'iauBpn2xy';
procedure iauC2i00a(date1: double; date2: double; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2i00a';
procedure iauC2i00b(date1: double; date2: double; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2i00b';
procedure iauC2i06a(date1: double; date2: double; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2i06a';
procedure iauC2ibpn(date1: double; date2: double; rbpn: Tarray23; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2ibpn';
procedure iauC2ixy(date1: double; date2: double; x: double; y: double; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2ixy';
procedure iauC2ixys(x: double; y: double; s: double; rc2i: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2ixys';
procedure iauC2t00a(tta: double; ttb: double; uta: double; utb: double; xp: double; yp: double; rc2t: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauC2t00a';
procedure iauC2t00b(tta: double; ttb: double; uta: double; utb: double; xp: double; yp: double; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2t00b';
procedure iauC2t06a(tta: double; ttb: double; uta: double; utb: double; xp: double; yp: double; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2t06a';
procedure iauC2tcio(rc2i: array of double; era: double; rpom: Tarray23; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2tcio';
procedure iauC2teqx(rbpn: Tarray23; gst: double; rpom: Tarray23; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2teqx';
procedure iauC2tpe(tta: double; ttb: double; uta: double; utb: double; dpsi: double; deps: double; xp: double; yp: double; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2tpe';
procedure iauC2txy(tta: double; ttb: double; uta: double; utb: double; x: double; y: double; xp: double; yp: double; rc2t: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauC2txy';
function iauEo06a(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEo06a';
function iauEors(rnpb: Tarray23; s: double): double; cdecl; external LIB_SOFA name _PU + 'iauEors';
procedure iauFw2m(gamb: double; phib: double; psi: double; eps: double; r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauFw2m';
procedure iauFw2xy(gamb: double; phib: double; psi: double; eps: double; x: PDouble; y: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFw2xy';
procedure iauLtp(epj: double; rp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauLtp';
procedure iauLtpb(epj: double; rpb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauLtpb';
procedure iauLtpecl(epj: double; vec: PDouble); cdecl; external LIB_SOFA name _PU + 'iauLtpecl';
procedure iauLtpequ(epj: double; veq: PDouble); cdecl; external LIB_SOFA name _PU + 'iauLtpequ';
procedure iauNum00a(date1: double; date2: double; rmatn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauNum00a';
procedure iauNum00b(date1: double; date2: double; rmatn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauNum00b';
procedure iauNum06a(date1: double; date2: double; rmatn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauNum06a';
procedure iauNumat(epsa: double; dpsi: double; deps: double; rmatn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauNumat';
procedure iauNut00a(date1: double; date2: double; dpsi: PDouble; deps: PDouble); cdecl; external LIB_SOFA name _PU + 'iauNut00a';
procedure iauNut00b(date1: double; date2: double; dpsi: PDouble; deps: PDouble); cdecl; external LIB_SOFA name _PU + 'iauNut00b';
procedure iauNut06a(date1: double; date2: double; dpsi: PDouble; deps: PDouble); cdecl; external LIB_SOFA name _PU + 'iauNut06a';
procedure iauNut80(date1: double; date2: double; dpsi: PDouble; deps: PDouble); cdecl; external LIB_SOFA name _PU + 'iauNut80';
procedure iauNutm80(date1: double; date2: double; rmatn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauNutm80';
function iauObl06(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauObl06';
function iauObl80(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauObl80';
procedure iauP06e(date1: double; date2: double; eps0: PDouble; psia: PDouble; oma: PDouble; bpa: PDouble; bqa: PDouble; pia: PDouble; bpia: PDouble; epsa: PDouble; chia: PDouble; za: PDouble; zetaa: PDouble; thetaa: PDouble; pa: PDouble; gam: PDouble; phi: PDouble; psi: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauP06e';
procedure iauPb06(date1: double; date2: double; bzeta: PDouble; bz: PDouble; btheta: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPb06';
procedure iauPfw06(date1: double; date2: double; gamb: PDouble; phib: PDouble; psib: PDouble; epsa: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauPfw06';
procedure iauPmat00(date1: double; date2: double; rbp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPmat00';
procedure iauPmat06(date1: double; date2: double; rbp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPmat06';
procedure iauPmat76(date1: double; date2: double; rmatp: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPmat76';
procedure iauPn00(date1: double; date2: double; dpsi: double; deps: double; epsa: PDouble; rb: Tarray23;
  rp: Tarray23; rbp: Tarray23; rn: Tarray23; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPn00';
procedure iauPn00a(date1: double; date2: double; dpsi: PDouble; deps: PDouble; epsa: PDouble;
  rb: Tarray23; rp: Tarray23; rbp: Tarray23; rn: Tarray23; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPn00a';
procedure iauPn00b(date1: double; date2: double; dpsi: PDouble; deps: PDouble; epsa: PDouble;
  rb: Tarray23; rp: Tarray23; rbp: Tarray23; rn: Tarray23; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPn00b';
procedure iauPn06(date1: double; date2: double; dpsi: double; deps: double; epsa: PDouble;
  rb: Tarray23; rp: Tarray23; rbp: Tarray23; rn: Tarray23; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPn06';

procedure iauPn06a(date1: double; date2: double; dpsi: PDouble; deps: PDouble; epsa: PDouble;
  rb: Tarray23; rp: Tarray23; rbp: Tarray23; rn: Tarray23; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPn06a';
procedure iauPnm00a(date1: double; date2: double; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPnm00a';
procedure iauPnm00b(date1: double; date2: double; rbpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPnm00b';
procedure iauPnm06a(date1: double; date2: double; rnpb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPnm06a';
procedure iauPnm80(date1: double; date2: double; rmatpn: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPnm80';
procedure iauPom00(xp: double; yp: double; sp: double; rpom: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPom00';
procedure iauPr00(date1: double; date2: double; dpsipr: PDouble; depspr: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPr00';
procedure iauPrec76(date01: double; date02: double; date11: double; date12: double; zeta: PDouble; z: PDouble; theta: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauPrec76';
function iauS00(date1: double; date2: double; x: double; y: double): double; cdecl; external LIB_SOFA name _PU + 'iauS00';
function iauS00a(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauS00a';
function iauS00b(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauS00b';
function iauS06(date1: double; date2: double; x: double; y: double): double; cdecl; external LIB_SOFA name _PU + 'iauS06';
function iauS06a(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauS06a';
function iauSp00(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauSp00';
procedure iauXy06(date1: double; date2: double; x: PDouble; y: PDouble); cdecl; external LIB_SOFA name _PU + 'iauXy06';
procedure iauXys00a(date1: double; date2: double; x: PDouble; y: PDouble; s: PDouble); cdecl; external LIB_SOFA name _PU + 'iauXys00a';
procedure iauXys00b(date1: double; date2: double; x: PDouble; y: PDouble; s: PDouble); cdecl; external LIB_SOFA name _PU + 'iauXys00b';
procedure iauXys06a(date1: double; date2: double; 
                    x: PDouble; y: PDouble; s: PDouble); cdecl; external LIB_SOFA name _PU + 'iauXys06a';
(* Astronomy/RotationAndTime *)
function iauEe00(date1: double; date2: double; epsa: double; dpsi: double): double; cdecl; external LIB_SOFA name _PU + 'iauEe00';
function iauEe00a(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEe00a';
function iauEe00b(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEe00b';
function iauEe06a(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEe06a';
function iauEect00(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEect00';
function iauEqeq94(date1: double; date2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEqeq94';
function iauEra00(dj1: double; dj2: double): double; cdecl; external LIB_SOFA name _PU + 'iauEra00';
function iauGmst00(uta: double; utb: double; tta: double; ttb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGmst00';
function iauGmst06(uta: double; utb: double; tta: double; ttb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGmst06';
function iauGmst82(dj1: double; dj2: double): double; cdecl; external LIB_SOFA name _PU + 'iauGmst82';
function iauGst00a(uta: double; utb: double; tta: double; ttb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGst00a';
function iauGst00b(uta: double; utb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGst00b';
function iauGst06(uta: double; utb: double; tta: double; ttb: double; rnpb: Tarray23): double; cdecl; external LIB_SOFA name _PU + 'iauGst06';
function iauGst06a(uta: double; utb: double; tta: double; ttb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGst06a';
function iauGst94(uta: double; utb: double): double; cdecl; external LIB_SOFA name _PU + 'iauGst94';
(* Astronomy/SpaceMotion *)
function iauPvstar(pv: Tarray23; ra: PDouble; dec: PDouble; 
                   pmr: PDouble; pmd: PDouble; px: PDouble; rv: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauPvstar';
function iauStarpv(ra: double; dec: double; 
                   pmr: double; pmd: double; px: double; rv: double; 
				   pv: Tarray23): Integer; cdecl; external LIB_SOFA name _PU + 'iauStarpv';
(* Astronomy/StarCatalogs *)  
procedure iauFk425(r1950: double; d1950: double; dr1950: double; dd1950: double; p1950: double; v1950: double;
  r2000: PDouble; d2000: PDouble; dr2000: PDouble; dd2000: PDouble; p2000: PDouble; v2000: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk425';
procedure iauFk45z(r1950: double; d1950: double; bepoch: double; r2000: PDouble; d2000: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk45z';
procedure iauFk524(r2000: double; d2000: double; dr2000: double; dd2000: double; p2000: double; v2000: double; r1950: PDouble; d1950: PDouble; dr1950: PDouble; dd1950: PDouble; p1950: PDouble; v1950: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk524';
procedure iauFk52h(r5: double; d5: double; dr5: double; dd5: double; px5: double; rv5: double; rh: PDouble; dh: PDouble; drh: PDouble; ddh: PDouble; pxh: PDouble; rvh: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk52h';
procedure iauFk54z(r2000: double; d2000: double; bepoch: double; r1950: PDouble; d1950: PDouble; dr1950: PDouble; dd1950: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk54z';
procedure iauFk5hip(r5h: Tarray23; s5h: PDouble); cdecl; external LIB_SOFA name _PU + 'iauFk5hip';
procedure iauFk5hz(r5: double; d5: double; date1: double; date2: double; rh: PDouble; dh: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauFk5hz';
procedure iauH2fk5(rh: double; dh: double; drh: double; ddh: double; pxh: double; rvh: double; r5: PDouble; d5: PDouble; dr5: PDouble; dd5: PDouble; px5: PDouble; rv5: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauH2fk5';
procedure iauHfk5z(rh: double; dh: double; date1: double; date2: double; r5: PDouble; d5: PDouble; dr5: PDouble; dd5: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauHfk5z';
function iauStarpm(ra1: double; dec1: double; pmr1: double; pmd1: double; px1: double; rv1: double; ep1a: double; ep1b: double; ep2a: double; ep2b: double; ra2: PDouble; dec2: PDouble; pmr2: PDouble; pmd2: PDouble; px2: PDouble; rv2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauStarpm';
(* Astronomy/EclipticCoordinates *)
procedure iauEceq06(date1: double; date2: double; dl: double; db: double; dr: PDouble; dd: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauEceq06';
procedure iauEcm06(date1: double; date2: double; rm: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauEcm06';
procedure iauEqec06(date1: double; date2: double; dr: double; dd: double; dl: PDouble; db: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauEqec06';
procedure iauLteceq(epj: double; dl: double; db: double; dr: PDouble; dd: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauLteceq';
procedure iauLtecm(epj: double; rm: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauLtecm';
procedure iauLteqec(epj: double; dr: double; dd: double; dl: PDouble; db: PDouble); cdecl; external LIB_SOFA name _PU + 'iauLteqec';

(* Astronomy/GalacticCoordinates *)
procedure iauG2icrs(dl: double; db: double; dr: PDouble; dd: PDouble); cdecl; external LIB_SOFA name _PU + 'iauG2icrs';
procedure iauIcrs2g(dr: double; dd: double; dl: PDouble; db: PDouble); cdecl; external LIB_SOFA name _PU + 'iauIcrs2g';

(* Astronomy/GeodeticGeocentric *)
function iauEform(n: Integer; a: PDouble; f: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauEform';
function iauGc2gd(n: Integer; xyz: PDouble;
                  elong: PDouble; phi: PDouble; height: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauGc2gd';
function iauGc2gde(a: double; f: double; xyz: PDouble;
                   elong: PDouble; phi: PDouble; height: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauGc2gde';
function iauGd2gc(n: Integer; elong: double; phi: double; height: double;
                  xyz: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauGd2gc';
function iauGd2gce(a: double; f: double; elong: double; phi: double; height: double; xyz: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauGd2gce';
(* Astronomy/Timescales *)
function iauD2dtf(const scale: PUTF8Char; ndp: Integer; d1: double; d2: double; iy: PInteger; im: PInteger; id: PInteger; ihmsf: PInteger): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauD2dtf';
function iauDat(iy: Integer; im: Integer; id: Integer; fd: double; deltat: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauDat';
function iauDtdb(date1: double; date2: double; ut: double; elong: double; u: double; v: double): double; cdecl;
  external LIB_SOFA name _PU + 'iauDtdb';
function iauDtf2d(const scale: PUTF8Char; iy: Integer; im: Integer; id: Integer; ihr: Integer; imn: Integer; sec: double; d1: PDouble; d2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauDtf2d';
function iauTaitt(tai1: double; tai2: double; tt1: PDouble; tt2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTaitt';
function iauTaiut1(tai1: double; tai2: double; dta: double; ut11: PDouble; ut12: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTaiut1';
function iauTaiutc(tai1: double; tai2: double; utc1: PDouble; utc2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTaiutc';
function iauTcbtdb(tcb1: double; tcb2: double; tdb1: PDouble; tdb2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTcbtdb';
function iauTcgtt(tcg1: double; tcg2: double; tt1: PDouble; tt2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTcgtt';
function iauTdbtcb(tdb1: double; tdb2: double; tcb1: PDouble; tcb2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTdbtcb';
function iauTdbtt(tdb1: double; tdb2: double; dtr: double; tt1: PDouble; tt2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTdbtt';
function iauTttai(tt1: double; tt2: double; tai1: PDouble; tai2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTttai';
function iauTttcg(tt1: double; tt2: double; tcg1: PDouble; tcg2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTttcg';
function iauTttdb(tt1: double; tt2: double; dtr: double; tdb1: PDouble; tdb2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTttdb';
function iauTtut1(tt1: double; tt2: double; dt: double; ut11: PDouble; ut12: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTtut1';
function iauUt1tai(ut11: double; ut12: double; dta: double; tai1: PDouble; tai2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauUt1tai';
function iauUt1tt(ut11: double; ut12: double; dt: double; tt1: PDouble; tt2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauUt1tt';
function iauUt1utc(ut11: double; ut12: double; dut1: double;
                   utc1: PDouble; utc2: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauUt1utc';
function iauUtctai(utc1: double; utc2: double; tai1: PDouble; tai2: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauUtctai';
function iauUtcut1(utc1: double; utc2: double; dut1: double;
                   ut11: PDouble; ut12: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauUtcut1';

(* Astronomy/HorizonEquatorial *)
procedure iauAe2hd(az: double; el: double; phi: double;
                   ha: PDouble; dec: PDouble); cdecl; external LIB_SOFA name _PU + 'iauAe2hd';
procedure iauHd2ae(ha: double; dec: double; phi: double;
                   az: PDouble; el: PDouble); cdecl; external LIB_SOFA name _PU + 'iauHd2ae';

function iauHd2pa(ha: double; dec: double; phi: double): double; cdecl;
  external LIB_SOFA name _PU + 'iauHd2pa';
(* Astronomy/Gnomonic *)
function iauTpors(xi: double; eta: double; a: double; b: double; a01: PDouble; b01: PDouble; a02: PDouble; b02: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTpors';
function iauTporv(xi: double; eta: double; v: PDouble; v01: PDouble; v02: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTporv';
procedure iauTpsts(xi: double; eta: double; a0: double; b0: double; a: PDouble; b: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauTpsts';
procedure iauTpstv(xi: double; eta: double; v0: PDouble; v: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauTpstv';
function iauTpxes(a: double; b: double; a0: double; b0: double; xi: PDouble; eta: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTpxes';
function iauTpxev(v: PDouble; v0: PDouble; xi: PDouble; eta: PDouble): Integer; cdecl; external LIB_SOFA name _PU + 'iauTpxev';
(* VectorMatrix/AngleOps *)
procedure iauA2af(ndp: Integer; angle: double; sign: PUTF8Char; idmsf: PInteger); cdecl; external LIB_SOFA name _PU + 'iauA2af';
procedure iauA2tf(ndp: Integer; angle: double; sign: PUTF8Char; ihmsf: PInteger); cdecl; external LIB_SOFA name _PU + 'iauA2tf';
function iauAf2a(s: UTF8Char; ideg: Integer; iamin: Integer; asec: double; rad: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauAf2a';
function iauAnp(a: double): double; cdecl; external LIB_SOFA name _PU + 'iauAnp';
function iauAnpm(a: double): double; cdecl; external LIB_SOFA name _PU + 'iauAnpm';
procedure iauD2tf(ndp: Integer; days: double; sign: PUTF8Char; ihmsf: PInteger); cdecl;
  external LIB_SOFA name _PU + 'iauD2tf';
function iauTf2a(s: UTF8Char; ihour: Integer; imin: Integer; sec: double; rad: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTf2a';
function iauTf2d(s: UTF8Char; ihour: Integer; imin: Integer; sec: double; days: PDouble): Integer; cdecl;
  external LIB_SOFA name _PU + 'iauTf2d';
(* VectorMatrix/BuildRotations *)
procedure iauRx(phi: double; r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRx';
procedure iauRy(theta: double; r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRy';
procedure iauRz(psi: double; r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRz';
(* VectorMatrix/CopyExtendExtract *)
procedure iauCp(p: PDouble; c: PDouble); cdecl; external LIB_SOFA name _PU + 'iauCp';
procedure iauCpv(pv: Tarray23; c: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauCpv';
procedure iauCr(r: Tarray23; c: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauCr';
procedure iauP2pv(p: PDouble; pv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauP2pv';
procedure iauPv2p(pv: Tarray23; p: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPv2p';
(* VectorMatrix/Initialization *)
procedure iauIr(r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauIr';
procedure iauZp(p: PDouble); cdecl; external LIB_SOFA name _PU + 'iauZp';
procedure iauZpv(pv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauZpv';
procedure iauZr(r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauZr';
(* VectorMatrix/MatrixOps *)
procedure iauRxr(a: Tarray23; b: Tarray23; atb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRxr';
procedure iauTr(r: Tarray23; rt: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauTr';

(* VectorMatrix/MatrixVectorProducts *)
procedure iauRxp(r: Tarray23; p: PDouble; rp: PDouble); cdecl; external LIB_SOFA name _PU + 'iauRxp';
procedure iauRxpv(r: Tarray23; pv: Tarray23; rpv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRxpv';
procedure iauTrxp(r: Tarray23; p: PDouble; trp: PDouble); cdecl; external LIB_SOFA name _PU + 'iauTrxp';
procedure iauTrxpv(r: Tarray23; pv: Tarray23; trpv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauTrxpv';
(* VectorMatrix/RotationVectors *)
procedure iauRm2v(r: Tarray23; w: PDouble); cdecl; external LIB_SOFA name _PU + 'iauRm2v';
procedure iauRv2m(w: PDouble; r: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauRv2m';
(* VectorMatrix/SeparationAndAngle *)
function iauPap(a: PDouble; b: PDouble): double; cdecl; external LIB_SOFA name _PU + 'iauPap';
function iauPas(al: double; ap: double; bl: double; bp: double): double; cdecl; external LIB_SOFA name _PU + 'iauPas';
function iauSepp(a: PDouble; b: PDouble): double; cdecl; external LIB_SOFA name _PU + 'iauSepp';
function iauSeps(al: double; ap: double; bl: double; bp: double): double; cdecl; external LIB_SOFA name _PU + 'iauSeps';

(* VectorMatrix/SphericalCartesian *)
procedure iauC2s(p: PDouble; theta: PDouble; phi: PDouble); cdecl; external LIB_SOFA name _PU + 'iauC2s';
procedure iauP2s(p: PDouble; theta: PDouble; phi: PDouble; r: PDouble); cdecl; external LIB_SOFA name _PU + 'iauP2s';
procedure iauPv2s(pv: Tarray23; theta: PDouble; phi: PDouble; r: PDouble; td: PDouble; pd: PDouble; rd: PDouble); cdecl;
  external LIB_SOFA name _PU + 'iauPv2s';
procedure iauS2c(theta: double; phi: double; c: PDouble); cdecl; external LIB_SOFA name _PU + 'iauS2c';
procedure iauS2p(theta: double; phi: double; r: double; p: PDouble); cdecl; external LIB_SOFA name _PU + 'iauS2p';
procedure iauS2pv(theta: double; phi: double; r: double; td: double; pd: double; rd: double; pv: Tarray23); cdecl;
  external LIB_SOFA name _PU + 'iauS2pv';
(* VectorMatrix/VectorOps *)  
function iauPdp(a: PDouble; b: PDouble): double; cdecl; external LIB_SOFA name _PU + 'iauPdp';
function iauPm(p: PDouble): double; cdecl; external LIB_SOFA name _PU + 'iauPm';
procedure iauPmp(a: PDouble; b: PDouble; amb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPmp';
procedure iauPn(p: PDouble; r: PDouble; u: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPn';
procedure iauPpp(a: PDouble; b: PDouble; apb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPpp';
procedure iauPpsp(a: PDouble; s: double; b: PDouble; apsb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPpsp';
procedure iauPvdpv(a: Tarray23; b: Tarray23; adb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPvdpv';
procedure iauPvm(pv: Tarray23; r: PDouble; s: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPvm';
procedure iauPvmpv(a: Tarray23; b: Tarray23; amb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPvmpv';
procedure iauPvppv(a: Tarray23; b: Tarray23; apb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPvppv';
procedure iauPvu(dt: double; pv: Tarray23; upv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPvu';
procedure iauPvup(dt: double; pv: Tarray23; p: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPvup';
procedure iauPvxpv(a: Tarray23; b: Tarray23; axb: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauPvxpv';
procedure iauPxp(a: PDouble; b: PDouble; axb: PDouble); cdecl; external LIB_SOFA name _PU + 'iauPxp';
procedure iauS2xpv(s1: double; s2: double; pv: Tarray23; spv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauS2xpv';
procedure iauSxp(s: double; p: PDouble; sp: PDouble); cdecl; external LIB_SOFA name _PU + 'iauSxp';
procedure iauSxpv(s: double; pv: Tarray23; spv: Tarray23); cdecl; external LIB_SOFA name _PU + 'iauSxpv';

implementation

(*----------------------------------------------------------------------
**
**  Copyright (C) 2021
**  Standards Of Fundamental Astronomy Board
**  of the International Astronomical Union.
**
**  =====================
**  SOFA Software License
**  =====================
**
**  NOTICE TO USER:
**
**  BY USING THIS SOFTWARE YOU ACCEPT THE FOLLOWING SIX TERMS AND
**  CONDITIONS WHICH APPLY TO ITS USE.
**
**  1. The Software is owned by the IAU SOFA Board ("SOFA").
**
**  2. Permission is granted to anyone to use the SOFA software for any
**     purpose, including commercial applications, free of charge and
**     without payment of royalties, subject to the conditions and
**     restrictions listed below.
**
**  3. You (the user) may copy and distribute SOFA source code to others,
**     and use and adapt its code and algorithms in your own software,
**     on a world-wide, royalty-free basis.  That portion of your
**     distribution that does not consist of intact and unchanged copies
**     of SOFA source code files is a "derived work" that must comply
**     with the following requirements:
**
**     a) Your work shall be marked or carry a statement that it
**        (i) uses routines and computations derived by you from
**        software provided by SOFA under license to you; and
**        (ii) does not itself constitute software provided by and/or
**        endorsed by SOFA.
**
**     b) The source code of your derived work must contain descriptions
**        of how the derived work is based upon, contains and/or differs
**        from the original SOFA software.
**
**     c) The names of all routines in your derived work shall not
**        include the prefix "iau" or "sofa" or trivial modifications
**        thereof such as changes of case.
**
**     d) The origin of the SOFA components of your derived work must
**        not be misrepresented;  you must not claim that you wrote the
**        original software, nor file a patent application for SOFA
**        software or algorithms embedded in the SOFA software.
**
**     e) These requirements must be reproduced intact in any source
**        distribution and shall apply to anyone to whom you have
**        granted a further right to modify the source code of your
**        derived work.
**
**     Note that, as originally distributed, the SOFA software is
**     intended to be a definitive implementation of the IAU standards,
**     and consequently third-party modifications are discouraged.  All
**     variations, no matter how minor, must be explicitly marked as
**     such, as explained above.
**
**  4. You shall not cause the SOFA software to be brought into
**     disrepute, either by misuse, or use for inappropriate tasks, or
**     by inappropriate modification.
**
**  5. The SOFA software is provided "as is" and SOFA makes no warranty
**     as to its use or performance.   SOFA does not and cannot warrant
**     the performance or results which the user may obtain by using the
**     SOFA software.  SOFA makes no warranties, express or implied, as
**     to non-infringement of third party rights, merchantability, or
**     fitness for any particular purpose.  In no event will SOFA be
**     liable to the user for any consequential, incidental, or special
**     damages, including any lost profits or lost savings, even if a
**     SOFA representative has been advised of such damages, or for any
**     claim by any third party.
**
**  6. The provision of any version of the SOFA software under the terms
**     and conditions specified herein does not imply that future
**     versions will also be made available under the same terms and
**     conditions.
*
**  In any published work or commercial product which uses the SOFA
**  software directly, acknowledgement (see www.iausofa.org) is
**  appreciated.
**
**  Correspondence concerning SOFA software should be addressed as
**  follows:
**
**      By email:  sofa@ukho.gov.uk
**      By post:   IAU SOFA Center
**                 HM Nautical Almanac Office
**                 UK Hydrographic Office
**                 Admiralty Way, Taunton
**                 Somerset, TA1 2DN
**                 United Kingdom
**
**--------------------------------------------------------------------*)
end.