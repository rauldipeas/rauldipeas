#!/bin/bash
set -e
FORGEJO_URL="${FORGEJO_URL:-https://git.rauldipeas.com.br}"
FORGEJO_USER="${FORGEJO_USER:-rauldipeas}"
OUTPUT_DIR="${OUTPUT_DIR:-snake}"
mkdir -p "$OUTPUT_DIR"
echo "Buscando heatmap para $FORGEJO_USER..."
HEATMAP=$(curl -sf \
    -H "Accept: application/json" \
    "$FORGEJO_URL/api/v1/users/$FORGEJO_USER/heatmap")

echo "  $(echo "$HEATMAP" | python3 -c "import json,sys; print(len(json.load(sys.stdin)),'entries')")"
python3 - "$OUTPUT_DIR" "$HEATMAP" <<'PYEOF'
import json, math, sys
from datetime import datetime, timezone, timedelta
from collections import defaultdict

OUTPUT_DIR  = sys.argv[1]
HEATMAP_JSON = sys.argv[2]

PALETTES = {
    "dark": {
    "bg": "transparent", "empty": "#111111",
    "levels": ["#0e4429","#006d32","#26a641","#39d353"],
    "head": "#39d353", "body": "#26a641", "eye": "#000000",
    },
    "light": {
        "bg": "#ffffff", "empty": "#ebedf0",
        "levels": ["#9be9a8","#40c463","#30a14e","#216e39"],
        "head": "#4CAF50", "body": "#2E7D32", "eye": "#ffffff",
    },
}

CELL = 11; GAP = 2; STEP = CELL + GAP

def build_grid(heatmap):
    counts = defaultdict(int)
    for e in heatmap:
        d = datetime.fromtimestamp(e["timestamp"], tz=timezone.utc).strftime("%Y-%m-%d")
        counts[d] += e.get("contributions", 0)
    today = datetime.now(timezone.utc).date()
    start = today - timedelta(weeks=52)
    start -= timedelta(days=start.weekday() + 1)
    mx = max(counts.values(), default=1) or 1
    grid = []
    for w in range(53):
        col = []
        for d in range(7):
            dt = start + timedelta(weeks=w, days=d)
            c = counts.get(dt.strftime("%Y-%m-%d"), 0)
            if c == 0:
                lvl = 0
            elif c <= mx * 0.25:
                lvl = 1
            elif c <= mx * 0.50:
                lvl = 2
            elif c <= mx * 0.75:
                lvl = 3
            else:
                lvl = 4
            col.append(lvl)
        grid.append(col)
    return grid

def cell_xy(col, row): return col * STEP + 0.5, row * STEP + 0.5

def snake_path(grid):
    COLS, ROWS = len(grid), 7
    visited = [[False]*ROWS for _ in range(COLS)]
    contrib = sorted([(c,r) for c in range(COLS) for r in range(ROWS) if grid[c][r] > 0])
    if not contrib: return []
    path = [contrib[0]]
    visited[contrib[0][0]][contrib[0][1]] = True
    target_set = set(map(tuple, contrib))
    def neighbours(c, r):
        for dc,dr in [(-1,0),(1,0),(0,-1),(0,1)]:
            nc,nr = c+dc, r+dr
            if 0<=nc<COLS and 0<=nr<ROWS and not visited[nc][nr]: yield nc,nr
    while True:
        c, r = path[-1]
        cands = [(nc,nr) for nc,nr in neighbours(c,r) if grid[nc][nr] > 0]
        if not cands: cands = list(neighbours(c,r))
        if cands:
            nxt = min(cands, key=lambda p: (p[0], p[1]))
        else:
            rem = [p for p in target_set if not visited[p[0]][p[1]]]
            if not rem: break
            nxt = min(rem, key=lambda p: abs(p[0]-c)+abs(p[1]-r))
        visited[nxt[0]][nxt[1]] = True
        path.append(nxt)
        if all(visited[p[0]][p[1]] for p in target_set): break
    return path

