# Arreios Digitais Autoadaptativos e Multimodais · v2

Apresentação sobre **Harness Engineering** em 2026 — do LLM cru ao agente orquestrado em produção.

> **Palestra:** *Arreios Digitais Autoadaptativos e Multimodais* (Ney Lemke, UNESP · CTInf, 2026)
> **Stack base:** [Hermes Agent](https://github.com/NousResearch/hermes-agent) sobre [Omarchy](https://omarchy.org) (Arch Linux + Hyprland)

## Estrutura

```
.
├── arreios-digitais-v2.md            # fonte light (Marp)
├── arreios-digitais-v2-dark.md       # fonte dark (Marp)
├── arreios-digitais-v2.html          # export web light
├── arreios-digitais-v2-dark.html     # export web dark
├── arreios-digitais-v2.pdf           # PDF light
├── arreios-digitais-v2-dark.pdf      # PDF dark
├── arreios-digitais-v2.pptx          # PowerPoint light
├── arreios-digitais-v2-dark.pptx     # PowerPoint dark
├── assets/                            # 17 SVGs + 17 PNGs customizados
├── package.json                       # Marp CLI
├── Makefile                           # build automatizado
└── README.md
```

## 43 slides

A apresentação tem **3 partes**:

1. **Abertura** (slides 1-6) — limites do LLM, ingredientes que viram agente, demandas do dia a dia
2. **Hermes em prática** (slides 7-26) — o que é, arquitetura, perfis, voz, desktop, casos reais
3. **Como o trabalho mudou** (slides 27-43) — workflow, casos reais, GEPA, integração UNESP, Omarchy, cadeia 100% livre, fechamento

## Como regenerar tudo

```bash
# Pré-requisitos: node + marp CLI + python-pptx
npm install
python3 -m venv .venv
.venv/bin/pip install python-pptx

# Build
make            # ou: make all
```

O `Makefile` gera automaticamente HTML, PDF (light + dark) e PPTX (light + dark).

## Tecnologias usadas

- **Marp** — converte Markdown em slides HTML/PDF
- **rsvg-convert** — renderiza os SVGs customizados em PNG de alta resolução
- **python-pptx** — gera versões editáveis em PowerPoint
- **pdftoppm** — para preview dos slides em alta resolução

## Temas

- **Light** (`arreios-digitais-v2.*`) — fundo branco, ideal para impressão
- **Dark** (`arreios-digitais-v2-dark.*`) — fundo `#1e1e2e` (Catppuccin Mocha), ideal para projetor em sala escura

## CI/CD

O repo tem um workflow do GitHub Actions (`.github/workflows/build.yml`) que:

- **Rebuilda automaticamente** HTML, PDF e PPTX a cada `push` na `main`
- **Roda os testes** (lint do YAML) em cada PR
- **Sobe artifacts** (os 6 outputs) com retenção de 30 dias
- **Deploya no GitHub Pages** automaticamente (a versão dark como index)

Para ver o último build: <https://github.com/neylemkeunesp/arreios-digitais-v2/actions>

## Licença

Material autoral de Ney Lemke. Slides de código aberto (Hermes Agent) sob MIT.
