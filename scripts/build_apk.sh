echo '\n[ 🚀🚀 ] :: Flutter build clean...'
flutter clean

echo '\n[ 🚀🚀 ] :: Flutter pub get...'
flutter pub get

echo '\n[ 🚀🚀 ] :: Flutter build apk...'
flutter build apk --release

echo '\n[ 🚀🚀 ] :: Flutter apk build success!  ✅✅' 
cd build/app/outputs/flutter-apk
open .
