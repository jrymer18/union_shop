**UNION SHOP Coursework Project**

-  This Flutter project is a recreation of an exisitng shop (shop.upsu.net) for a Univeristiy Coursework project.


**Setup Instructions**

**Prerequisites**

Before installing and running this project, ensure you have the following installed:
	•	Operating System:
	•	Windows 10/11, macOS, or Linux
	•	Flutter SDK:
	•	Version 2.17.0 or higher, but below 4.0.0
	•	Install from: https://flutter.dev/docs/get-started/install
	•	Dart SDK:
	•	Included with Flutter (compatible with the environment defined in pubspec.yaml)
	•	Android/iOS Development Tools:
	•	Android Studio (with Android SDK + Emulator)
	•	Xcode (for macOS/iOS development)
	•	Git
	•	https://git-scm.com/downloads


**How to clone**

1. Open a terminal and run:

     ```git clone <your-repository-url>```
      ```cd union_shop```

2. 	Install Flutter dependencies by running:

    ```flutter pub get```

3. Run:
   
   ```flutter devices```
  
4. Select Chrome

5. Verify that Flutter is set up correctly by running:

   ```flutter doctor```
  
6. Run the project by running:

   ```flutter run -d chrome```
  
**Usage Instructions**

Buttons are non-functioning and many cases meaning you will need to use Hash Routing. See below guide:

About page
- /about

Home page
- /main

Product page
- /product

Login / Authentication
- /log

Collections
- /collections

Winter page
- /winter

Sale page
- /sale

**Project Structure and tech stack**

All working files are stored in teh LIB folder. As well as this there are a few imports to all page such as the header, footer and advert bar.

The main.dart is the file to run the project. 

**Key packages and dependencies**
Flutter SDK

Core framework for building the cross-platform UI.
cupertino_icons: ^1.0.0

Provides iOS-style icons used throughout the app.
Dev dependencies

flutter_test – Testing framework for unit and widget tests.
flutter_lints: ^2.0.0 – Recommended lint rules to keep the codebase clean and consistent.


**Limitations**
Platform support
Currently tested primarily on mobile web and desktop views may not be fully supported or tested.

Incomplete widget functionality
Not all UI widgets are fully implemented yet. Some buttons, forms, and navigation flows may be non operational.

**Contact**

Joshua Rymer

up2266410@myport.ac.uk
