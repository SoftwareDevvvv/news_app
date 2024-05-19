# Flutter News App (DEMO)

## Overview
The Flutter News App is a mobile application designed to deliver the latest news headlines across various categories including general, health, sports, business, and science. Users can browse through top headline articles, read detailed news stories, and stay informed about current events.

## Features
1. **Top Headline Articles**: Display top headline articles from different categories.
2. **Category Navigation**: Navigate through different news categories including general, health, sports, business, and science.
3. **Authentication**:
   - Login: Users can log in to their accounts to personalize their news feed.
   - Signup: New users can create accounts to access app features.
  

## Architecture
The Flutter News App follows a clean architecture pattern, separating concerns into distinct layers to ensure modularity, scalability, and maintainability.
- **Presentation Layer**:
  - UI components and widgets.
- **Business Logic Layer (BLoC)**:
  - Contains business logic components responsible for managing application state and data flow.
  - Implements BLoC pattern for reactive programming and separation of concerns.
- **Data Layer**:
  - Repository to fetch data from remote APIs.
  

## Technologies Used
- **Flutter**: Framework for building cross-platform mobile applications.
- **Dart**: Programming language for Flutter development.
- **BLoC Pattern**: Business Logic Component pattern for state management.
- **HTTP Client**: Used for making network requests to fetch news articles.

## Getting Started
To run the Flutter News App locally, follow these steps:
1. Clone the repository from GitHub.
2. Install dependencies using `flutter pub get`.
3. Run the app on an emulator or physical device using `flutter run`.


## License
This project is licensed under the [MIT License](LICENSE).
