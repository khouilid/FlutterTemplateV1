import os
import sys
import argparse
from utils import create_directory_structure
from content.application_content import generate_application_files
from content.application_offline_content import generate_application_offline_files
from content.domain_content import generate_domain_files
from content.infrastructure_content import generate_infrastructure_files
from content.infrastructure_offline_content import generate_infrastructure_offline_files
from content.presentation_content import generate_presentation_files
from content.shared_content import generate_shared_files
from content.shared_offline_content import generate_shared_offline_files
from content.test_content import generate_test_files 

# Mapping single-letter inputs to full directory names
DIRECTORY_MAPPING = {
    'a': 'application',
    'd': 'domain',
    'i': 'infrastructure',
    'p': 'presentation',
    's': 'shared',
    't': 'test'  
}

# Initialize the DIRECTORIES dictionary
def initialize_directories(use_offline):
    if use_offline:
        return {
            'application': generate_application_offline_files,
            'domain': generate_domain_files,
            'infrastructure': generate_infrastructure_offline_files,
            'presentation': generate_presentation_files,
            'shared': generate_shared_offline_files,
            'test': generate_test_files 
        }
    else:
        return {
            'application': generate_application_files,
            'domain': generate_domain_files,
            'infrastructure': generate_infrastructure_files,
            'presentation': generate_presentation_files,
            'shared': generate_shared_files,
            'test': generate_test_files 
        }

def prompt_user(directory):
    while True:
        response = input(f"Directory '{directory}' already exists. Do you want to create files in it? (y/n): ").lower()
        if response in ['y', 'n']:
            return response == 'y'
        else:
            print("Please enter 'y' or 'n'.")

def main():
    parser = argparse.ArgumentParser(description="Generate feature files")
    parser.add_argument("feature_name", help="Name of the feature")
    
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--remove", nargs='+', choices=DIRECTORY_MAPPING.keys(), help="Create all directories except specified ones")
    group.add_argument("--only", nargs='+', choices=DIRECTORY_MAPPING.keys(), help="Create only specified directories")
    parser.add_argument("--offline", action='store_true', help="Use offline file generators")

    args = parser.parse_args()

    feature_name = args.feature_name
    mobile_app_path = os.path.join(os.path.dirname(__file__), '../lib/')

    if not os.path.exists(mobile_app_path):
        print(f"Mobile app path does not exist: {mobile_app_path}")
        sys.exit(1)
    
    os.chdir(mobile_app_path)
    parent_dir = feature_name

    if not os.path.exists(parent_dir):
        create_directory_structure(parent_dir)
    else:
        print(f"Feature {feature_name} already exists.")
    
    # Select the appropriate directory functions based on the offline flag
    DIRECTORIES = initialize_directories(args.offline)

    directories_to_create = []

    if args.remove:
        for key in DIRECTORY_MAPPING:
            if key not in args.remove:
                directories_to_create.append(DIRECTORY_MAPPING[key])
    elif args.only:
        directories_to_create = [DIRECTORY_MAPPING[key] for key in args.only]
    else:
        directories_to_create = DIRECTORY_MAPPING.values()

    for dir_name in directories_to_create:
        dir_path = os.path.join(parent_dir, dir_name)
        if os.path.exists(dir_path):
            if prompt_user(dir_path):
                DIRECTORIES[dir_name](parent_dir)
        else:
            os.makedirs(dir_path, exist_ok=True)
            DIRECTORIES[dir_name](parent_dir)

    os.chdir(os.path.join(mobile_app_path, '../'))
    os.system("flutter pub run build_runner build -d")
    os.system("flutter pub get")
    print("Mobile app structure and files created successfully.")

    

if __name__ == "__main__":
    main()
