# AscensionAPIScanner  
### A full in‑game developer toolkit for Project Ascension

AscensionAPIScanner is a comprehensive in‑game development suite designed for addon authors working on **Project Ascension** (3.3.5a).  
It provides deep introspection tools, live debugging utilities, and a full API browser — all inside the WoW client.

This addon turns your game client into a **developer workstation**.

---

# 🚀 Features

AscensionAPIScanner includes a wide range of tools, each accessible through the in‑game UI panel (`/ascui`):

## 🔍 API Scanner
- Detects all non‑Blizzard global functions
- Groups by namespace
- Automatic namespace inference
- Metadata view (type, table path, value type)

## 📚 Blizzard API Coverage
- Shows all functions in the Blizzard 3.3.5 baseline
- Helps maintain accurate scanning
- Highlights missing or overridden functions

## 🧩 Namespace Tree Explorer
- Visual tree of all global tables and their methods
- Useful for discovering Ascension’s internal architecture

## 🧠 FrameXML Browser
- Lists all loaded FrameXML files
- Shows functions belonging to each file
- Includes a **syntax‑highlighted source viewer**

## 🔥 Event Inspector
- Live event console
- Shows event names, arguments, timestamps
- Filterable and scrollable

## 📘 Event Argument Database
- Automatically records argument signatures for all events
- Searchable reference for addon authors

## 🪝 Hook Detector
- Detects when Ascension overrides Blizzard functions
- Useful for debugging and compatibility checks

## 📊 Addon Performance Inspector
- Memory usage per addon
- CPU usage per addon
- Live updating

## ⚙️ Function Profiler
- Wrap any global function to measure:
  - Call count
  - Total time
  - Average time
  - Max execution time

## 🧵 Stack Trace Explorer
- Captures stack traces from:
  - Errors
  - Manual triggers
- Click to view full trace

## 🪟 UI Widget Inspector (Enhanced `/fstack`)
- Click any frame on screen to inspect:
  - Name, parent, size
  - Strata, level
  - Registered scripts
  - Secure state

## 💻 Live Lua REPL
- Execute Lua code in‑game
- Shows results and history
- Supports both expressions and statements

---

# 🧱 Codebase Structure

```
AscensionAPIScanner/
├── Core/          # Logic modules
├── UI/            # User interface
├── SavedVariables.lua
└── README.md
```

Each feature lives in its own module for clarity and maintainability.

---

# 📦 Installation

1. Download the addon folder  
2. Place it in:  
   ```
   Interface/AddOns/AscensionAPIScanner
   ```
3. Launch the game  
4. Use `/ascui` to open the main panel

---

# 🛠️ For Developers

### Slash Commands
```
/ascscan   # Raw scan to chat
/ascui     # Open the full UI panel
```

### Profiling API
```lua
AscensionAPIScanner_ProfileFunction("SomeGlobalFunction")
AscensionAPIScanner_ToggleProfiler(true)
```

### Manual Stack Capture
```lua
AscensionAPIScanner_CaptureStack("MyLabel")
```

### REPL Evaluation
```lua
AscensionAPIScanner_Eval("return GetTime()")
```

---

# 🧭 Roadmap

### v1.0 (Current)
- Full developer toolkit
- Modular architecture
- UI panel with 12+ tools

### v1.1
- Call graph visualization
- Function reference linking
- Export to JSON

### v1.2
- Patch‑to‑patch diff mode
- Namespace change tracker

### v1.3
- Live memory graphing
- CPU flamegraph‑style profiler

### v2.0
- Full Ascension Developer IDE  
  (standalone desktop companion app)

---

# 🤝 Contributing

Pull requests are welcome!  
If you want to add new tools, follow the existing module structure under `/Core` and `/UI/Tabs`.

---

# 📄 License

MIT License — free to use, modify, and distribute.

