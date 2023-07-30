# Flutter Clean Architecture Base

A Flutter project that follows the Clean Architecture design pattern. The project is organized into three main layers: Data, Domain, and Presentation, each serving a specific purpose in the application's architecture. The Data Layer consists of implementations and data sources, the Domain Layer contains Entities and all business logic of the application, and the Presentation Layer holds ViewModels (Providers), routes, screens, and widgets.

## Project Structure

The project has the following folder structure:

- **data**: This layer handles data-related operations, including implementations and data sources. It has three subfolders:
  - **models**: Contains model classes that extend the Entities from the Domain layer. These models include parsing logic for data serialization.
  - **repositories**: Acts as contracts and defines interfaces for data repositories.
  - **data_sources**: Provides implementations for data retrieval from different sources (e.g., APIs, databases).

- **domain**: This layer contains the core business logic of the application and consists of three subfolders:
  - **entities**: Holds business logic entities that represent the application's data model and business rules.
  - **usecases**: Contains the use cases or interactors that define the application's business use cases.
  - **repositories**: Acts as contracts and defines interfaces for domain layer repositories.

- **presentation**: The presentation layer is responsible for handling the user interface and user interactions. It includes:
  - **viewmodels**: Holds ViewModels or Providers that manage the state and presentation logic of the screens.
  - **routes**: Contains navigation-related logic, defining the app's various screens and their transitions.
  - **screens**: Defines the individual screens of the application.
  - **widgets**: Contains custom widgets used across the application.

- **core**: Contains common logic and utilities shared across different features of the application.

## Dependencies

The project uses several external packages to enhance development and functionality:

- **dio**: A powerful HTTP client for making API requests.
- **hive**: A lightweight and fast NoSQL database for storing data locally.
- **http**: The Dart http package for making HTTP requests.
- **intl**: Provides internationalization and localization support.
- **dartz**: Brings functional programming constructs to Dart, used for handling Either types.
- **get_it**: A dependency injection package for managing and injecting dependencies.
- **provider**: A state management package for Flutter applications.
- **equatable**: Simplifies the implementation of equality and hashcode for classes.
- **flutter_svg**: Enables rendering SVG images in Flutter.
- **file_picker**: Allows users to pick files from various sources.
- **url_launcher**: Enables launching URLs in the device's browser.
- **path_provider**: Provides access to device directories for data storage.
- **cupertino_icons**: Icon pack for Cupertino (iOS-style) icons.
- **json_annotation**: Helps with JSON serialization and deserialization.
- **connectivity_plus**: Monitors network connectivity and provides information about the active connection.
- **shared_preferences**: Simplifies storing preferences/key-value data.
- **permission_handler**: Helps in handling permissions in the application.
- **font_awesome_flutter**: Flutter-specific Font Awesome icons integration.
- **awesome_notifications**: Adds push notification support with advanced features.

## Development Dependencies

The project uses the following development dependencies:

- **build_runner**: Used for code generation and running code generators.
- **flutter_lints**: Provides linting rules specific to Flutter projects.
- **hive_generator**: Code generator for Hive, used for serialization.
- **json_serializable**: Code generator for JSON serialization.
- **flutter_launcher_icons**: Automates the process of adding launcher icons in Flutter apps.
- **flutter_native_splash**: Automates the process of adding native splash screens in Flutter apps.

## Graphics & Icons

The project includes various image assets and font families for customizing the app's appearance. The "assets" section in the "flutter" section of the "pubspec.yaml" file lists the image and font directories. The app uses the "Signika," "Fira," and "Sarabun" font families with different weights.

## How to Use

To get started with this base setup, follow these steps:

1. Clone the repository.
2. Run "flutter pub get" to install all dependencies.
3. Modify or extend the existing entities, use cases, and repositories in the domain layer to match your application's specific business logic.
4. Implement the data sources and repositories in the data layer to handle data retrieval and storage. You can use "dio" for API calls and "hive" for local data storage as per the project setup.
5. Build the presentation layer using the provided ViewModels, routes, screens, and widgets. Customize the UI and handle user interactions as required.
6. The "core" folder contains common utilities that can be used across different features of the application. Feel free to add or modify as per your needs.
7. For dependency injection, use "get_it" to register and manage dependencies across the application.

Remember to use the provided packages and architecture guidelines to ensure a scalable and maintainable Flutter application.

Happy coding! 🚀
