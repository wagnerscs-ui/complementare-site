# Site Complementare — como colocar no ar

Este repositório contém o site da Complementare pronto para publicar na sua VPS
Hostinger usando o **Easypanel**. São duas páginas:

- `index.html` — a home (página principal)
- `portfolio.html` — o portfólio de cases

Os arquivos `Dockerfile` e `nginx.conf` fazem o site funcionar; você **não precisa
mexer neles**.

---

## Passo 1 — Subir estes arquivos no GitHub

1. Crie um repositório novo no GitHub (pode ser privado), por exemplo
   `complementare-site`.
2. Envie **todo o conteúdo desta pasta** para o repositório
   (`index.html`, `portfolio.html`, `Dockerfile`, `nginx.conf`).

> Se o repositório for privado, no Easypanel vá em **Settings → GitHub** e
> conecte sua conta (ou adicione um token) antes do Passo 2.

## Passo 2 — Criar o app no Easypanel

1. No Easypanel, abra o projeto **complementare**.
2. Clique em **+ (novo serviço) → App**. Dê o nome de `site` (ou `portfolio`).
3. Na aba **Source (Origem)**, escolha **GitHub** e selecione o repositório
   `complementare-site`, branch `main`.
4. Na aba **Build (Construir)**, escolha **Dockerfile**
   (o caminho é só `Dockerfile`, que já está na raiz).
5. Clique em **Deploy**. Acompanhe em **Deployments** até aparecer sucesso.

## Passo 3 — Testar antes de trocar o domínio

1. Na aba **Domains** do app, o Easypanel já mostra um endereço provisório
   (algo como `site-complementare.SEUSERVIDOR.easypanel.host`).
2. Abra esse endereço e confira tudo: as duas páginas, o menu, o modelo 3D e a
   visualização no celular.
3. **Enquanto isso, o site atual no Wix continua no ar.** Nada muda para o
   público até o Passo 5.

## Passo 4 — Ligar o domínio no app

1. Ainda na aba **Domains**, clique em **Add Domain** e adicione:
   - `cprojetos.com.br`
   - `www.cprojetos.com.br`
2. Ative o **SSL / Let's Encrypt** (cadeado) que aparece para cada domínio.
   Isso faz o site abrir em `https://` com segurança.

## Passo 5 — Apontar o DNS (a virada de chave)

Só faça isso quando o Passo 3 estiver 100% testado. Onde você gerencia o DNS do
`cprojetos.com.br` (Registro.br, Hostinger ou Wix), troque os registros atuais
que apontam para o Wix pelos da sua VPS:

- Os **3 registros A** de `cprojetos.com.br` (hoje `185.230.63.107`, `.171`,
  `.186`) → passam a apontar para **um único registro A com o IP da sua VPS**.
- O **CNAME** de `www` (hoje `www185.wixdns.net`) → troque para o IP da VPS
  (um registro **A** de `www` com o IP da VPS) **ou** aponte via CNAME para o
  domínio principal, conforme seu provedor permitir.

> O IP da sua VPS aparece no Easypanel/Hostinger (VPS → Overview → IPv4).

A propagação do DNS leva de alguns minutos a algumas horas. Você pode acompanhar
em https://whatsmydns.net. Quando propagar, `cprojetos.com.br` já mostra o site
novo, com cadeado.

---

## Como atualizar o site no futuro

1. Peça os arquivos novos (`index.html` / `portfolio.html`).
2. Substitua-os no repositório do GitHub.
3. No Easypanel, abra o app e clique em **Deploy** (ou ele republica sozinho, se
   o webhook estiver ativo).

Pronto — sem terminal, sem FTP.
