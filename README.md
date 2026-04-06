# Automated [PersonaPlex](https://github.com/NVIDIA/personaplex) setup for RunPod
Based on https://github.com/surebabu2007/Personaplex-oneclicker

## 📋 Pre-requisites (one time only):
1. **Hugging Face Account:** Create a free account at [huggingface.co](https://huggingface.co).
2. **License Agreement:** You must accept the terms on [NVIDIA's PersonaPlex page](https://huggingface.co/nvidia/personaplex-7b-v1).
3. **Generate an HF Token:** Go to your [Hugging Face Token Settings](https://huggingface.co/settings/tokens/new?tokenType=read), create a "Read" token, and copy the `hf_...` string.
4. **RunPod Account:** Create an account at [RunPod.io](https://www.runpod.io/).
5. **RunPod Credits:** $10 minimum to add, you'll unlikely spend it all on PersonaPlex but you can also spend it on all templates on the site such as the ones for image and video generation.
6. **Set up your RunPod Secret:** Create a [RunPod Secret](https://console.runpod.io/user/secrets/create)
   * **Key:** `HF_TOKEN`
   * **Value:** *(Paste your Hugging Face token here)*

## 🚀 How to Deploy
1. Click this one-click link: **[Deploy PersonaPlex Template](https://www.runpod.io/console/deploy?template=q2892w1ybr&ref=4x7tlpte)**
2. Click the "Any Region" drop-down and select yours, then select a GPU: <br>
*(⚠️ NOTE: You MUST select a GPU with at least **20GB** of VRAM or it will crash with an Out of Memory error!)* <br> <br>
<ins>**Recommended GPUs:**</ins>
   * **RTX 3090 / RTX A6000 / RTX PRO 4500 / RTX 4090:** Best balance of speed and price.
   * **RTX A4500 / RTX A5000 / RTX 4000 Ada:** Budget options. They work, but the AI may have slightly slower response times or long silences.
   * **RTX 5090 /  Other expensive GPUs:** They'll work great but are completely overkill, only use if availability calls for it. <br> <br>
   
3. In **Storage Configuration**, Make sure "Volume Disk" is selected.
4. Scroll to the bottom and click **Deploy On-Demand**. 
5. Look at the "Connect" Tab and wait about 5 minutes for "Port 8998 PersonaPlex" to be green, then click on it. If there's a Cloudflare error, check the "Logs" tab for errors.

> ⏳ **Setup Time:** It will take about **5 minutes** to get running as it needs to download a bunch of dependencies, about 16GB of models and get everything loaded.
> Check the pod's "Logs" tab; Wait for it to say `__main__ - INFO - Access the Web UI directly at [IP]` But that IP won't work, instead go to the "Connect" tab.

> ⚠️ **Billing Warning: Make sure you Stop and Terminate your pod when done!**
> * **Stopping** the pod pauses the expensive GPU charges, but you will still be charged about 24 cents a day for the 40GB storage drive holding your model.
> * **Terminating** the pod deletes the drive and stops **all** charges completely.
