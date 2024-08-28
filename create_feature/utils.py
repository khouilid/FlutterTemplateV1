import os

def create_directory_structure(parent_dir):
    if not os.path.exists(parent_dir):
        os.mkdir(parent_dir)

    subdirs = ["application" , "domain", "infrastructure", "presentation", "shared"]
    for subdir in subdirs:
        dir_path = os.path.join(parent_dir, subdir)
        os.makedirs(dir_path, exist_ok=True)

def create_file(directory, prefix, suffix, content):
    file_name = f"{prefix.lower()}{suffix}"
    file_path = os.path.join(directory, file_name)
    with open(file_path, "w") as file:
        file.write(content)

def write_file(directory, filename, content):
    os.makedirs(directory, exist_ok=True)
    with open(os.path.join(directory, filename), 'w') as file:
        file.write(content)
