#!/bin/bash

if ! command -v conda >/dev/null 2>&1; then
    echo "Conda is not installed."
    echo "For Mac/PC: The Anaconda website provides install intructions"
    echo "For an headless machine:\n"
    echo "  Get the full distrubtion link at https://repo.anaconda.com/archive/"
    echo "  Download the file: wget https://repo.anaconda.com/archive/___link_endpoint_here___"
    echo "  install with executable"
    echo "  activate conda with: source ~/anaconda3/bin/activate base"
    echo "  "
    echo "Exiting"
    exit 1
fi

# Prompt the user for a number
read -p "Please enter a version number: " number
# Example shell command that uses the number
echo "You entered: $number"
conda create -name hab-0_3_2-v"$number" python=3.9 cmake -c conda-forge
conda activate hab-0_3_2-v"$number"

git clone --branch stable https://github.com/facebookresearch/habitat-lab.git
git clone --branch stable https://github.com/facebookresearch/habitat-sim.git
cd habitat-sim
pip install -r requirements.txt

# Prompt the user for operating system selection
echo "Select your operating system:"
echo "1) Mac (ARM)"
echo "2) Linux"
read -p "Enter the number corresponding to your choice: " os_choice

# Check the user's choice and execute accordingly
if [ "$os_choice" -eq 1 ]; then
    echo "You selected Mac (ARM). Running Mac-specific commands..."
    python setup.py install --bullet
    
    # (maybe) conda install -c conda-forge assimp
    # (maybe) git clone https://github.com/assimp/assimp src/deps/assimp
    # echo -e "\n\n(For Mac) \n\n sudo xcode-select --reset\nrm -rf build && mkdir build\nvim src/deps/corrade/src/Corrade/Utility/StlForwardTuple.h +59\n#include <tuple>"
    # sleep 5m

elif [ "$os_choice" -eq 2 ]; then
    echo "You selected Linux. Running Linux-specific commands..."
    
    sudo apt-get install libx11-dev
    sudo apt-get install -y libgl1-mesa-dev libglu1-mesa-dev
    conda install habitat-sim withbullet headless -c conda-forge -c aihabitat

    # Ask if the user wants to set up Remote Desktop on a Debian/Ubuntu VM
    read -p "If you are using a Linux VM with Debian/Ubuntu.\n   Would you like the option to set up Remote Desktop access? (y/n): " remote_choice
    if [ "$remote_choice" = "y" ] || [ "$remote_choice" = "Y" ]; then
        echo "Setting up Remote Desktop access..."
        # Commands for setting up Remote Desktop on Debian/Ubuntu here
        echo "Instruction Source: https://learn.microsoft.com/en-ca/azure/virtual-machines/linux/use-remote-desktop?tabs=azure-cli"
        sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xfce4
        sudo apt install xfce4-session
        sudo apt-get -y install xrdp
        sudo systemctl enable xrdp
        sudo adduser xrdp ssl-cert
        echo xfce4-session >~/.xsession
        sudo systemctl restart xrdp
        sudo ufw allow 3389
        echo "\n\n\n MAKE SURE THE VM HAS THE PORTS OPEN \n     (ie. setting this in azure or aws portal) \n\n"
        echo "RUN: sudo passwd YOUR_VM_USER_NAME"
    fi
else
    echo "Invalid choice. Please run the script again and select 1 or 2."
fi

cd ../habitat-lab
pip install -e habitat-lab
echo "Checking Install"
python -c "import habitat"
python -c "import habitat_sim"

# Ask if the user wants to download the hm3d dataset
read -p "Would you like to download the hm3d dataset? (y/n): " download_choice

# If they choose to download, prompt for username and password
if [ "$download_choice" = "y" ] || [ "$download_choice" = "Y" ]; then
    read -p "Enter your username: " username
    read -sp "Enter your password: " password  # -s flag hides password input
    echo
    echo "Downloading the hm3d dataset..."
    mkdir data
    python -m habitat_sim.utils.datasets_download --username $username --password $password  --uids hm3d --data-path data
fi