def gen_snake(grid, palette, outfile):
    COLS, ROWS = len(grid), 7
    W, H = COLS*STEP+1, ROWS*STEP+1
    path = snake_path(grid)
    TD = max(len(path)*0.06, 4)
    FRAME = TD / max(len(path), 1)
    L = []; a = L.append
    a(f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {W} {H}" width="{W}" height="{H}">')
    a(f'<rect width="{W}" height="{H}" fill="{palette["bg"]}"/>')
    # grid
    for c in range(COLS):
        for r in range(ROWS):
            lvl = grid[c][r]
            col = palette["empty"] if lvl == 0 else palette["levels"][lvl-1]
            x, y = cell_xy(c, r)
            a(f'<rect x="{x:.1f}" y="{y:.1f}" width="{CELL}" height="{CELL}" rx="2" fill="{col}"/>')
    # eaten animation
    path_set = {}
    for idx,(c,r) in enumerate(path):
        if (c,r) not in path_set: path_set[(c,r)] = idx
    for (c,r),ei in path_set.items():
        if grid[c][r] == 0: continue
        col = palette["levels"][grid[c][r]-1]
        x, y = cell_xy(c, r)
        t0 = ei * FRAME
        a(f'<rect x="{x:.1f}" y="{y:.1f}" width="{CELL}" height="{CELL}" rx="2">')
        a(f'<animate attributeName="fill" values="{col};{palette["empty"]}" keyTimes="0;1" dur="{FRAME:.3f}s" begin="{t0:.3f}s" fill="freeze"/></rect>')
    if not path:
        a('</svg>'); open(outfile,"w").write("\n".join(L)); return
    # keyTimes e posições
    kt = ";".join(f"{i/(len(path)-1):.4f}" if len(path)>1 else "0" for i in range(len(path)))
    xv = ";".join(f"{cell_xy(c,r)[0]:.1f}" for c,r in path)
    yv = ";".join(f"{cell_xy(c,r)[1]:.1f}" for c,r in path)
    # corpo
    for seg in range(min(8, len(path)), 0, -1):
        sxv = ";".join(f"{cell_xy(*path[max(0,i-seg)])[0]:.1f}" for i in range(len(path)))
        syv = ";".join(f"{cell_xy(*path[max(0,i-seg)])[1]:.1f}" for i in range(len(path)))
        a(f'<rect x="-20" y="-20" width="{CELL}" height="{CELL}" rx="2" fill="{palette["body"]}">')
        a(f'<animate attributeName="x" values="{sxv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/>')
        a(f'<animate attributeName="y" values="{syv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/></rect>')
    # cabeça
    hx, hy = cell_xy(*path[0])
    a(f'<rect x="{hx:.1f}" y="{hy:.1f}" width="{CELL}" height="{CELL}" rx="3" fill="{palette["head"]}">')
    a(f'<animate attributeName="x" values="{xv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/>')
    a(f'<animate attributeName="y" values="{yv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/></rect>')
    # olhos
    for ex, ey in [(2.5, 2.5), (6.5, 2.5)]:
        exv = ";".join(f"{cell_xy(c,r)[0]+ex:.1f}" for c,r in path)
        eyv = ";".join(f"{cell_xy(c,r)[1]+ey:.1f}" for c,r in path)
        a(f'<circle r="1.2" fill="{palette["eye"]}">')
        a(f'<animate attributeName="cx" values="{exv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/>')
        a(f'<animate attributeName="cy" values="{eyv}" keyTimes="{kt}" dur="{TD:.2f}s" repeatCount="indefinite"/></circle>')
    a('</svg>')
    open(outfile, "w").write("\n".join(L))
    print(f"  Salvo → {outfile}")

heatmap = json.loads(HEATMAP_JSON)
grid    = build_grid(heatmap)
gen_snake(grid, PALETTES["light"], f"{OUTPUT_DIR}/snake.svg")
gen_snake(grid, PALETTES["dark"],  f"{OUTPUT_DIR}/snake-dark.svg")
PYEOF
git config user.email "ci@runner"
git config user.name "Runner"
git add -A
git commit -m "^snake" || printf "Nada a commitar\n"
git push https://oauth2:"$FORGEJO_COMMIT_TOKEN"@git.rauldipeas.com.br/rauldipeas/.profile.git HEAD:main
