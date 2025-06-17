# 🤖 Mealy Sequence Detector (VHDL)

This project implements a **Mealy finite state machine (FSM)** in VHDL that detects a specific input bit sequence and outputs a signal when the sequence is matched.

---

## 📁 File Structure

```
mealy_sequence_detector/
├── fsm_entity.vhd # Main FSM entity and architecture
├── fsm_package.vhd # Package containing state type declarations
├── fsm_tb.vhd # Testbench to simulate and verify FSM behavior
```
---

## ⚙️ Project Description

This is a **Mealy-type FSM**, meaning the output depends on both the current state and the current input.

- Sequence detection target: `101` (example — adjust if different)
- When the sequence is detected, the FSM asserts `out_y = '1'`
- The FSM resets automatically on power-up or on a reset signal

---

## 🔌 I/O Ports

| Signal    | Direction | Description                  |
|-----------|-----------|------------------------------|
| `in_clk`  | Input     | Clock signal (rising edge)   |
| `in_reset`| Input     | Active-high synchronous reset|
| `in_a`    | Input     | Serial input bit stream      |
| `out_y`   | Output    | Output high when sequence detected |

---

## 🧩 Modular Design

- 🧠 FSM states and transitions are clearly defined in a separate VHDL package.

---

## ✨ Future Improvements

- Add 7-segment display or LED indicators on FPGA
- Implement a Moore version for comparison
- Make sequence programmable via input switches

---

## 📄 License

This project is licensed under the **MIT License** — feel free to use or modify it.

---

## 👤 Author

**Roy Indra Pratama**  
GitHub: [@RoyIndr](https://github.com/RoyIndr)
