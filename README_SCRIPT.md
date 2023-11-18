
#  Feature Creation Script
This script automates the creation of a basic directory structure and files for a Flutter feature. It sets up directories for different layers of a typical Flutter project and generates files such as states, notifiers, remote data sources, and repositories.


## Usage

python create_feature.py <dirctory_name> <feature_name>

- <dirctory_name>: The name of the feature folder.
- <feature_name>: The name of the parent directory for the feature.


## Example

```bash
python create_feature.py / feature_parent

```

This will create the following directory structure and files:


```bash

./lib/feature_parent/
│
├── application/
│   ├── feature_parent_states.dart
│   └── feature_parent_notifire.dart
│
├── infrastructure/
│   ├── feature_parent_remote_datasource.dart
│   └── feature_parent_repository.dart
│
├── presentation/
│   └── feature_parent_page.dart
│
├── shared/
│   └── feature_parent_providers.dart
│
└── domain/.

```

# Generated Files

## Application 

- application/feature_parent_states.dart
- application/feature_parent_notifire.dart


## infrastructure

- infrastructure/feature_parent_remote_datasource.dart
- infrastructure/feature_parent_repository.dart



## shared
- shared/feature_parent_providers.dart


## presentation
- presentation/feature_parent_page.dart




## Build
After running the script, execute the following command to generate the necessary code:


```bash
flutter pub run build_runner build -d

```
