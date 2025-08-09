#!/bin/bash
set -e
curl -s https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg|sudo gpg --dearmor --yes -o /usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main'|sudo tee /etc/apt/sources.list.d/vscodium.list>/dev/null
sudo apt update
sudo apt install -y --reinstall codium npm
sudo npm install -f pnpm
mkdir -p "$HOME"/.config/VSCodium/User
if [ $USER == rauldipeas ];then
	cd /tmp
	rm -fr /tmp/yaru-vscode
	git clone -q https://github.com/AdsonCicilioti/yaru-vscode
	cd yaru-vscode
	npm install
	npx vsce package
	codium --install-extension yaru-vscode-*.vsix
	codium --install-extension ms-ceintl.vscode-language-pack-pt-br
	codium --install-extension ms-vscode.live-server
	codium --install-extension pkief.material-icon-theme
	codium --install-extension zardoy.npm-rapid-ready
    cat <<EOF |tee "$HOME"/.config/VSCodium/User/settings.json>/dev/null
{
	"editor.fontFamily": "'Ubuntu Mono', 'monospace', monospace",
	"editor.occurrencesHighlight": "off",
	"editor.renderLineHighlight": "none",
	"git.confirmSync": false,
	"git.enableSmartCommit": true,
    "glassit.alpha": 220,
  	"telemetry.enableTelemetry": false,
  	"telemetry.enableCrashReporter": false,
  	"telemetry.feedback.enabled": false,
	"terminal.integrated.fontFamily": "Ubuntu Mono, Ubuntu Nerd Font",
  	"update.enableWindowsBackgroundUpdates": false,
  	"update.mode": "manual",
	"window.menuBarVisibility": "toggle",
	"window.titleBarStyle": "native",
	"workbench.colorTheme": "Yaru Dark",
  	"workbench.enableExperiments": false,
    "workbench.iconTheme": "material-icon-theme",
	"workbench.settings.enableNaturalLanguageSearch": false,
}
EOF
    else
    cat <<EOF |tee "$HOME"/.config/VSCodium/User/settings.json>/dev/null
{
	"editor.fontFamily": "'Ubuntu Mono', 'monospace', monospace",
  	"telemetry.enableTelemetry": false,
  	"telemetry.enableCrashReporter": false,
  	"telemetry.feedback.enabled": false,
	"terminal.integrated.fontFamily": "Ubuntu Mono, Ubuntu Nerd Font",
  	"update.enableWindowsBackgroundUpdates": false,
  	"update.mode": "manual",
	"window.menuBarVisibility": "toggle",
	"window.titleBarStyle": "native",
  	"workbench.enableExperiments": false,
	"workbench.settings.enableNaturalLanguageSearch": false,
}
EOF
fi