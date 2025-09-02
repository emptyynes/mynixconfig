{
  lib,
  stdenv,
  fetchzip,
  libusb1,
  glibc,
  libGL,
  xorg,
  makeWrapper,
  qtx11extras,
  wrapQtAppsHook,
  autoPatchelfHook,
  libX11,
  libXtst,
  libXi,
  libXrandr,
  libXinerama
}:

let
  dataDir = "var/lib/xppend1v3";
in
stdenv.mkDerivation rec {
  pname = "xp-pen-deco-01-v3-driver";
  version = "4.0.7-250117";

  src = fetchzip {
    url = "https://download01.xp-pen.com/file/2025/02/XPPenLinux4.0.7-250117.tar.gz";
    name = "xp-pen-deco-01-v3-driver-${version}.tar.gz";
    sha256 = "sha256-sH05Qquo2u0npSlv8Par/mn1w/ESO9g42CCGwBauHhU=";
  };

  nativeBuildInputs = [
    wrapQtAppsHook
    autoPatchelfHook
    makeWrapper
  ];

  dontBuild = true;

  dontWrapQtApps = true; # this is done manually

  buildInputs = [
    libusb1
    libX11
    libXtst
    libXi
    libXrandr
    libXinerama
    glibc
    libGL
    (lib.getLib stdenv.cc.cc)
    qtx11extras
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{opt,bin}
    cp -r App/usr/lib/pentablet/* $out/opt
    chmod +x $out/opt/PenTablet
    cp -r App/lib $out/lib
    sed -i 's#usr/lib/pentablet#${dataDir}#g' $out/opt/PenTablet

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper $out/opt/PenTablet $out/bin/xp-pen-deco-01-v3-driver \
      "''${qtWrapperArgs[@]}" \
      --run 'if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit 1; fi' \
      --run 'if [ ! -d /${dataDir} ]; then mkdir -p /${dataDir}; cp -r '$out'/opt/conf /${dataDir}; chmod u+w -R /${dataDir}; fi'
  '';

  meta = with lib; {
    homepage = "https://www.xp-pen.com/product/deco-01-v3.html";
    description = "Drivers for the XP-PEN Deco 01 v3 drawing tablet";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    maintainers = with maintainers; [ virchau13 ];
    license = licenses.unfree;
  };
}