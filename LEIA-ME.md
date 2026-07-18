# Site Complementare — estrutura e publicação

Site estático da Complementare, publicado na VPS Hostinger via **Easypanel**
(build por `Dockerfile` + `nginx.conf` — não precisa mexer neles).

## Estrutura atual (17 páginas públicas + 404)

| Rota | Arquivo |
|---|---|
| `/` | `index.html` — home |
| `/portfolio` | `portfolio.html` — portfólio com visualizador Speckle |
| `/artigos` | `artigos.html` — lista de artigos |
| `/artigos/<slug>` | 3 artigos em `artigos/` |
| `/cases/<slug>` | 10 cases em `cases/` |
| `/privacidade` | `privacidade.html` — política de privacidade (LGPD) |
| — | `404.html` — página de erro real (`error_page` no nginx) |

Recursos compartilhados: `css/` (fonts.css + um CSS por template, versionados
por `?v=N`), `fonts/` (woff2 self-hosted), `img/`, `favicon*`, `og-*.jpg`,
`sitemap.xml` (17 URLs), `robots.txt`.

## Pontos importantes

- **Umami está ativo nas 16 páginas institucionais, artigos e cases** (instância
  `complementare-umami.twaehz.easypanel.host`). A /privacidade e a 404 não são
  monitoradas, por decisão. Não há nada para descomentar.
  Eventos de clique usam `data-umami-event`.
- **Paleta**: segue o manual CPL-MIV-01 Rev.02 — petróleo `#106B78`,
  verde esmeralda `#009E81`, ardósia `#294851`, ink `#0E1A1D`.
  Não reintroduzir `#0B5563`, `#1FB8A0` nem `#14919B`.
- **WhatsApp contextual**: cada página tem mensagem própria no `wa.me`.
  Ao criar página nova, definir o texto de origem correspondente.
- **Imagens**: toda `<img>` tem `width`/`height` reais; fora da primeira dobra,
  `loading="lazy" decoding="async"`; apenas o LCP de cada página leva
  `fetchpriority="high"` (12 no total).
- **Ao alterar qualquer CSS**: incremente o `?v=` nos HTMLs (cache de 30 dias). Versão atual: `?v=3`.
- **Headers de segurança e CSP** ficam no `nginx.conf`. A CSP libera apenas
  Umami e Speckle; ao adicionar serviço externo novo, incluir o domínio lá
  e atualizar a página `/privacidade`.

## Publicar uma atualização

1. Commit no repositório `wagnerscs-ui/...` (branch `main`).
2. No Easypanel, app do site → **Deploy** (rebuild da imagem).
3. Conferir o endereço provisório antes de apontar o domínio, se for mudança grande.
4. No domínio (`www.cprojetos.com.br`): manter **Redirect to HTTPS** ativo no
   Easypanel; o nginx já redireciona `cprojetos.com.br` → `www`.

## Checklist pós-deploy

- `curl -I` nos 4 caminhos (http/https, com/sem www) → 301/301/301/200
- Visita anônima aparece no painel do Umami
- Modelo 3D (Speckle) abre sem erro de CSP no console
- Página inexistente devolve **404** com a página estilizada
- PageSpeed Insights na home, portfólio, um case e um artigo

_Atualizado em 18/07/2026 — Rodada 1 de otimização (v10/v11)._
