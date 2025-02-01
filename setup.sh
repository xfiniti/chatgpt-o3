#!/bin/bash
# One-Shot Script to Create Missing Git Files and Push Them to the Remote Repository
# This script must be executed from the root directory of your git repository.

set -e  # Exit immediately if a command fails

echo "Checking if this is a Git repository..."
if [ ! -d ".git" ]; then
    echo "Error: This directory is not a Git repository. Please navigate to your repository root."
    exit 1
fi

# Create main.py if it doesn't exist (or overwrite it; remove the redirection operator '>' if you prefer not to overwrite)
echo "Creating main.py..."
cat > main.py << 'EOF'
#!/usr/bin/env python3
"""
ChatGPT O3 Model Entry Point
"""

def main():
    print("Welcome to ChatGPT O3!")

if __name__ == "__main__":
    main()
EOF

# Optionally, make main.py executable
chmod +x main.py

# Create .gitignore to exclude virtual environment and cache files
echo "Creating .gitignore..."
cat > .gitignore << 'EOF'
# Ignore the virtual environment folder
venv/

# Ignore Python cache files
__pycache__/
*.pyc
EOF

# Stage the new files
echo "Adding main.py and .gitignore to Git..."
git add main.py .gitignore

# Commit the changes
echo "Committing changes..."
git commit -m "Add main entry point and .gitignore"

# Push the commit to the remote repository
echo "Pushing changes to remote repository..."
git push origin main

echo "Repository updated successfully."

