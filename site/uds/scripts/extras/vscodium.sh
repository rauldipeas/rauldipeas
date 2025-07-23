#!/bin/bash
set -e
wget -qO- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg|sudo gpg --dearmor --yes -o /usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main'|sudo tee /etc/apt/sources.list.d/vscodium.list>/dev/null
sudo apt update
sudo apt install -y codium
mkdir -p "$HOME"/.config/VSCodium/User
if [ $USER == rauldipeas ];then
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