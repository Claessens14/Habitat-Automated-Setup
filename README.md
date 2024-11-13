# Habitat-Automated-Setup (WIP)
A simple script to automate the setup process of Habitat AI 

### Supports
 - [Habitat-Lab Stable Release](https://github.com/facebookresearch/habitat-lab/releases/tag/stable)
 - [Habitat-Sim Stable Release](https://github.com/facebookresearch/habitat-sim/releases/tag/stable)
 - [Habitat Dataset: HM3D (Full)](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md#habitat-matterport-3d-research-dataset-hm3d)

### Does Not Support
 - All the [Dataset Options](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md)
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
 - Useful to note: [Habitat Config keys](https://github.com/facebookresearch/habitat-lab/blob/stable/habitat-lab/habitat/config/CONFIG_KEYS.md) and [Config Information](https://github.com/facebookresearch/habitat-lab/blob/stable/habitat-lab/habitat/config/README.md)

### Useful Links
 - [SLURM Integration](python -u -m habitat_baselines.run --config-name=config.yaml  \
hydra/launcher=submitit_slurm --multirun)
 - [CPP API Docs](https://aihabitat.org/docs/habitat-sim/cpp.html)
 - [Examples: Habitat Gym, incorporating baselines, visualization](https://github.com/facebookresearch/habitat-lab/tree/stable/examples/tutorials/notebooks)
