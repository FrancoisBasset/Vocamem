if [ ! -e "appimagetool.AppImage" ]
then
    wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
    mv appimagetool-x86_64.AppImage appimagetool.AppImage
fi

chmod u+x appimagetool.AppImage

mkdir -p AppDir/usr/bin
echo "[Desktop Entry]
Type=Application
Name=Vocamem
Exec=vocamem
Icon=logo
Categories=Utility;" > AppDir/vocamem.desktop

echo '#!/bin/bash
exec $APPDIR/usr/bin/vocamem' > AppDir/AppRun
chmod u+x AppDir/AppRun

cp dist/vocamem/vocamem-linux_x64 AppDir/usr/bin/vocamem
cp dist/vocamem/resources.neu AppDir/usr/bin

cp vue-src/public/logo.png AppDir

./appimagetool.AppImage AppDir vocamem
chmod u+x vocamem