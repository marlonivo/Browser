# Makefile für das unifox.js Projekt

# Ziel: alles
all: setup

# Ziel: setup
setup:
    git clone https://github.com/your/repository.git
    cd repository
    chmod +x install.sh
    ./install.sh

@echo "Setup completed."
