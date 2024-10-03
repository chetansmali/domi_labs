# Google Maps Assignment

This project is a Flutter-based application that demonstrates the use of Google Maps API with proper state management, clean architecture, and modern Flutter libraries. The goal of the app is to integrate Google Maps functionality, manage user data, and handle API interactions using best practices.

## Project Overview

This project follows clean architecture principles, dividing the app into distinct layers for better scalability and maintainability. The architecture is split into three key layers:

1. **Data Layer**: This layer is responsible for fetching and storing data. It communicates with external APIs using the `dio` package and stores data locally using `Hive`. This layer also handles the retrieval of tokens and user data for persistent sessions.

2. **Domain Layer**: The domain layer contains the business logic and entities of the application. It acts as the core of the app, where the core functionalities, such as use cases, are implemented. It’s designed to be platform-agnostic and independent of any external frameworks or libraries.

3. **Presentation Layer**: This layer manages the UI and the state of the application. The `Bloc` package is used for managing the app's state, ensuring that the user interface reacts efficiently to changes in the underlying data.

---

### Key Libraries and Tools Used

- **BLoC (Business Logic Component)**:  
  The `Bloc` pattern is used for state management to ensure a reactive user interface and separation of concerns between the UI and business logic. The app has multiple `Blocs` that manage the state for different features, such as user authentication, map rendering, and API interaction.

- **Clean Architecture**:  
  Clean architecture helps structure the code into layers, making the codebase more modular and testable. The app is divided into the following layers:
    - **Data Layer**: Manages API calls using `dio` and local data using `Hive`.
    - **Domain Layer**: Contains core business logic and use cases.
    - **Presentation Layer**: Responsible for the UI and using `Bloc` to handle state management.

- **Dio**:  
  The `dio` package is used for making network requests and handling API communication. It simplifies the process of making HTTP requests and provides advanced features like interceptors, request cancellation, and response transformation.

- **Hive & flutter_hive**:  
  The app uses `Hive` as a lightweight, fast, NoSQL database for storing user data and tokens locally. `flutter_hive` enables seamless integration between the Flutter app and Hive, ensuring persistence across app sessions.

- **GetIt**:  
  `GetIt` is a simple yet powerful service locator used to manage dependencies within the app. By using `GetIt`, we avoid tight coupling between different classes and ensure that services like API clients, repositories, and Blocs are efficiently managed.

- **Equatable**:  
  The `Equatable` package is used to simplify value comparison in Dart, particularly within `Bloc` states. It allows for cleaner and more efficient comparisons of state changes by overriding the `==` operator in a lightweight way.

- **Injectable**:  
  `Injectable` is used alongside `GetIt` to manage dependency injection in a clean and automated manner. It simplifies the registration of dependencies and ensures that our app’s services are properly injected where needed without excessive boilerplate.

---

### Features

- **Google Maps Integration**:  
  The app integrates Google Maps, allowing users to view maps, track their location, and search for places.

- **State Management (Bloc)**:  
  Bloc is used to manage the app's state, ensuring that data and UI remain in sync at all times.

- **API Integration (Dio)**:  
  External API calls for fetching user-specific data and Google Maps data are managed by `dio` in a clean and efficient manner.

- **Local Storage (Hive)**:  
  User data, such as tokens and preferences, are stored locally using Hive, providing persistence even when the app is closed.

- **Dependency Injection (GetIt + Injectable)**:  
  `GetIt` and `Injectable` are used for dependency management, ensuring that services are decoupled and easily testable.

---
### Folder Structure

    **lib/
    ├── data/
    │   ├── repositories/    # Data repositories
    │   ├── models/          # Models
    │   └── datasources/     # Remote and local data sources
    ├── domain/
    │   ├── entities/        # Core business entities
    │   ├── repositories/    # Domain repositories
    │   └── usecases/        # Business logic and use cases
    ├── presentation/
    │   ├── blocs/           # Bloc state management
    │   ├── routes/          # Routes
    │   └── screens/         # UI components
    └── main.dart            # App entry point **


### How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/google-maps-assignment.git
   
    flutter pub get
   
    dart run build_runner build
   
    flutter run
