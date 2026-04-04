# PersonaPlex RunPod One-Click

A hardened, architecture-aware startup script for deploying [NVIDIA PersonaPlex](https://github.com/NVIDIA/personaplex) on RunPod.

This script automates the environment setup, handles Blackwell-specific driver requirements (Compute 12.0), and ensures persistence across pod restarts.

## 🚀 How to Deploy

The easiest way to run this is using the pre-configured RunPod template:

### [➡️ Click here to Deploy on RunPod](https://www.runpod.io/console/deploy?template=YOUR_TEMPLATE_ID_HERE)

> **Important:** Once you click deploy, you **must** click **"Edit Template"** and enter your Hugging Face "Read" Token into the `HF_TOKEN` Environment Variable field.

## ✨ Features
* **Blackwell Optimized:** Automatically detects and installs PyTorch Nightly for RTX 4500 PRO and other Blackwell GPUs.
* **Fresh Drive Support:** Automatically clones repositories and builds virtual environments if the network volume is empty.
* **Persistent Storage:** Installs all models (16GB) and environments to `/workspace` to survive pod termination/restarts.
* **Architecture Aware:** Switches between `venv_blackwell` and `venv_standard` automatically based on the GPU you rent.

## 🛠️ Technical Details

This repository hosts the `autostart.sh` script used by the RunPod template. It performs the following on boot:
1. Validates the `HF_TOKEN`.
2. Checks for existing files in `/workspace`.
3. Detects GPU Compute Capability.
4. Initializes the correct Python virtual environment.
5. Launches the PersonaPlex server on port `8998`.

## ⚖️ Credits
This is a community-maintained startup wrapper for [NVIDIA PersonaPlex](https://github.com/NVIDIA/personaplex).
