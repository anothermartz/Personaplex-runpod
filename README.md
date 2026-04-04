# Automated [PersonaPlex](https://github.com/NVIDIA/personaplex) setup for RunPod

## 📋 Pre-requisites:
1. **Hugging Face Account:** Create a free account at [huggingface.co](https://huggingface.co).
2. **License Agreement:** You must accept the terms on [NVIDIA's PersonaPlex page](https://huggingface.co/nvidia/personaplex-7b-v1).
3. **Generate an HF Token:** Go to your [Hugging Face Token Settings](https://huggingface.co/settings/tokens/new?tokenType=read), create a "Read" token, and copy the `hf_...` string.
4. **RunPod Account:** Create an account at [RunPod.io](https://www.runpod.io/).
5. **Add Funds:** Add minimum credits to RunPod ($10 minimum, but this covers all templates such as image and video generation).
6. **Set up your RunPod Secret:** Create a [RunPod Secret](https://www.console.runpod.io/user/secrets/create)
   * **Key:** `HF_TOKEN`
   * **Value:** *(Paste your Hugging Face token here)*

## 🚀 How to Deploy
1. Click this one-click link: **[Deploy PersonaPlex Template](https://www.runpod.io/console/deploy?template=q2892w1ybr&ref=4x7tlpte)**
2. Select your GPU. **Make sure to pick a datacenter close to you (e.g., US, EU, CA) for the lowest voice latency!** Recommended GPUs:
   * **RTX 3090 or 4090:** Best balance of extreme speed and cheap hourly price.
   * **RTX 4500 PRO (Blackwell) / L40 / A5000:** Excellent enterprise alternatives.
   *(Note: Any GPU with 16GB+ VRAM will work).*
3. In Storage Configuration, Select "Volume Disk" and make sure it's 40GB.
4. Scroll to the bottom and click **Deploy On-Demand**. 
5. Look at the "Connect" Tab and wait for "Port 8998 PersonaPlex" to be green, then click on it.


> ⏳ **Initial Setup Time:** The very first time you boot the pod, it will take about **15 minutes** to download the 16GB AI model. Check the pod's "Logs" tab to see when it says "Launching PersonaPlex". If you just "Stop" the pod when you are done playing, it will boot instantly the next time!


> ⚠️ **Billing Warning: Stop vs. Terminate**
> * **Stopping** the pod pauses the expensive GPU charges, but you will still be charged a few cents a day for the 40GB storage drive holding your model.
> * **Terminating** the pod deletes the drive and stops **all** charges completely. If you are done playing for a while and don't mind waiting 15 minutes to redownload the model next time, always choose Terminate!
