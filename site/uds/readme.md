# Ubuntu Derivatives Studio (Estúdio nos derivados do Ubuntu)

![](screenshot.png)

Este é um script que tem como objetivo configurar o Ubuntu e seus derivados pra trabalhar com criação de conteúdo multimídia, com foco especial no áudio em baixíssima latência.

Além dessas configurações, o script também instala diversos programas relacionados com configurações específicas pra otimizar o desempenho e a usabilidade.

Pra quem quiser testar o estágio inicial do script, já tá tudo funcionando, eu só preciso melhorar o aspecto visual, pra ficar mais clara a separação das categorias.

É importante ressaltar que, pra que todos os scripts funcionem corretamente, é necessário marcar todas os ítens da categoria _**Core**_, que vai do primeiro ítem _**Dependências**_ até o ítem _**Synaptic**_.

Em algumas distros, pode ser necessário instalar o `xterm` antes de rodar o script.

```
sudo apt install -y xterm
```

Pra instalar o script é só rodar o comando abaixo:
```
bash <(curl -s https://rauldipeas.com.br/install-uds)
```

Se tudo correr como esperado, vai aparecer um lançador novo nos seus aplicativos, chamado **Pós instação do Ubuntu (Estúdio)**.

Após abrir o aplicativo e selecionar os ítens que quer instalar, cada ítem será executado num terminal individual, na maioria deles você vai precisar inserir a senha de administrador _(`sudo`)_.

No fim da operação, o terminal vai exibir uma mensagem e vai ficar aguardando você pressionar qualquer tecla pra fechar.

Caso algum erro aconteça, por favor capture uma imagem e mande [_**aqui**_](https://github.com/rauldipeas/rauldipeas/discussions/categories/bugs) ou no [_**Telegram**_](https://t.me/producaomusicalnolinux).