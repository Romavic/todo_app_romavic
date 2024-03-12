# Todo App

#### For Run project must have:
-  Flutter version  channel stable - 3.19.3
-  Dart sdk: '>=3.3.1 <4.0.0'
-  VS Code or Android Studio the latest version

When project is downloaded, must generate
-  flutter pub run build_runner watch --delete-conflicting-outputs

For more details [Mobx](https://mobx.netlify.app/getting-started).

#### Project Architect:

-  **component** on this path, we have all component for project: Text, Button, etc.
-  **core** on this path, we have services, database and helpers interface and implementations.
-  **di** on this path, we have class injected on by DI.
-  **features** on this path, we have all features of project and on inside, has data, domain and presentation.
-  **navigation** on this path, we have navigation class to manager routes.
-  **resources** on this path, we have colors, theme, path of images.
