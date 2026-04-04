# Automated [PersonaPlex](https://github.com/NVIDIA/personaplex) setup for RunPod

## 📋 Pre-requisites:
1. **Hugging Face Account:** Create a free account at [huggingface.co](https://huggingface.co).
2. **License Agreement:** You must accept the terms on [NVIDIA's PersonaPlex page](https://huggingface.co/nvidia/personaplex-7b-v1).
3. **Generate an HF Token:** Go to your [Hugging Face Token Settings](https://huggingface.co/settings/tokens/new?tokenType=read), create a "Read" token, and copy the `hf_...` string.
4. **RunPod Account:** Create an account at [RunPod.io](https://www.runpod.io/).
5. **Add Funds:** Add minimum credits to RunPod ($10 minimum, but this covers all templates such as image and video generation).
6. **Set up your RunPod Secret:** Create a [RunPod Secret](https://console.runpod.io/user/secrets/create)
   * **Key:** `HF_TOKEN`
   * **Value:** *(Paste your Hugging Face token here)*

## 🚀 How to Deploy
1. Click this one-click link: **[Deploy PersonaPlex Template](https://www.runpod.io/console/deploy?template=q2892w1ybr&ref=4x7tlpte)**
2. Select your GPU. **Make sure to pick a datacenter close to you (e.g., US, EU, CA) for the lowest voice latency!** <br>
<ins>Recommended GPUs:</ins>
   * **RTX 3090 / PRO 4500 / 4090:** The sweet spot. Best balance of extreme speed and price for real-time conversation.
   * **RTX A4500 / A5000 / RTX 4000 Ada:** Budget options. They work, but the AI may have slightly slower response times or silent pauses.
   * **RTX 5090 /  Other expensive GPU's:** They'll work great but are completely overkill. <br>
   *(⚠️ NOTE: You MUST select a GPU with at least **20GB** of VRAM. 16GB cards like the A4000 or 2000 Ada will crash with an Out of Memory error!)*
3. In Storage Configuration, Select "Volume Disk" and make sure it's 40GB.
4. Scroll to the bottom and click **Deploy On-Demand**. 
5. Look at the "Connect" Tab and wait for "Port 8998 PersonaPlex" to be green, then click on it. If there's a Cloudflare error, check the "Logs" tab for errors.

> ⏳ **Initial Setup Time:** The very first time you boot the pod, it will take about **15 minutes** to download the 16GB AI model. Check the pod's "Logs" tab; if it says `- __main__ - INFO - loading moshi` - it is downloading the models! Wait for it to say "- __main__ - INFO - Access the Web UI directly at [IP]" But that IP won't work, instead go to the "Connect" tab. If you just "Stop" the pod when you are done playing, it will not need to redownload the models the next time!

> ⚠️ **Billing Warning: Stop vs. Terminate**
> * **Stopping** the pod pauses the expensive GPU charges, but you will still be charged a few cents a day for the 40GB storage drive holding your model.
> * **Terminating** the pod deletes the drive and stops **all** charges completely. If you are done playing for a while and don't mind waiting 15 minutes to redownload the model next time, always choose Terminate!
