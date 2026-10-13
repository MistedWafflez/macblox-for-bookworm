export SDL_VIDEODRIVER=x11 #x11/wayland idk whatever you use

#you belong here bro
cd ~/RobloxMac
#getting latest version
echo "getting latest version"
VERSION=$(curl -s "https://clientsettings.roblox.com/v2/client-version/MacPlayer" | grep -o '"clientVersionUpload":"[^"]*"' | cut -d'"' -f4)
#making archives dir
mkdir -p archives
#checking if new update
if [ -f "$HOME/RobloxMac/archives/${VERSION}-RobloxPlayer.zip" ]; then
	echo "Version exists, will not update."
	echo "btw cleaning up old versions from archive/* is your responsibility."
else
	#backup
	if [ -d "$HOME/RobloxMac/RobloxPlayer.app" ]; then
		echo "making backup of last version"
		mv "$HOME/RobloxMac/RobloxPlayer.app" "$HOME/RobloxMac/RobloxPlayer.app.$(date +%s).old"
	fi
	#download
	echo "downloading latest version"
	curl -o "$HOME/RobloxMac/archives/${VERSION}-RobloxPlayer.zip" "https://setup.rbxcdn.com/mac/${VERSION}-RobloxPlayer.zip"
	#unzip
	echo "unzipping package"
	unzip "$HOME/RobloxMac/archives/${VERSION}-RobloxPlayer.zip"
fi
#starting roblox
export __GL_SYNC_TO_VBLANK=0
export vblank_mode=0
export SDL_RENDER_VSYNC=0
echo "starting roblox"
~/rosemary/target/release/rosemary run ~/RobloxMac/RobloxPlayer.app
echo "process ended"
sleep 3
#going back start
cd ~/RobloxMac
