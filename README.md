# Flutter Startup Kit

My boilerplate for a flutter app.

There are two variations:

1. To view the **bloc architecture** style, [click here.](https://github.com/RabiRoshan/flutter_startup_kit/tree/bloc_architecture) (Inspired from [Reso Coder](https://resocoder.com/2019/10/26/flutter-bloc-library-tutorial-1-0-0-stable-reactive-state-management/)).

2. To view the **mvvm architecture** style, [click here.](https://github.com/RabiRoshan/flutter_startup_kit/tree/mvvm_architecture) (Inspired from [FilledStacks](https://www.filledstacks.com/post/flutter-architecture-my-provider-implementation-guide)).

Both branches make use of [Responsive UI by FilledStacks](https://www.filledstacks.com/post/the-best-flutter-responsive-ui-pattern/).

## Installation and Instructions

#### 1. Initial Steps:

1. Clone the repo, unzip and change project folder name to your project name.

#### a. For Bloc Architecture

```
 HTTPS: git clone -b bloc_architecture --single-branch https://github.com/RabiRoshan/flutter_startup_kit.git
 SSH: git clone -b bloc_architecture --single-branch git@github.com:RabiRoshan/flutter_startup_kit.git
```

#### b. For MVVM Architecture

```
HTTPS: git clone -b mvvm_architecture --single-branch https://github.com/RabiRoshan/flutter_startup_kit.git
SSH: git clone -b mvvm_architecture --single-branch git@github.com:RabiRoshan/flutter_startup_kit.git
```

2. Delete the following:

- `/android`
- `/ios`
- `.flutter-plugins`
- `.flutter-plugins-dependencies`
- `.metadata`
- `.packages`
- `flutter_startup_kit.iml`
- `pubspec.lock`

3. Also remove `/.git` if not needed.

#### 2. Change package name in pubspec.yaml

```
name: your_project_name
description: A brief description.
```

#### 3. Flutter initialize project and install packages

1. Step 1:

   ```sh
   $ flutter create --org com.yourorganizationname --androidx .
   $ flutter packages get
   ```

   ##### Note: Remove test folder.

2. Step 2:

   Change ~~minSdkVersion 16~~ to **minSdkVersion 18** in `/android/app/build.gradle`.

#### 4. [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) - For localization of your app (Remove if not needed)

1. Install the VS Code extension Flutter Intl
   Install from the Visual Studio Code Marketplace or by searching within VS Code.

2. Initialize extension for your project
   Open your project, open the command palette and find the Flutter Intl: Initialize command.

3. Add language data to `/lib/l10n/intl_en.arb`

#### 5. [Device Preview](https://pub.dev/packages/device_preview) is also packaged with this project. Remove it before production build.

Instructions to remove them are commented on corresponding lines of main.dart.

#### 6. There is an example project already bundled with this.

The example project is composed of 3 screens (LoginScreen, HomeScreen and EnterDetailsScreen), all of which makes use of the base architecture.

Modify and build on this project.

## References/Inspirations

1. [FilledStacks](https://www.filledstacks.com/)
2. [Reso Coder](https://resocoder.com/)
