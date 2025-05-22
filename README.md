# 💤 My LazyVim Configuration

A modern, feature-rich Neovim setup built on LazyVim - a flexible, modular configuration distribution that transforms Neovim into a full-featured IDE while remaining lightweight and customizable.

---

## 🚀 Quick Start Options

### **Option 1: Try This Config Without Overwriting Your Existing One**

If you already have a Neovim configuration and want to keep it intact while trying this LazyVim setup, follow these steps:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/lmilojevicc/lazyvim-config ~/.config/lazyvim-config
   ```

2. **Create an Alias**:
   To make launching this configuration easier, add an alias to your shell configuration file (e.g., `.bashrc`, `.zshrc`):

   ```bash
   alias lvim='NVIM_APPNAME=lazyvim-config nvim'
   ```

3. **Enjoy!**  
   You can now switch between your original config and this LazyVim setup effortlessly.

---

### **Option 2: Use This LazyVim Config as Your Default**

If you don't have an existing Neovim configuration or don't mind replacing it, follow these steps:

1. **Backup Your Existing Config (Optional)**:
   If you want to save your current setup, back it up first:

   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

2. **Clone the Repository**:

   ```bash
   git clone https://github.com/lmilojevicc/lazyvim-config ~/.config/nvim
   ```

3. **Launch Neovim**:
   Simply run:

   ```bash
   nvim
   ```

4. **Install Plugins**:
   LazyVim will automatically install plugins on first launch, but you can manually sync with:

   ```
   :Lazy sync
   ```

---

## 🛠️ Requirements

Make sure you have the following installed on your system before using this LazyVim configuration:

- [Nerd font](https://www.nerdfonts.com/) of your choice
- [Neovim](https://neovim.io/) (version 0.8.0 or higher)
- `git`
- `fd`
- `fzf`
- `node`
- `ripgrep`
- `lazygit` (optional, for git integration)

---

## 📂 Directory Structure

```
.
├── init.lua                  # Main entry point for Neovim
├── lazy-lock.json            # Dependency lock file (automatically managed by Lazy.nvim)
└── lua/
    ├── config/               # Core configuration modules
    │   ├── init.lua          # Initializes and loads all core configurations
    │   ├── lazy.lua          # Lazy plugin manager setup and configuration
    │   ├── keymaps.lua       # Global keybindings and keyboard shortcuts
    │   ├── autocmds.lua      # Autocommands for automatic actions on events
    │   └── options.lua       # Neovim built-in options and settings
    ├── disabled/             # Archived configurations (temporarily disabled plugins)
    └── plugins/              # Plugin-specific configurations
        └── ...
```

---

## 💡 Tips & Tricks

- LazyVim uses `<Space>` as the leader key by default
- Type `<leader>` and wait to see available key bindings through which-key or use `<leader>wk` to search through key binds
- For quick language or plugin setup checkout `:LazyExtras`
