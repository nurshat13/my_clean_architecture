<a name="readme-top"></a>


<h1 align="center">MyCleanArchitecture - My variation of clean architecture.</h1>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <!-- You should link the logo to the pub dev page of you project or a homepage otherwise -->
<!--   <a href="https://github.com/Flutterando/README-Template/">
    <img src="https://raw.githubusercontent.com/Flutterando/README-Template/master/readme_assets/logo.png" alt="Logo" width="180">
  </a> -->

  <p align="center">
    MyCleanArchitecture is made to simplify creating new projects and teaching introdict new developers to project architecture.
    <br />
  </p>

<br>

<!--  SHIELDS  ---->


<!-- The shields here are an example of what could be used and are the most recommended, there are more below in the "some recomendations about shields" section. 
See the links in the example below, changing the parts after img.shields.io you can change the content of the shields. Alternatively, go to the website and generate new shields.  

The ones used here are:
- Release version
- Pub Points
- style: Flutterando analysis
- publisher: Flutterando --->
<!----
[![Version](https://img.shields.io/github/v/release/flutterando/asuka?style=plastic)](https://pub.dev/packages/asuka)
[![Pub Points](https://img.shields.io/pub/points/asuka?label=pub%20points&style=plastic)](https://pub.dev/packages/asuka/score)
[![Flutterando Analysis](https://img.shields.io/badge/style-flutterando__analysis-blueviolet?style=plastic)](https://pub.dev/packages/flutterando_analysis/)

[![Pub Publisher](https://img.shields.io/pub/publisher/asuka?style=plastic)](https://pub.dev/publishers/flutterando.com.br/packages)
--->
</div>

<!----
About Shields, some recommendations:
+-+
Build - GithubWorkflow ou Github Commit checks state
CodeCoverage - Codecov
Chat - Discord 
License - Github
Rating - Pub Likes, Pub Points and Pub Popularity (if still in early stages, we recommend only Pub Points since it's controllable)
Social - GitHub Forks, Github Org's Stars (if using Flutterando as the main org), YouTube Channel Subscribers (Again, using Flutterando, as set in the example)
--->

<br>

---
<!-- TABLE OF CONTENTS -->
<!-- Linked to every ## title below -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#FVC-tool">FVC (Flexible Version Control) tool - puro</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#localization">Localization</a></li>
    <li><a href="#flavor">Flavor</a></li>
    <li><a href="#folder-structure">Overall folder structure</a></li>
    <li><a href="#navigation">Navigation - auto_route</a></li>
    <li><a href="#network">Network</a></li>
    <li><a href="#api-interceptor">Api interceptor</a></li>
    <li><a href="#other-interceptors">Other interceptors</a></li>
    <li><a href="#freezed">Freezed</a></li>
    <li><a href="#dependency-injection">Dependency injection</a></li>
    <li><a href="#bloc-mixin">Bloc mixin</a></li>
    <li><a href="#must-have">Must have packages</a></li>
  </ol>
</details>

---

<br>

<!-- FVC-tool -->
# FVC tool
<a name="FVC-tool"></a>

<br>
Before cloning and installing the project, I want to introduce Puro, my preferred  <strong>FVC (Flexible Version Control) tool. </strong> <a href="https://puro.dev/">Puro</a> is a modern version control system designed for efficiency, simplicity, and scalability.
<br>

### Why Puro?
<ol>
  <li>Speed & Performance – Puro is optimized for handling large repositories efficiently.</li>
  <li>Intuitive & User-Friendly – It simplifies version control workflows, making it easier to manage branches and commits.</li>
  <li>Better Collaboration – It offers advanced conflict resolution and smoother team collaboration.</li>
  <li>Lightweight & Flexible – Unlike traditional VCS, Puro reduces overhead and adapts to different project structures.</li>
</ol>
<br>
Using <a href="https://puro.dev/">Puro</a> ensures seamless version control, making project management smoother and more efficient.
<br>
Of course it's optional you can use whatever method you want

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Installation -->
# Installation
<a name="installation"></a>
<br>
1. <strong>Install Flutter SDK: </strong> Follow the <a href="https://flutter.dev/docs/get-started/install">Flutter Installation Guide.</a>
   <br><strong>Clone the repository: </strong>
   <br>
```sh
git clone https://github.com/nurshat13/my_clean_architecture.git
```
2. <strong>Navigate to the project folder and install dependencies:</strong>
```sh
cd my_clean_architecture
flutter pub get
```
3. <strong>Run the app on your desired platform:</strong>
```sh
flutter run --flavor dev -t lib/main_dev.dart
```
4. <strong>Using Puro</strong>
<br>
If you prefer using <strong>Puro</strong>, make sure it's installed first. You can find installation details <a href="https://puro.dev/"> here.</a> When using Flutter or Dart commands, simply prefix them with puro.
<br><br>
<strong>Install dependencies with Puro:</strong>

```sh
puro flutter pub get
```
<strong>Run the app with Puro:</strong>

```sh
puro flutter run --flavor dev -t lib/main_dev.dart
```
<br>
This ensures you’re using the correct environment for managing dependencies and running the project.
<br>
Here i am using flavor its app version managing tool more about in next step

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>

<!-- Flavor -->
# 🌍Localization
<a name="localization"></a>

This project uses the easy_localization package to manage multiple language translations efficiently. Easy Localization simplifies the process of handling localized strings and dynamically changing the app's language at runtime.

## Why Use Easy Localization?
<ul>
  <li>Supports multiple languages and dynamic switching.</li>
  <li>Uses JSON, CSV, or XML files to store translations.</li>
  <li>Provides pluralization and formatting for dates, numbers, and currencies.</li>
  <li>Works with Flutter widgets seamlessly.</li>
</ul>

## Generating Localization Keys

To avoid hardcoding string keys manually, we generate a Dart file (locale_keys.g.dart) containing constants for all translation keys.

### Commands for Generating Keys and Files

#### 1️⃣ Generate translation keys file (locale_keys.g.dart):

```sh
flutter pub run easy_localization:generate -S assets/translations -O lib/generated -f keys -o locale_keys.g.dart
```

#### 2️⃣ Generate only the translation files (without keys):

```sh
flutter pub run easy_localization:generate -S assets/translations -O lib/generated
```

## Final Notes

<ul>
  <li>Ensure easy_localization is added to pubspec.yaml.</li>
  <li>Run the commands above after modifying translation files.</li>
  <li>Make sure assets/translations/ is included in pubspec.yaml under flutter assets.</li>
</ul>

For more details, check the official <a href="https://pub.dev/packages/easy_localization">Easy Localization package.</a> 🚀


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Flavor -->
# Flavor
<a name="flavor"></a>

## FlavorIntroduction to Flavor – My Favorite Tool for Managing App Versions

For managing different versions of the app, I rely on <strong>Flavor.</strong> It’s my go-to tool because it allows for seamless management of multiple versions of the app (e.g., development, production) while keeping everything organized and efficient. With Flavor, you can easily switch between different configurations and build variants without hassle.

## How to Run the App with Different Flavors

In this project, you can run the app using the following commands based on the desired environment:
<br>
For <strong>Development Version:</strong>

```sh
flutter run --flavor dev -t lib/main_dev.dart
```

For <strong>Production Version:</strong>

```sh
flutter run --flavor prod -t lib/main.dart
```

By specifying the flavor, you ensure that the app is built with the correct configuration, helping to streamline the development process.
<br>
For more information on how Flavor works and how to integrate it into your project, check out the official documentation on the <a href="https://pub.dev/packages/flutter_flavor">Flutter Flavor package.</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<br>


# 📂 Overall folder structure
<a name="folder-structure"></a>

This project follows <strong>Clean Architecture,</strong> ensuring a well-structured, scalable, and testable codebase. The folder structure separates concerns efficiently, making development more maintainable and organized.
<br><br>
<strong>Overall Folder Structure:</strong>
<br>
```sh
root/
│── assets/                     # Contains images, fonts, and other static assets
│── lib/                        # Main source code folder
│   │── core/                   # Core project functionality
│   │   │── components/         # Reusable UI components (AppBar, Bottom Navigation, etc.)
│   │   │── constants/          # App-wide constants (colors, icons, environmental config)
│   │   │── navigation/         # Navigation-related configurations (e.g., AutoRoute setup)
│   │   │── network/            # Global network handling (Dio service, API client)
│   │   │── theme/              # Theme configurations (e.g., app theme files)
│   │   │── utils/              # Utility functions (e.g., key-value storage service)
│   │   │── usecase/            # Custom use case classes
│   │   │── resources/          # Centralized resource management
│   │   │── mixins/             # Custom mixins for shared logic
│   │── features/               # Contains all features of the app (e.g., auth, home, etc.)
│   │   ├── auth/               # Authentication module
│   │   │   ├── data/           # Data layer (API, local storage, repositories)
│   │   │   ├── domain/         # Domain layer (use cases, entities, repository contracts)
│   │   │   ├── presentation/   # UI and state management (BLoC, screens, widgets)
│   │   ├── home/               # Home module (structured like auth)
│   │── injection_container.dart# `injection_container.dart` for initializing dependencies (GetIt)
│   │── main.dart               # Main entry point (production)
│   │── main_dev.dart           # Main entry point (development - for flavors)
```

## 🔹 Core Folder (lib/core/)
<br>

<strong>The core folder contains all reusable utilities and app-wide configurations.</strong>

<ul>
  <li><strong>components/ – Reusable UI widgets such as default AppBar, Bottom Navigation, etc.</strong></li>
  <li><strong>constants/ – Stores global constants, including:</strong></li>
    <ul>
      <li>App Colors, App Icons</li>
      <li>Environmental Configurations (e.g., API base URLs)</li>
    </ul>
  <li><strong>navigation/ – Manages navigation setup using AutoRoute.</strong></li>
  <li><strong>network/ – Global networking configurations:</strong></li>
    <ul>
      <li>network_client.dart – Central API handler.</li>
      <li>dio_service.dart – Dio setup for making HTTP requests.</li>
    </ul>
  <li><strong>theme/ – Defines the app’s theme settings.</strong></li>
  <li><strong>utils/ – General utility functions; in this project, it includes:</strong></li>
    <ul>
      <li>Key-Value Storage Service (e.g., shared preferences or secure storage).</li>
    </ul>
  <li><strong>usecase/, resources/, mixins/ – Optional folders for:</strong></li>
    <ul>
      <li>Custom DataStates and UseCase classes for better state handling.</li>
    </ul>
</ul>

## 🔹 Dependency Injection (lib/)
<br>

<strong>This project uses GetIt for dependency injection.</strong>

<ul>
    <li><strong>injection_container.dart – Initializes repositories, use cases, and BLoCs.</strong>strong></li>
</ul>

## 🔹 Entry Points (main.dart & main_dev.dart)
<br>

<strong>To support different environments (development & production), the project uses Flavors.</strong>

<ul>
    <li><strong>main.dart – Runs the production version of the app.</strong>strong></li>
    <li><strong>main_dev.dart – Runs the development version with separate configurations.</strong>strong></li>
</ul>

<strong>mTo run different flavors, use:</strong>

```sh
flutter run --flavor dev -t lib/main_dev.dart
```

```sh
flutter run --flavor prod -t lib/main.dart
```

## ✅ Why This Structure?
<dl>
  <dt>✔ Separation of Concerns – Keeps business logic, data, and UI independent.</dt>
  <dt>✔ Scalability – Makes it easier to add new features.</dt>
  <dt>✔ Testability – Each layer can be tested independently.</dt>
  <dt>✔ Maintainability – The structured approach makes long-term maintenance easier.</dt>
</dl>

<strong>This approach ensures clean, modular, and efficient code, making development smoother. 🚀</strong>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Navigation -->
# Navigation - auto_route
<a name="navigation"></a>

AutoRoute is a <strong>powerful routing package</strong> for Flutter that simplifies navigation and deep linking while maintaining <strong>type safety and scalability.</strong> Instead of manually handling route navigation with Navigator.push(), AutoRoute <strong>automatically generates</strong> strongly-typed routes based on annotations.

## 🚀 Why I Prefer AutoRoute?

<dl>
  <dt>✔ Automatic Route Generation – No need to manually define MaterialPageRoute.</dt>
  <dt>✔ Type-Safe Navigation – Pass arguments safely without using dynamic types.</dt>
  <dt>✔ Deep Linking Support – Easily handle deep linking.</dt>
  <dt>✔ Route Guards – Restrict access to certain pages based on authentication state.</dt>
  <dt>✔ Declarative Navigation – Define routes in a structured way.</dt>
</dl>

## 🔹 AutoRoute Features and Setup

### 1️⃣ Define Routes in app_router.dart

In the project, we define an AppRouter class where we declare the available routes using <strong>AutoRoute annotations.</strong>

```dart
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),   // Authentication Page
        AutoRoute(page: HomeRoute.page, initial: true), // Home Page (Initial Route)
        AutoRoute(page: PostDetailRoute.page), // Post Detail Page
      ];
}
```

### 2️⃣ Generating Routes Using Build Runner

After defining routes, AutoRoute requires code generation. Run the following command:

```sh
flutter pub run build_runner build
```

or for continuous watch mode:

```sh
lutter pub run build_runner watch
```

This generates the app_router.gr.dart file, containing the implementation of routes.


### 3️⃣ Using AutoRoute in the App

Navigate to a page using:

```dart
context.router.push(HomeRoute()); // Navigate to Home Page
context.router.replace(AuthRoute()); // Replace current page with Auth Page
context.router.pop(); // Go back to the previous page
```

Pass arguments safely:

```dart
context.router.push(PostDetailRoute(postId: 42)); // Navigate with arguments
```

## 🔐 Using AuthGuard for Route Protection

AutoRoute supports <strong>route guards,</strong> which can be used to <strong>protect specific routes</strong> based on authentication state


### 1️⃣ Define AuthGuard Class

This class checks if the user is authenticated before allowing access to a route:

```dart
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authenticated = GetIt.I<GlobalAuthBloc>().state.status == GlobalAuthStatus.authenticated;
    
    if (authenticated) {
      resolver.next(true); // Allow navigation
    } else {
      resolver.next(false);
      resolver.redirect(AuthRoute()); // Redirect to login page
    }
  }
}
```

### 2️⃣ Apply AuthGuard to Protected Routes

Modify routes to protect HomeRoute and PostDetailRoute:

```dart
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),   
        AutoRoute(page: HomeRoute.page, initial: true, guards: [AuthGuard()]), // Protected Route
        AutoRoute(page: PostDetailRoute.page, guards: [AuthGuard()]), // Protected Route
      ];
}
```

Now, only authenticated users can access the  <strong>Home and Post Detail pages. </strong> If they are not logged in, they are  <strong>redirected to the Auth Page. </strong>

## ✅ Summary: Why AutoRoute?

<dl>
  <dt>✅ Cleaner Code – No more Navigator.push() everywhere.</dt>
  <dt>✅ Stronger Type Safety – Arguments are passed explicitly and correctly.</dt>
  <dt>✅ Scalability – Large apps benefit from structured navigation.</dt>
  <dt>✅ Built-in Route Guards – Secure pages without manually checking authentication state.</dt>
  <dt>✅ Deep Linking – Easily handle deep linking for web & mobile..</dt>
</dl>

By using <strong>AutoRoute,</strong> navigation becomes <strong>simpler, safer, and more scalable</strong> 🚀.

<br>

For more information on how AutoRute works and how to integrate it into your project, check out the official documentation on the <a href="https://pub.dev/packages/auto_route">Flutter AutoRute package.</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Network -->
# Network
<a name="network"></a>
 
The <strong>Network</strong> folder in this project is responsible for handling API requests and responses efficiently using <strong><a href="https://pub.dev/packages/dio">Dio</a></strong>, a powerful HTTP client for Flutter. It follows a <strong>clean and scalable approach,</strong> ensuring easy API integration, request cancellation, error handling, and caching.

## 📂 Network Folder Structure

<ol>
  <li>api_endpoints.dart – Contains API base URLs and endpoint definitions.</li>
  <li>custom_exceptions.dart – Handles Dio errors and converts them into custom exceptions.</li>
  <li>dio_service.dart – Provides a service layer for executing network requests with Dio.</li>
  <li>network_client.dart – Defines an abstract network client interface for making requests.</li>
</ol>


## 🔹 Explanation of Each File

### 🔹 1. api_endpoints.dart (Base URL & Endpoints)

<ul>
  <li>Defines baseUrl, which dynamically switches between production and development environments.</li>
  <li>Contains enum-based endpoints for authentication (login, register, etc.), ensuring type safety.</li>
</ul>

<strong>Modify the baseUrl according to your project's API.</strong>

### 🔹 2. custom_exceptions.dart (Error Handling)

<ul>
  <li>This file ensures better error handling by converting Dio exceptions into custom exceptions.</li>
  <li>Instead of dealing with raw errors, we handle network failures gracefully throughout the app.</li>
</ul>

### 🔹  3. dio_service.dart (Dio-Based API Service)

<ul>
  <li>Implements Dio for handling API requests with built-in support for caching and request cancellation.</li>
  <li>Supports different HTTP methods like GET, POST, PUT, PATCH, and DELETE.</li>
  <li>Uses CancelToken to allow premature request cancellation, improving efficiency.</li>
</ul>

<strong>Example API Call Using DioService</strong>

```dart
final response = await dioService.get(
  endpoint: "https://api.example.com/posts",
);
```

### 🔹  4. network_client.dart (Abstract Network Interface)

<ul>
  <li>Defines an interface for making API requests.</li>
  <li>Allows different implementations (e.g., Dio, HTTP, Mock clients) while maintaining a consistent structure.</li>
  <li>Ensures all network calls follow a standard pattern for better maintainability.</li>
</ul>

### 📖 Learn More

For a <strong>detailed breakdown of this network architecture,</strong> check out this article:
🔗 <a href="https://medium.com/flutter-app-development/advanced-generic-network-layer-in-flutter-using-dio-2022-2f362e22e6c9">Advanced Generic Network Layer in Flutter Using Dio</a>
This network setup <strong>keeps API calls organized, scalable, and efficient.</strong> 🚀

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Api interceptor -->
# Api interceptor 

<a name="api-interceptor"></a>

The ApiInterceptor class is a custom Dio interceptor designed to handle:
<dl>
  <dt>✅ Authorization Token Injection (Using KeyValueStorageService)</dt>
  <dt>✅ Optional Request Encryption (AES-based)</dt>
  <dt>✅ Optional Response Decryption (AES-based)</dt>
  <dt>✅ Automatic Logout on Token Expiry (401 Errors)</dt>
</dl>

## 📌 Key Components Explained


### 🔹 1. Key-Value Storage & Token Handling

The interceptor retrieves the  <strong>authentication token </strong> from KeyValueStorageService and adds it to every API request. This ensures all authenticated requests are properly authorized.

#### How It Works
<ul>
  <li>The token is fetched from secure local storage.</li>
  <li>It's added to the request headers under "Authorization".</li>
  <li>If the token is invalid (401 Unauthorized response), the user is automatically logged out.</li>
</ul>


```dart
final token = await GetIt.I<KeyValueStorageService>().getAccessToken();
options.headers.addAll({'Authorization': '$token'});
```

👉  <strong>Ensures secure token storage & automatic logout handling! </strong>

### 🔹 2. Optional AES Encryption for Requests
<ul>
  <li>If encryption is enabled, the request body is encrypted before sending.</li>
  <li>Uses AES-256 CBC mode with PKCS7 padding.</li>
  <li>Prevents sensitive data from being exposed during transmission.</li>
</ul>

```dart
if (enableEncryption && options.data is String) {
  options.data = encryptWithAES("secret-key", options.data);
}
```

### 🔹 3. Optional AES Decryption for Responses
<ul>
  <li>If decryption is enabled, the response body is decrypted after receiving.</li>
  <li>Ensures secure handling of sensitive data.</li>
</ul>

```dart
if (enableDecryption && response.data is String) {
  response.data = decryptAES(response.data, "secret-key");
}
```

### 🔹 4. Automatic Logout on Token Expiry

<ul>
  <li>If the server returns 401 Unauthorized, the interceptor clears stored tokens and logs the user out automatically.</li>
  <li>Uses GlobalAuthBloc to trigger logout and reset stored credentials.</li>
</ul>

```dart
if (err.response?.statusCode == 401)
  GetIt.I<KeyValueStorageService>().resetKeys();
  GetIt.I<GlobalAuthBloc>().add(GlobalAuthEvent.logOut());
}
```
👉 <strong>Enhances security by preventing access with expired tokens!</strong>


## 🔎 Summary
🚀 The ApiInterceptor ensures secure API communication by:
<dl>
  <dt>✅ Automatically adding tokens to requests</dt>
  <dt>✅ Encrypting requests (Optional).</dt>
  <dt>✅ Decrypting responses (Optional)</dt>
  <dt>✅ Handling automatic logout on token expiration</dt>
</dl>
<br>
This setup improves security, reliability, and scalability in your Flutter app! 🔥
<br>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Other interceptors -->
# Freezed
<a name="freezed"></a>

Freezed is a Dart package that allows you to create immutable classes with ease, offering data classes, union types, and copy functionality. It ensures that your models and state management solutions are both type-safe and efficient.
<br>

In this project, Freezed is utilized for:
<ul>
  <li><strong>Models</strong> Simplifying the process of creating data models by providing immutable classes with convenient copy methods and equality checks.</li>
  <li><strong>BLoC</strong> Automating state management for your business logic by utilizing Freezed's union types for states and events.</li>
</ul>

With Freezed, you get the benefits of strong immutability and value equality with minimal boilerplate code, improving both the clarity and maintainability of your app.

## 🚀 Setup with Dart Build Runner

To generate the necessary code, Freezed relies on dart build_runner. Simply run the following command to generate all required files:

```sh
flutter pub run build_runner build
```

For continuous code generation during development, you can use:

```sh
flutter pub run build_runner watch
```

This ensures that any changes to your data classes or BLoC state management classes are automatically reflected in your project.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Other interceptors -->
# Other interceptors
<a name="other-interceptors"></a>

The setupApiService() function <strong>initializes the API service</strong> by configuring Dio and attaching multiple interceptors.

## 📌 Key Components in Setup

<dl>
  <dt>1️⃣ ApiInterceptor() → Custom interceptor for auth tokens & encryption</dt>
  <dt>2️⃣ ChuckerDioInterceptor() → Logs & inspects API calls using Chucker Flutter.</dt>
  <dt>3️⃣ DioCacheInterceptor() → Caches API responses for better performance</dt>
  <dt>4️⃣ PrettyDioLogger() → Logs API requests & responses for debugging</dt>
</dl>


```dart
final dioService = DioService(
  dioClient: Dio(),
  interceptors: [
    ApiInterceptor(),
    ChuckerDioInterceptor(),
    DioCacheInterceptor(options: cacheOptions),
    PrettyDioLogger(),
  ],
);
```

## 🛠️ Adding More Interceptors

If you need additional interceptors (e.g., for monitoring, request modification, etc.), <strong>you can add them here</strong> by simply appending them to the interceptors list. 🚀
<br>
👉 <strong>Ensures flexible, scalable, and well-structured API management in Flutter!</strong>



<!-- GetIt -->
# Dependency injection

<a name="dependency-injection"></a>

<strong>GetIt</strong> is a powerful, simple-to-use, and lightweight dependency injection (DI) library for Dart and Flutter. It helps manage and inject dependencies across your application without the need for complex boilerplate code.

## 📌 Key Concepts:

<ul>
  <li><strong>Singleton Pattern:</strong> With GetIt, you can register objects as singletons, meaning there is only one instance of the class throughout the application's lifecycle. This ensures that all consumers of that object receive the         same instance, which is great for services like<strong> network clients, state managers, repositories,</strong>strong> and more.</li>
    <li><strong>Service Locator:</strong> GetIt acts as a service locator, allowing you to easily access any registered dependency throughout your app, anywhere, without tightly coupling components. This makes it easier to manage dependencies       and unit-test your app.
  </li>
</ul>

## ✅ Benefits of Using GetIt:

<ol>
  <li><strong>Simplifies Dependency Management:</strong>strong> By using GetIt, you can manage dependencies in a centralized way, avoiding the need to manually pass objects down the widget tree or deal with global variables. You register your dependencies in one place, and GetIt ensures they're accessible everywhere</li>
  <li><strong>Improved Testability:</strong> When dependencies are injected via GetIt, they can be easily mocked or replaced during testing, allowing for better unit testing without worrying about the actual implementations.</li>
  <li><strong>Single Responsibility Principle (SRP):</strong> With GetIt managing your dependencies, each class or widget is focused on its primary responsibility, not worrying about creating and managing the lifecycle of its dependencies.</li>
  <li><strong>Easy to Set Up:</strong> GetIt is simple to integrate into any project. You register objects with just a few lines of code and retrieve them anywhere in the app. This makes it ideal for managing both complex and simple dependencies.</li>
</ol>


## ❓How It Works:

<strong>Registering Dependencies:</strong> You register your dependencies using GetIt’s registerSingleton (for singletons) or registerFactory (for transient objects). Once registered, GetIt keeps track of the object and ensures only one instance is used, if registered as a singleton.
<br>
Example:
<br>
<br>

```dart
GetIt.I.registerSingleton<MyService>(MyService());
```
Accessing Dependencies: Anywhere in your app, you can access your registered dependencies through GetIt.I:

```dart
final myService = GetIt.I<MyService>();
```

Lifecycle Management: GetIt automatically manages the lifecycle of registered objects. For singletons, the same instance will be returned every time you request it. If you need a new instance every time, you can use registerFactory.

## ❔Why It's Good to Use GetIt:

<ul>
  <li><strong>Decouples Components:</strong> GetIt decouples classes from one another, ensuring that you don't have to manually pass dependencies around your app.</li>
  <li><strong>Easy to Scale:</strong> As your app grows, GetIt scales easily, making it ideal for managing complex dependencies and services in larger projects.</li>
  <li><strong>No Boilerplate:</strong> It reduces the need for complex frameworks or additional DI libraries, providing a clean and simple solution for dependency injection.</li>
</ul>

In conclusion, GetIt is an excellent choice for dependency injection in Flutter, helping you manage dependencies more effectively, improving testability, and keeping your codebase clean and maintainable. 🚀
<br>

For more information on how to use GetIt, you can check out the official <a href="https://pub.dev/packages/get_it"> package page </a> on pub.dev.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GetIt -->
# Bloc mixin

<a name="bloc-mixin"></a>

The BlocEventHandlerMixin is a custom mixin that simplifies handling events and states within your BLoC (Business Logic Component) classes in Flutter. It provides a standardized way to handle operations based on the result of asynchronous tasks (like network calls), making it easier to deal with loading, success, and failure states.

## 📌The key benefits of this mixin are:

<ol>
  <li><strong>Consistency:</strong> It ensures that event handling is done uniformly across different BLoC classes. You don’t have to manually handle loading states, success responses, or error handling every time. Instead, you can reuse this mixin’s handleEvent method, which takes care of the heavy lifting.</li>
  <li><strong>Code Simplification:</strong> It abstracts away repetitive code such as emitting different states based on the result of an operation. This leads to cleaner, more readable code by allowing you to focus on the core logic of your app rather than boilerplate event/state handling.</li>
  <li><strong>Error Handling:</strong> By utilizing a custom CustomException, it allows your app to respond appropriately when network or data-related errors occur. This is a common issue in many apps, and this mixin handles it systematically.</li>
</ol>


## Example Usage:

In the provided example, the HomeBloc class is responsible for handling different events like fetching a list of posts (getPosts) or fetching a post by ID (getPostByID). For each event, the handleEvent method from the BlocEventHandlerMixin is called to manage the loading, success, and failure states. The mixin method abstracts this logic for both cases, making the BLoC cleaner and less error-prone.

<br>

For instance:

<ol>
  <li><strong>Loading State:</strong> It ensures that event handling is done uniformly across different BLoC classes. You don’t have to manually handle loading states, success responses, or error handling every time. Instead, you can reuse this mixin’s handleEvent method, which takes care of the heavy lifting.</li>
  <li><strong>Success State:</strong> Once the operation succeeds, the data is passed to the success handler, which updates the state with the fetched data.</li>
  <li><strong>Failure State:</strong> If the operation fails, the error is processed, and an appropriate error state is emitted.</li>
</ol>

In short, this mixin encapsulates the common patterns of handling asynchronous operations in your BLoC, reducing the amount of boilerplate code you need to write and ensuring that all your event handlers follow a consistent approach.
<br>
This pattern helps maintain the separation of concerns in your code, making it easier to manage and maintain.
<br>
And ofcourse its optional, you can remove it if don't need

<!-- Must have packages -->
# Must have packages

<a name="must-have"></a>

In this project, several essential packages have been integrated to enhance development efficiency and application performance. Here's an overview of these packages and their key features:

### 🔹 1. Device Preview

The Device Preview package allows you to simulate your Flutter app on various devices directly from your development environment. This feature is crucial for ensuring your app's responsiveness and appearance across different screen sizes and orientations.
<br>
Key features include:

<ol>
  <li><strong>Device Simulation:</strong> Preview your app on a wide range of devices.</li>
  <li><strong>Orientation Adjustment:</strong> Change device orientation to test responsiveness.</li>
  <li><strong>Dynamic System Configuration:</strong> Simulate different system settings like language, dark mode, and text scaling.</li>
  <li><strong>Freeform Device:</strong> Create custom devices with adjustable resolutions and safe areas.</li>
  <li><strong>State Preservation:</strong> Maintain application state across device previews.</li>
  <li><strong>Plugin System:</strong> Extend functionality with customizable plugins.</li>
</ol>

For more information, visit the <a href="https://pub.dev/packages/device_preview">Device Preview package page</a>.

### 🔹 2. Chucker Flutter

Chucker Flutter is a powerful tool for inspecting HTTP(S) requests and responses within your Flutter application. It stores data locally and provides a user-friendly interface for analyzing network calls, which is essential for debugging and optimizing network interactions.
<br>
Key features include:

<ol>
  <li><strong>Network Traffic Inspection:</strong> Monitor HTTP(S) requests and responses.</li>
  <li><strong>Local Storage:</strong> Save network data for offline analysis.</li>
  <li><strong>User Interface:</strong> Access network data through an intuitive UI.</li>
  <li><strong>Data Sharing:</strong> Share network data for collaborative debugging.</li>
</ol>

For more details, refer to the <a href="https://pub.dev/packages/chucker_flutter">Chucker Flutter package page</a>.

### 🔹 3. Flutter ScreenUtil

Flutter ScreenUtil is a plugin that helps adapt your app's UI to different screen sizes and resolutions, ensuring a consistent and responsive design across devices.
<br>
Key features include:

<ol>
  <li><strong>Screen Size Adaptation:</strong> Adjust UI elements to fit various screen sizes.</li>
  <li><strong>Font Size Scaling:</strong> Scale fonts according to screen dimensions.</li>
  <li><strong>Design Consistency:</strong> Maintain consistent design across devices.</li>
</ol>

For more details, refer to the <a href="https://pub.dev/packages/flutter_screenutil">Flutter ScreenUtil package page</a>.

### 🔹 4. Awesome Extensions

Awesome Extensions is a package that provides a collection of useful extensions to reduce boilerplate code and add helpful methods, facilitating responsive design and improving code readability.
<br>
Key features include:

<ol>
  <li><strong>Widget Extensions:</strong> Enhance widget functionality with additional methods.</li>
  <li><strong>Responsive Design:</strong> Simplify the creation of responsive layouts.</li>
  <li><strong>Minimize boilerplate code for cleaner implementations.</li>
</ol>

For more details, refer to the <a href="https://pub.dev/packages/awesome_extensions">Awesome Extensions package page</a>.

Integrating these packages into your Flutter projects can streamline development processes, enhance debugging capabilities, and ensure your applications are responsive and well-optimized across various devices.🚀



<!---- Those are the current Flutterando contacts as of 25 August 2022 --->
# Contact

- [Telegram](https://t.me/Nurshat_10)


<p align="right">(<a href="#readme-top">back to top</a>)</p>





