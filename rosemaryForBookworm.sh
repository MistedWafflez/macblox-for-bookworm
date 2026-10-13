#go home
cd ~
#get new rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
#install deps
sudo apt-get update
sudo apt-get install -y build-essential pkg-config libcurl4-openssl-dev zlib1g-dev
#clone into repo
git clone https://github.com/microlift/rosemary.git
cd rosemary
#build with cargo
cargo build --release --bin rosemary
#done
echo "new binary should be at target/release/rosemary"
