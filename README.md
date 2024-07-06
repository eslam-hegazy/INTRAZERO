
# Task INTRAZERO

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Application structure

After successful build, your application structure should look like this:
```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── Features
    │   └── Home
    |        ├── data
    |        |     ├── data_source
    |        |     ├── models
    |        |     └── repository
    |        |
    |        ├── domain
    |        |     ├── entities
    |        |     ├── repository
    |        |     └── usecases
    |        |       
    |        └── presentation
    |              ├── screens
    |              ├── controllers
    |              └── widgets
```
