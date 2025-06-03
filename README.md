# 🧼 Dev Tool Nuker for Windows

A simple script that uninstalls all common development tools from your Windows system using `winget`.

> Originally made for my own use — now cleaned up and made universal.

---

## 🧠 What's Included?

The script targets:

- IDEs like VS Code, JetBrains, etc.
- Runtimes like Node.js, Python, Java, Go
- Docker, Git, and other CLIs
- Anything else dev-related and bloated

You can easily tweak the list to add/remove packages to fit your needs.

---

## 🛠️ Usage

```bash
# Run this with admin privileges
winget uninstall --id Some.Package.Name
