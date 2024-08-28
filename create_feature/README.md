# Feature Generator Script

This script is designed to automate the creation of feature files and directories for a Flutter mobile application. It helps streamline the process of setting up a new feature by generating the necessary files for various architectural layers like application, domain, infrastructure, presentation, shared, and test. The script also includes an option to use offline file generators for scenarios where internet access is restricted.

## Table of Contents

- [Requirements](#requirements)
- [Project Structure](#project-structure)
- [Module Structure](#module-structure)
- [How Module Works](#how-module-works)
  - [Presentation Layer](#1-presentation-layer)
  - [Application Layer](#2-application-layer)
  - [Infrastructure Layer](#3-infrastructure-layer)
  - [Domain Layer](#4-domain-layer)
  - [Shared Layer](#5-shared-layer)
- [Script Generating](#script-generating)
  - [1- Installation](#1-installation)
  - [2- Usage](#2-usage)
    - [Positional Arguments](#positional-arguments)
    - [Optional Arguments](#optional-arguments)
  - [3- Examples](#3-examples)
  - [4- How It Works](#4-how-it-works)
  - [5- Notes](#5-notes)
- [License](#license)

## Requirements

- Python 3.6+
- Flutter installed and configured on your system.
- knowledge about Flutter [Doc](https://docs.flutter.dev/)
- knowledge about Reiverpod state management [Doc](https://riverpod.dev/)

## Project Structure

This document provides an overview of the project structure, detailing the purpose and content of each directory and its subdirectories. This structure is typical for a Flutter or cross-platform mobile application that targets both Android and iOS platforms, and includes various assets, configurations, and modules.

```bash

    ├── /android
    │   │
    │   └───> android files configration
    │
    ├── /assets
    │   │
    │   ├─── /fonts/
    │   │
    │   ├─── /images/
    │   │
    │   ├─── /icons/
    │   │
    │   └─── /i18n/
    │
    ├── /keystore
    │   │
    │   └──/upload
    │       │
    │       │─── upload_certificate.pem
    │       │
    │       └─── upload-keystore.jks
    │
    ├── /ios
    │   │
    │   └───> IOS files configration
    │
    ├── /lib
    │   │
    │   ├─── /core/
    │   │     │
    │   │     │─── /config/
    │   │     │
    │   │     │─── /utils/
    │   │     │
    │   │     │─── /widgets/
    │   │     │
    │   │     └─── /presentation/
    │   │           │
    │   │           ├─── /managers/
    │   │           │
    │   │           │─── /routes/
    │   │           │
    │   │           └─── theme.dart
    │   │
    │   ├─── /theme/
    │   │     │
    │   │     │─── application.dart
    │   │     └─── theme.dart
    │   │
    │   │─── /gen
    │   │     │
    │   │     │─── assets.gen.dart
    │   │     └─── fonts.gen.dart
    │   │
    │   │
    │   │─── /incident/
    │   │
    │   │─── /...modules
    │   │
    │   │
    │   └─── main.dart
    │
    └──────>
```

## Module Structure

```bash
    ├── /lib
    │   │
    │   └ /module/
    │      │
    │      │
    │      │───/application  #go to application explain for more details
    │      │    │
    │      │    │─── module_notifier.dart
    │      │    │
    │      │    └─── module_states.dart
    │      │
    │      │───/domain/  #go to domain explain for more details
    │      │    │
    │      │    └─── module_domain.dart
    │      │
    │      │───/infrastructure/  #go to infrastructure explain for more details
    │      │    │
    │      │    │─── /dtos/
    │      │    │
    │      │    │─── /remote/
    │      │    │
    │      │    │─── /local/
    │      │    │
    │      │    └─── /repository/
    │      │
    │      │───/presentation/  #go to presentation explain for more details
    │      │    │
    │      │    ├─── /widgets/
    │      │    │
    │      │    └─── module_page.dart
    │      │
    │      └──/shared/ #go to shared explain for more details
    │             │
    │             └─── /module_providers.dart
    │
    └──────>
```

## How Module Works

This structured approach helps in understanding how each layer interacts and how data flows through the module, from the user interface down to the core logic and back. Each layer has a distinct role, contributing to a modular and maintainable codebase.

To understand how each element of a module functions, we’ll explore two use cases: one starting from the top of the structure and the other from the bottom. This approach helps us understand how the elements interact in both directions. For this example, we’ll retrieve some data from an API, beginning with the user interface, or what we call the “presentation” layer.

### 1 Presentation Layer

![alt text](https://miro.medium.com/v2/resize%3Afit%3A720/format%3Awebp/1%2AkOko60IS_A-C73hDLgFmIQ.png)

The presentation layer typically contains the main screens of a module, such as profile_page.dart or settings_page.dart. These files are named after the module and end with **Page** to assist in routing within the application (e.g., ProfilePage, SettingsPage). At the top of these files, you’ll find the **@RoutePage()** annotation, which further aids in routing.

### 2 Application Layer

The application layer plays a central role in managing the state within the module. This directory typically contains two essential files: a notifier and a state file, usually prefixed with the module’s name (e.g., profile_notifier.dart, settings_states.dart).

1.  #### **Notifier:**

    The notifier contains functions that trigger state changes in response to external inputs, such as API calls or local storage operations. For example, if you need to fetch data from an API, the notifier would include the function to initiate this process.

2.  #### **States:**
    The state file defines the various states and listeners that can be used to manage actions within the module. For instance, when retrieving data from an API, you might have a loading state to display a loading indicator to the user, and another state to display the data once it’s been retrieved.

### 3 Infrastructure Layer

![alt text](https://miro.medium.com/v2/resize%3Afit%3A720/format%3Awebp/1%2AbN9Vo4HZVK1k5VH8wT45dg.png)

The infrastructure layer is the core logic of the module. It typically includes the repository, remote and local data sources, DTOs, and possibly ISAR objects.

1.  #### **Repository:**

    The repository is central to the module’s logic, containing and injecting elements from other modules or data sources (both remote and local). It includes functions that are called by the module’s notifier, such as GetUserInfo.

2.  #### **Remote:**

    The remote data source handles all interactions with external HTTP requests or APIs, containing the functions needed for these operations within the module.

3.  #### **Local:**
    The local data source manages data stored on the device, such as in a local database.
4.  #### **Dto:**

    DTOs are simple objects used to transfer data between the remote/local data sources and the domain layer of the application.

5.  #### **Isar:**
    ISAR objects are also used to transfer data, particularly from local data sources.

### 4 Domain Layer

The domain layer consists of data objects or entities that are used throughout the application.

### 5 Shared Layer

The shared layer includes the injection providers for notifiers, repositories, and data sources (both remote and local). This ensures that these elements are available for use across the entire application.

# Script Generating

## 1 Installation

1. **Clone the Repository:**
   Clone the repository containing this script to your local machine.

   ```bash
       git clone <repository-url>
       cd <repository-directory>
   ```

2. Ensure Dependencies:
   Ensure all necessary Python dependencies and Flutter tools are installed on your system. 3. Project Structure:
   Make sure that the script is placed inside your project structure where the lib directory is two levels up from the script’s location.

## 2 Usage

Run the script from the command line by navigating to the directory where the script is located and executing it with the appropriate arguments.

## positional-arguments

    •	feature_name: (Required) The name of the feature you want to create. This will be the root directory for all generated files.

## Optional-arguments

    •	a: Application
    •	d: Domain
    •	i: Infrastructure
    •	p: Presentation
    •	s: Shared
    •	t: Test
    •	--remove: Specify one or more directories to exclude from generation
    •	--only: Specify one or more directories to include in generation. Choices are the same as in --remove.
    •	--offline: Use offline file generators instead of the default ones.

## 3 Examples

1. Generate all directories for a new feature:

```bash
python generate_feature.py user_profile
```

This will create the following directories and their associated files:

        • application/
        • domain/
        • infrastructure/
        • presentation/
        • shared/
        • test/

2. Generate all directories except the test directory:

```bash
python generate_feature.py user_profile --remove t
```

This will create all directories and files except for the test/ directory.

3. Generate only the application and domain directories:

```bash
python generate_feature.py user_profile --only a d
```

This will create only the application/ and domain/ directories and their associated files.

4. Generate feature files using offline generators:

```bash
python generate_feature.py user_profile --offline
```

This will generate the files using the offline content generators.

## 4 How It Works

    1.	Directory Structure Setup: The script first checks if the lib directory exists two levels up from the script’s location. If not, it will exit with an error message.
    2.	Feature Directory Creation: If the feature directory does not exist, it creates the directory and proceeds with generating the subdirectories (application, domain, etc.) and their associated files.
    3.	Directory and File Generation: Based on the provided arguments (--only, --remove, and --offline), the script selectively generates the required directories and files using the corresponding file generators.
    4.	Build Runner Execution: After generating the files, the script runs the Flutter build_runner command to ensure all generated files are up to date.

## 5 Notes

    •	The script assumes that the lib directory is located two levels up from the script’s location. If this is not the case, adjust the mobile_app_path variable accordingly.
    •	The script automatically runs the Flutter build_runner command after generating the feature files to ensure all generated files are up to date.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
This `README.md` file now includes all the essential sections, such as detailed usage instructions, examples, and an explanation of how the script works. You can directly use this file in your project.
