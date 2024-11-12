# Habitat-Automated-Setup (WIP)
A simple script to automate the setup process of Habitat AI 

### Supports
 - [Habitat-Lab Stable Release](https://github.com/facebookresearch/habitat-lab/releases/tag/stable)
 - [Habitat-Sim Stable Release](https://github.com/facebookresearch/habitat-sim/releases/tag/stable)
 - [Habitat Dataset: HM3D (Full)](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md#habitat-matterport-3d-research-dataset-hm3d)

### Do Not Support
 - All the [Dataset Option](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md)
 - [Episode Datasets](https://github.com/facebookresearch/habitat-lab/blob/main/DATASETS.md)
 - `--CUDA` param

### Warning
 - The script fails for me, however even in failure is a concise way to access all the needed commands. 
 - The script does not use the CUDA flag yet  
 - If the install fails, you will need to comment out (`#`) sections of the script to re-run (ie. conda create, git clone)
 - Mac specific issues are addressed in comments in the script.

### Setup
Reguires a Posix terminal (Bash, Zsh etc).  
Turn the script into an executable
  ```
  chmod +x setup.sh
  ```
### Run: 
  ```
  ./setup.sh
  ```
### Notes
 - The conda env name has `v#` in the name because I like to number my environments because I find I often corrupt them. 
 - ChatGPT helped with creating some of the bash commands and comments. 
