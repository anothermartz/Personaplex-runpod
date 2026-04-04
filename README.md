# Automated [PersonaPlex](https://github.com/NVIDIA/personaplex) setup for RunPod

### Pre-requisites:
A free huggingface account: https://huggingface.co <br>
A RunPod account: https://www.runpod.io/ <br>
(minimum credits amount is $10, but you can put this towards any AI template so have a look around!) 

## 🚀 How to Deploy

https://console.runpod.io/user/storage/create

The easiest way to run this is using the pre-configured RunPod template:

### [➡️ Click here to Deploy on RunPod](https://www.runpod.io/console/deploy?template=q2892w1ybr&ref=4x7tlpte)

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
