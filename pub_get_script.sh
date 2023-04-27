#!/usr/bin/env bash

printf "vee app pub get\n"
flutter clean && flutter clean cache && flutter pub get
printf '\n\n'

printf "core pub get\n"
cd core || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "core_ui pub get\n"
cd core_ui || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "data pub get\n"
cd data || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "domain pub get\n"
cd domain || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "dashboard pub get\n"
cd features/dashboard || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "create_report pub get\n"
cd features/create_report || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "user_profile pub get\n"
cd features/user_profile || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'
