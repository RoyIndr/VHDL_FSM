# 🧮 ROM-Based Finite State Machine (FSM) in VHDL
---
## 🏗️ Project Description
This VHDL implementation demonstrates a ROM-based finite state machine with:
- 🎛️ 3-bit state encoding
- 📚 ROM-stored state transitions and outputs
- ✅ Self-checking testbench verification
---
## 📂 File Structure
---
### 🧩 Core Components
| File | Description | Emoji |
|------|-------------|-------|
| `rom_fsm.vhd` | ROM storing next states and outputs | 🧠 |
| `reg3.vhd` | 3-bit register for state storage | ⏱️ |
| `top.vhd` | Top-level entity connecting components | 🏗️ |

### 🧪 Verification
| File | Description | Emoji |
|------|-------------|-------|
| `tb.vhd` | Testbench with automatic pattern verification | ✅ |

## 📖 ROM Configuration
The ROM contains 8 entries with the following mapping:

| Address (Current State) | Next State | Output | Emoji |
|-------------------------|------------|--------|-------|
| `000` | `001` | `000` | 0️⃣ |
| `001` | `011` | `001` | 1️⃣ |
| `010` | `000` | `010` | 🔄 |
| `011` | `101` | `011` | 2️⃣ |
| `100` | `000` | `000` | 🔄 |
| `101` | `111` | `101` | 3️⃣ |
| `110` | `000` | `000` | 🔄 |
| `111` | `010` | `111` | 4️⃣ |

## 🔄 State Transition Diagram
```mermaid
stateDiagram-v2
    [*] --> 000
    000 --> 001
    001 --> 011
    011 --> 101
    101 --> 111
    111 --> 010
    010 --> 000
```
---
## ✨ Key Features

- **📦 Compact implementation** - Uses efficient ROM storage
- **⏱️ Synchronous operation** - Clocked registers ensure stability
- **🧱 Modular design** - Easy to modify components

## 📜 License 

**MIT License** - Feel free to use and modify! 🎨
