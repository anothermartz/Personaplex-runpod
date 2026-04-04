#!/bin/bash
# Wait 5 seconds for RunPod to initialize network ports
sleep 5

# --- 1. GLOBAL VARIABLES ---
# (Fill in your token before saving!)
export HF_TOKEN="${HF_TOKEN}"
export HF_HOME="/workspace/huggingface_cache"
export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"
export TMPDIR="/workspace/tmp"
mkdir -p $TMPDIR

# --- 2. REPOSITORY CHECK (The Fresh Drive Fix) ---
if [ ! -d "/workspace/Personaplex-oneclicker" ]; then
    echo "Fresh drive detected. Cloning repositories..."
    cd /workspace
    git clone https://github.com/surebabu2007/Personaplex-oneclicker.git
    cd Personaplex-oneclicker
    git clone https://github.com/NVIDIA/personaplex.git temp_nvidia_repo
else
    echo "Repositories found. Booting sequence initiated..."
    cd /workspace/Personaplex-oneclicker
fi

# Set the Python path now that we are in the right folder
export PYTHONPATH="/workspace/Personaplex-oneclicker/moshi"

# --- 3. HARDWARE ARCHITECTURE CHECK ---
CURRENT_ARCH=$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader | head -n 1 | tr -d ' ')

if [[ "$CURRENT_ARCH" == 12.* ]]; then
    # BLACKWELL MODE
    ENV_DIR="venv_blackwell"
    echo "Routing to $ENV_DIR (Blackwell Architecture)..."
    if [ ! -d "$ENV_DIR" ]; then
        echo "Building clean-room Blackwell environment..."
        python3 -m venv $ENV_DIR
        source $ENV_DIR/bin/activate
        
        # 1. Install EVERYTHING from the master list (which secretly installs the wrong PyTorch)
        pip install -r ./temp_nvidia_repo/moshi/requirements.txt

        # 2. Cleanly rip out the incompatible PyTorch that the requirements file just installed
        pip uninstall -y torch torchvision torchaudio

        # 3. THE BLACKWELL OVERRIDE: Install the pure nightly drivers
        pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128 --no-cache-dir

        # 4. Install the UI and the Hugging Face bridges
        pip install ./temp_nvidia_repo/moshi/. accelerate huggingface_hub
    else
        source $ENV_DIR/bin/activate
    fi
else
    # STANDARD MODE (Ada/Ampere)
    ENV_DIR="venv_standard"
    echo "Routing to $ENV_DIR (Standard Architecture)..."
    if [ ! -d "$ENV_DIR" ]; then
        echo "Building bridged Standard environment..."
        python3 -m venv $ENV_DIR --system-site-packages
        source $ENV_DIR/bin/activate
        
        # Install dependencies and UI
        pip install -r ./temp_nvidia_repo/moshi/requirements.txt
        pip install ./temp_nvidia_repo/moshi/. accelerate huggingface_hub
    else
        source $ENV_DIR/bin/activate
    fi
fi

# --- 4. VOICE MODEL CHECK ---
if [ ! -d "/workspace/Personaplex-oneclicker/voices" ]; then
    echo "Voice models missing. Downloading 16GB Moshi model (this will take a few minutes)..."
    python -c "import os; from huggingface_hub import hf_hub_download; import tarfile; from pathlib import Path; voices_tgz = hf_hub_download('nvidia/personaplex-7b-v1', 'voices.tgz', token=os.environ.get('HF_TOKEN')); voices_tgz = Path(voices_tgz); voices_dir = Path.cwd() / 'voices'; voices_dir.mkdir(exist_ok=True); tarfile.open(voices_tgz, 'r:gz').extractall(path=voices_dir); print('Voices extracted successfully.')"
fi

# --- 5. LAUNCH THE SERVER ---
echo "All checks passed. Launching PersonaPlex..."
python -m moshi.server --host 0.0.0.0 --port 8998 --static none --voice-prompt-dir voices
