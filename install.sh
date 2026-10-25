#!/bin/bash
# تركيب After Effects MCP على الماك: يبني الأداة، يركّب البانل داخل أفتر، ويربطها بتطبيق Claude.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)/after-effects-mcp"
command -v node >/dev/null || { echo "ثبّت Node.js أول (nodejs.org) وبعدها شغّل السكربت مرة ثانية"; exit 1; }
cd "$DIR" && npm install --silent
AE=$(ls -d "/Applications/Adobe After Effects 20"* 2>/dev/null | sort | tail -1)
[ -n "$AE" ] || { echo "ما لقيت After Effects في /Applications"; exit 1; }
echo "بيطلب منك باسورد الماك عشان ينسخ البانل داخل مجلد أفتر:"
sudo cp "$DIR/build/scripts/mcp-bridge-auto.jsx" "$AE/Scripts/ScriptUI Panels/"
mkdir -p ~/Documents/ae-mcp-bridge
CFG="$HOME/Library/Application Support/Claude/claude_desktop_config.json"
mkdir -p "$(dirname "$CFG")"; [ -f "$CFG" ] || echo '{}' > "$CFG"
cp "$CFG" "$CFG.backup"
python3 - "$CFG" "$DIR/build/index.js" <<'PY'
import json, sys
p, idx = sys.argv[1:]; d = json.load(open(p))
d.setdefault('mcpServers', {})['after-effects'] = {"command": "node", "args": [idx]}
json.dump(d, open(p, 'w'), indent=2)
PY
echo "تم ✅  سكّر تطبيق Claude وافتحه، وفي أفتر: Window > mcp-bridge-auto.jsx وفعّل Auto-run commands"
