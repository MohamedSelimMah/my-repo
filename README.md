
# 🖥️ System Resource Monitor

A simple **bash script** to check your system’s health on Linux  monitor CPU, memory, disk, network, uptime, and top processes — plus an easy way to kill misbehaving processes! 🚀

---

## ✨ Features

- 🧮 **CPU Usage**: Shows real-time CPU load.
- 🧠 **Memory Usage**: Displays used and total RAM with usage percentage.
- 💾 **Disk Usage**: Summarizes space on all mounted drives.
- 📡 **Network Stats**: Tracks bytes sent and received per interface.
- ⏳ **System Uptime**: How long your system has been running.
- 📊 **Top Processes**: Lists top 5 CPU-hungry processes.
- 🛑 **Kill Process**: Interactive prompt to safely terminate processes by PID.

---

## 🚀 How to Use

1. **Clone the repo:**
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
```

2. **Make the script executable:**

   ```bash
   chmod +x system_monitor.sh
   ```

3. **Run it:**

   ```bash
   ./system_monitor.sh
   ```

---

## 🛠️ Requirements

* Linux-based system
* Common utilities: `top`, `free`, `df`, `ip`, `ps`, `awk` (usually pre-installed)

---

## 💡 How It Works

The script gathers live system stats using native Linux commands and displays them neatly. When it shows top processes, you can input a PID to kill a process right from the terminal — no need to open other tools!

---

## 🤝 Contributing

Found a bug or want a new feature? Feel free to open an issue or submit a pull request — contributions are welcome!

---


Made with ❤️ by ZeroOne

```

---

If you want, I can help generate badges, screenshots, or usage examples next! Just ask.
```
