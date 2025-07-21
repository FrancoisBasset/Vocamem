if [ ! -e "appimagetool.AppImage" ]
then
    wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
    mv appimagetool-x86_64.AppImage appimagetool.AppImage
fi

chmod u+x appimagetool.AppImage

mkdir -p AppDir/usr/bin
echo "[Desktop Entry]
Type=Application
Name=Boilerplate
Exec=boilerplate
Icon=logo
Categories=Utility;" > AppDir/boilerplate.desktop

echo '#!/bin/bash
exec $APPDIR/usr/bin/boilerplate' > AppDir/AppRun
chmod u+x AppDir/AppRun

cp dist/boilerplate/boilerplate-linux_x64 AppDir/usr/bin/boilerplate
cp dist/boilerplate/resources.neu AppDir/usr/bin

cp vue-src/public/logo.png AppDir

./appimagetool.AppImage AppDir boilerplate
chmod u+x boilerplate