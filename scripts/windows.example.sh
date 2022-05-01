#!/bin/sh
 
SDLVERSION="2.0.22"
SDLTTFVERSION="2.0.15"
SDLIMAGEVERSION="2.0.5"
mkdir extras
cd extras
export CURSRC=`pwd`
curl https://www.libsdl.org/release/SDL2-$SDLVERSION-win32-x64.zip --output sdl2.zip
curl https://www.libsdl.org/release/SDL2-devel-$SDLVERSION-VC.zip --output sdl2-devel.zip
7z e sdl2-devel.zip -y -r -spf
curl https://www.libsdl.org/projects/SDL_image/release/SDL2_image-$SDLIMAGEVERSION-win32-x64.zip --output sdl2img.zip
7z e sdl2img.zip -obuild/debug -y -r -spf
curl https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-$SDLIMAGEVERSION-VC.zip --output sdl2img-devel.zip
7z e sdl2img-devel.zip -y -r -spf
curl https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-$SDLTTFVERSION-win32-x64.zip --output sdl2ttf.zip
7z e sdl2ttf.zip -obuild/debug -y -r -spf
curl https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-$SDLTTFVERSION-VC.zip --output sdl2ttf-devel.zip
7z e sdl2ttf-devel.zip -y -r -spf
cd ..
7z e extras/sdl2.zip -obuild/debug -y -r -spf
mkdir -p build
cd build
cmake --version 
cmake \
    -DSDL2_LIBRARY="$CURSRC/SDL2-$SDLVERSION/lib/x64/sdl2.lib" \
    -DSDL2_INCLUDE_DIR="$CURSRC/sdl2-$SDLVERSION/include" \
    -DSDL2TTF_LIBRARY="$CURSRC/SDL2_ttf-$SDLTTFVERSION/lib/x64/sdl2_ttf.lib" \
    -DSDL2TTF_INCLUDE_DIR="$CURSRC/SDL2_ttf-$SDLTTFVERSION/include" \
    -DSDL2_IMAGE_LIBRARY="$CURSRC/SDL2_image-$SDLIMAGEVERSION/lib/x64/sdl2_image.lib" \
    -DSDL2_IMAGE_INCLUDE_DIR="$CURSRC/SDL2_image-$SDLIMAGEVERSION/include" \
    ..
