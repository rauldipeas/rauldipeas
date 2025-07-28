const { app, BrowserWindow, ipcMain } = require('electron');
const { exec } = require('child_process');

function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 700,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    },
  });

  win.setMenu(null);
  win.loadURL('https://rauldipeas.com.br/uds/src/index.html'); // substitua pela URL desejada

  win.webContents.on('before-input-event', (event, input) => {
    if (input.control && input.key.toLowerCase() === 'q') {
      app.quit();
    }
  });
}

app.disableHardwareAcceleration();
app.whenReady().then(createWindow);

ipcMain.handle('executar-scripts', async (_, scripts) => {
  if (!Array.isArray(scripts) || scripts.length === 0) return;

  let comando = "";
  scripts.forEach(script => {
    const url = `https://rauldipeas.com.br/uds/scripts/${script}`;
    comando += `echo 'Executando ${script}...'; bash <(wget -qO- '${url}'); echo; read -n1 -s -r -p 'Pressione qualquer tecla para continuar...'; clear; `;
  });

  comando += `echo 'Todos os scripts foram executados.'; read -n1 -s -r -p 'Pressione qualquer tecla para fechar...';`;

  const terminal = `command -v gnome-terminal &>/dev/null && gnome-terminal -- bash -c "${comando}" || xterm -T 'Instalação sequencial' -fa 'Ubuntu Mono' -fs 11 -bg '#300a25' -fg white -e bash -c "${comando}"`;

  exec(terminal);
});
