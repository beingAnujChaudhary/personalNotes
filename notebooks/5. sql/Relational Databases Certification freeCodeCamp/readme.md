# 🖥️ Developer Environment Mastery

Comprehensive Notes: VS Code · Terminals · Bash · Git · Productivity Commands

---

## 1. Maximizing Productivity in VS Code

While basic OS shortcuts like `Ctrl + S` (Save), `Ctrl + C` (Copy), and `Ctrl + V` (Paste) work universally, mastering application-specific shortcuts is key to becoming a VS Code power user.

> **✨ Multi-line Editing Magic:** You can place multiple cursors using `Ctrl + Alt + ↑/↓` (Win/Lin) or `Option + Cmd + ↑/↓` (Mac). Alternatively, hold `Alt` (Win/Lin) or `Option` (Mac) and click anywhere. Typing or deleting will apply to *all* cursor locations simultaneously!

### 📋 VS Code Shortcut Cheat Sheet

| Action | Windows / Linux | macOS |
|---|---|---|
| Format Document | `Shift + Alt + F` | `Shift + Option + F` |
| Search Across Workspace | `Ctrl + Shift + F` | `Cmd + Shift + F` |
| Find & Replace (Workspace) | `Ctrl + Shift + H` | `Cmd + Shift + H` |
| Delete Entire Line | `Ctrl + Shift + K` | `Cmd + Shift + K` |
| Toggle Sidebar | `Ctrl + B` | `Cmd + B` |
| Zoom In / Out | `Ctrl + +` / `-` | `Cmd + +` / `-` |
| Open Command Palette | `Ctrl + Shift + P` | `Cmd + Shift + P` |

### 🧪 Knowledge Check: VS Code

**1. Which Windows keyboard shortcut is used to run the configured formatter on the currently opened file in VS Code?**

- [ ] Ctrl + F
- [x] Shift + Alt + F
- [ ] Ctrl + Shift + F
- [ ] Alt + F4

**2. What function does the keyboard shortcut Ctrl + Shift + K (Windows/Linux) or Cmd + Shift + K (macOS) perform in VS Code?**

- [ ] Opens the command palette.
- [ ] Increases the editor's text size.
- [x] Deletes the current line.
- [ ] Hides the sidebar.

**3. Which Windows keyboard shortcut opens the command palette in VS Code?**

- [ ] Ctrl + P
- [x] Ctrl + Shift + P
- [ ] Alt + F4
- [ ] Ctrl + Space

---

## 2. Demystifying the Terminal, Shell, and CLI

Though often used interchangeably, these three terms represent distinct layers of your system's text-based interface.

| Concept | Definition | Analogy |
|---|---|---|
| **Command Line (CLI)** | A basic text input interface where users type and execute commands. | The language you are speaking. |
| **Terminal** | The application (or emulator) that provides the window and UI to interact with the CLI and perform system-level operations. | The room where the conversation happens. |
| **Shell** | The underlying software program that wraps the CLI, interprets your typed inputs, and returns the output. | The translator processing your words. |

### OS-Specific Terminal Environments

- **Windows:** Comes with `Command Prompt` and `PowerShell`. The modern `Windows Terminal` app unifies these alongside WSL (Windows Subsystem for Linux).
- **macOS:** Uses the default `Terminal` app (running the `zsh` shell by default). Third-party emulators like `iTerm2` or `Ghostty` are popular.
- **Linux:** Highly dependent on the distro/desktop environment. Examples include `kitty`, `gnome-terminal`, or launching via managers like `wofi`.

### 🧪 Knowledge Check: Terminals & Shells

**1. What is a terminal?**

- [ ] A basic text input interface for entering commands.
- [x] A special application that offers a command line interface for system-level commands.
- [ ] Software that removes all user inputs in the command line.
- [ ] The Enter key used to submit commands.

**2. Which of the following best describes a shell?**

- [ ] A hardware component that displays text input.
- [ ] A special application that allows system-level commands.
- [x] Software that wraps the command line and interprets inputs as commands.
- [ ] A third-party terminal emulator.

**3. On Windows, what advantage does Microsoft Terminal offer over traditional options?**

- [ ] It's the only way to access the command line on Windows.
- [x] It allows access to both Powershell and Command Prompt shells from the same application.
- [ ] It's the default terminal on all Windows systems.
- [ ] It replaces the need for a shell entirely.

---

## 3. Command Line Shortcuts for Speed

Mastering terminal shortcuts streamlines workflows. Note that *nix (Linux/macOS) and Windows (PowerShell) have some differences.

| Shortcut / Action | *nix (Bash/Zsh) | Windows (PowerShell) |
|---|---|---|
| Cycle History | `↑` / `↓` Arrows | `↑` / `↓` Arrows |
| Auto-complete | `Tab` | `Tab` |
| Clear Screen | `Ctrl + L` | Type `cls` |
| Interrupt / Kill Process | `Ctrl + C` | `Ctrl + C` (if no text selected) |
| Suspend to Background | `Ctrl + Z` (use `fg` to resume) | N/A |
| Repeat Last Command | Type `!!` and hit Enter | N/A |

### 🧪 Knowledge Check: CLI Shortcuts

**1. Which key combination is used to clear the screen in *nix based terminals?**

- [ ] Control + C
- [x] Control + L
- [ ] Control + Z
- [ ] The tab key

**2. What happens when you press Control + Z in a *nix based terminal?**

- [ ] It terminates the current process.
- [x] It places the current process in the background.
- [ ] It clears the screen.
- [ ] It cycles through command history.

**3. Which of the following can be used to quickly run the last executed command in a *nix based terminal?**

- [ ] Control + L
- [ ] The tab key
- [x] !!
- [ ] Control + C

---

## 4. Bash Essentials & Core Commands

**Bash** (Bourne Again SHell) is the most common shell in Unix-like environments. Below are the foundational commands you will use daily.

| Command | Description | Example Usage |
|---|---|---|
| `pwd` | **P**rint **W**orking **D**irectory. Shows your current location. | `pwd` |
| `cd` | **C**hange **D**irectory. Use `..` to go up one level. | `cd /var/www` or `cd ..` |
| `ls` | **L**i**s**t directory contents. Use `-a` for hidden files, `-l` for details. | `ls -la` |
| `mkdir` | **M**a**k**e **Dir**ectory (folder). | `mkdir my-project` |
| `touch` | Creates an empty file. | `touch index.html` |
| `mv` | **M**o**v**e or rename a file/folder. | `mv old.txt new.txt` |
| `cp` | **C**o**p**y. Use `-r` to copy directories recursively. | `cp -r /src /dest` |
| `rm` | **R**e**m**ove (delete). Use `-r` for folders, `-f` to force. | `rm -rf node_modules` |
| `echo` | Prints text. Use `>` to overwrite a file, `>>` to append. | `echo "Hello" >> log.txt` |
| `cat` | Displays the entire content of a file at once. | `cat file.txt` |
| `less` | Views file content one page at a time with navigation (scroll, search). | `less large-file.log` |
| `man` | Opens the **Man**ual (help page) for any command. | `man ls` |

### 🧪 Knowledge Check: Bash Commands

**1. What does the pwd command do in Bash?**

- [ ] Changes directories.
- [x] Prints the current working directory.
- [ ] Creates a new file.
- [ ] Lists directory contents.

**2. Which command would you use to create a new file called notes.txt?**

- [ ] mkdir notes.txt
- [ ] cd notes.txt
- [x] touch notes.txt
- [ ] ls notes.txt

**3. If you wanted to rename a file from oldname.txt to newname.txt, which command would you use?**

- [ ] rm oldname.txt newname.txt
- [x] mv oldname.txt newname.txt
- [ ] touch newname.txt
- [ ] cd oldname.txt newname.txt

---

## 5. Mastering Command Options and Flags

Options (or flags) are special arguments that modify how a command behaves. They generally come in two syntax forms:

| Syntax Type | Format | Example | Key Feature |
|---|---|---|---|
| **Long Form** | Two hyphens (`--`) followed by a full word. | `ls --help`<br>`ls --width=50` | Highly readable. Values are typically attached with an equals sign (`=`). |
| **Short Form** | One hyphen (`-`) followed by a single letter. | `ls -a`<br>`ls -w 50` | Can be **chained** together (e.g., `ls -ahs`). Values are separated by a space. |

> **💡 Pro-Tip:** If you ever forget the available flags or their required syntax for a specific tool, simply run the command with `--help` or check the manual via `man <command>`.

### 🧪 Knowledge Check: Flags & Options

**1. What is the difference between "long form" and "short form" syntax for command options?**

- [ ] Long form uses a single hyphen while short form uses two hyphens.
- [x] Long form uses two hyphens while short form uses a single hyphen.
- [ ] Long form is only used for version information.
- [ ] There is no difference between the two forms.

**2. What is the advantage of using short form options like -ahs?**

- [ ] They require less memory to process.
- [ ] They are easier to remember.
- [x] Multiple options can be chained together.
- [ ] They always work better than long form options.

**3. When using a long-form option that requires a value, what syntax is typically used?**

- [ ] --option value
- [x] --option=value
- [ ] -o value
- [ ] -o=value

---

## 6. 🚀 Essential Developer Commands `Must-Know`

Beyond the basics, these commands are indispensable for developers working with text, processes, permissions, and system management.

### 📄 File & Text Processing

| Command | Description | Example Usage |
|---|---|---|
| `head` | Shows the first N lines of a file (default: 10). | `head -n 20 log.txt` |
| `tail` | Shows the last N lines of a file. Use `-f` to follow in real-time. | `tail -f app.log` |
| `grep` | Searches for patterns within files. Case-insensitive: `-i`, recursive: `-r`. | `grep -r "error" ./logs/` |
| `wc` | **W**ord **C**ount. Use `-l` for lines, `-w` for words. | `wc -l file.txt` |
| `sort` | Sorts lines of text. Use `-n` for numeric sort, `-r` for reverse. | `sort -nr scores.txt` |
| `uniq` | Reports or omits repeated lines. Often used with `sort`. | `sort list.txt \| uniq -c` |
| `sed` | **S**tream **Ed**itor for find-and-replace in files/streams. | `sed 's/old/new/g' file.txt` |
| `awk` | Powerful text processing language for structured data (CSV, logs). | `awk '{print $1}' data.csv` |
| `find` | Searches for files/directories by name, type, size, or time. | `find . -name "*.js" -type f` |
| `diff` | Shows differences between two files. | `diff file1.txt file2.txt` |
| `file` | Determines the type of a file (binary, text, image, etc.). | `file unknown.bin` |
| `tar` | Archive utility for creating/extracting `.tar` files. | `tar -czvf archive.tar.gz folder/` |
| `gzip` / `gunzip` | Compress / decompress files using gzip algorithm. | `gzip largefile.txt` |

### ⚙️ System & Process Management

| Command | Description | Example Usage |
|---|---|---|
| `ps` | Shows running processes. Use `-aux` for all users' processes. | `ps aux \| grep node` |
| `top` / `htop` | Interactive process viewer with resource usage (CPU, memory). | `htop` |
| `kill` | Terminates a process by PID. Use `-9` to force kill. | `kill -9 1234` |
| `killall` | Terminates all processes with a given name. | `killall node` |
| `nohup` | Runs a command immune to hangups (continues after terminal closes). | `nohup npm start &` |
| `jobs` | Lists background jobs in the current shell session. | `jobs` |
| `fg` / `bg` | Brings a job to the foreground or resumes it in the background. | `fg %1` |
| `df` | Shows disk space usage for mounted filesystems. | `df -h` |
| `du` | Shows disk usage of files/directories. Use `-sh` for summary. | `du -sh /home/user` |
| `free` | Shows memory (RAM) usage. Use `-m` for MB, `-h` for human-readable. | `free -h` |
| `uname` | Shows system information (kernel, architecture, OS). | `uname -a` |

### 🔐 Permissions & Ownership

| Command | Description | Example Usage |
|---|---|---|
| `chmod` | **Ch**anges file **mod**e (permissions). Use numeric (755) or symbolic (u+x). | `chmod 755 script.sh` |
| `chown` | **Ch**anges file **own**ership (user:group). | `chown user:group file.txt` |
| `umask` | Sets default permissions for newly created files/directories. | `umask 022` |

### 🌐 Networking

| Command | Description | Example Usage |
|---|---|---|
| `ping` | Tests network connectivity to a host. | `ping google.com` |
| `curl` | Transfers data from/to servers (HTTP, FTP, etc.). | `curl -I https://example.com` |
| `wget` | Downloads files from the internet. | `wget https://example.com/file.zip` |
| `ssh` | Secure shell for remote server access. | `ssh user@192.168.1.100` |
| `scp` | Securely copies files between hosts over SSH. | `scp file.txt user@host:/path/` |
| `netstat` | Displays network connections and ports in use. | `netstat -tulpn` |
| `nslookup` / `dig` | DNS lookup tools for domain name resolution. | `dig example.com` |
| `traceroute` | Traces the path packets take to a destination. | `traceroute google.com` |

---

## 7. 🔀 Git Version Control Commands `Essential`

Git is the industry standard for version control. These commands cover the entire development workflow from initialization to collaboration.

> **⚠️ Remember:** Always run `git status` frequently to stay aware of your repository's state!

### 📁 Repository Setup & Configuration

| Command | Description | Example Usage |
|---|---|---|
| `git init` | Initializes a new Git repository in the current directory. | `git init` |
| `git clone` | Creates a local copy of a remote repository. | `git clone https://github.com/user/repo.git` |
| `git config` | Sets or views Git configuration (user name, email, etc.). | `git config --global user.name "Your Name"` |
| `git remote` | Manages connections to remote repositories. | `git remote add origin https://github.com/user/repo.git` |

### 📝 Daily Workflow (Staging & Committing)

| Command | Description | Example Usage |
|---|---|---|
| `git status` | Shows the current state of the working directory and staging area. | `git status` |
| `git add` | Stages changes for the next commit. Use `.` for all, `-p` for partial. | `git add .` or `git add index.html` |
| `git commit` | Creates a snapshot of staged changes with a message. | `git commit -m "Add login feature"` |
| `git reset` | Unstages changes or moves HEAD. Use `--soft`, `--hard` carefully. | `git reset HEAD file.txt` |
| `git rm` | Removes files from both working directory and staging. | `git rm old-file.js` |
| `git mv` | Renames or moves files (staged automatically). | `git mv old.js new.js` |

### 📜 History & Inspection

| Command | Description | Example Usage |
|---|---|---|
| `git log` | Shows the commit history. Use `--oneline` for condensed view. | `git log --oneline --graph` |
| `git diff` | Shows changes between commits, branches, or working directory. | `git diff HEAD~1` |
| `git show` | Displays details of a specific commit. | `git show abc123` |
| `git blame` | Shows who last modified each line of a file. | `git blame index.html` |
| `git shortlog` | Summarizes commit activity grouped by author. | `git shortlog -sn` |

### 🌿 Branching & Merging

| Command | Description | Example Usage |
|---|---|---|
| `git branch` | Lists, creates, or deletes branches. | `git branch feature-auth` |
| `git checkout` | Switches branches or restores files. Use `-b` to create and switch. | `git checkout -b new-feature` |
| `git switch` | Newer alternative to `checkout` for switching branches. | `git switch main` |
| `git merge` | Combines changes from one branch into the current branch. | `git merge feature-auth` |
| `git rebase` | Applies commits from one branch onto another (rewrites history). | `git rebase main` |
| `git cherry-pick` | Applies a specific commit from another branch. | `git cherry-pick abc123` |
| `git stash` | Shelves uncommitted changes temporarily. Use `pop` to restore. | `git stash` then `git stash pop` |

### ☁️ Remote Collaboration

| Command | Description | Example Usage |
|---|---|---|
| `git fetch` | Downloads changes from remote without merging. | `git fetch origin` |
| `git pull` | Downloads and merges remote changes (fetch + merge). | `git pull origin main` |
| `git push` | Uploads local commits to a remote repository. | `git push origin main` |
| `git push -u` | Pushes and sets upstream tracking for the branch. | `git push -u origin feature-auth` |
| `git remote -v` | Shows configured remote repositories with URLs. | `git remote -v` |
| `git tag` | Creates or lists tags (version markers) for releases. | `git tag v1.0.0` |

### 🔧 Advanced & Troubleshooting

| Command | Description | Example Usage |
|---|---|---|
| `git reflog` | Shows a history of all HEAD movements (recover lost commits). | `git reflog` |
| `git bisect` | Binary search to find the commit that introduced a bug. | `git bisect start` |
| `git revert` | Creates a new commit that undoes a previous commit (safe undo). | `git revert abc123` |
| `git reset --hard` | Resets the working directory and staging to a previous state (⚠️ destructive). | `git reset --hard HEAD~1` |
| `git clean` | Removes untracked files from the working directory. | `git clean -fd` |
| `git grep` | Searches for patterns across all files in the repository. | `git grep "TODO"` |

> **💡 Git Aliases:** Speed up your workflow by creating aliases:
> ```bash
> git config --global alias.co checkout
> git config --global alias.br branch
> git config --global alias.st status
> git config --global alias.lg "log --oneline --graph --all"
> ```

### 🧪 Knowledge Check: Git Commands

**1. Which command initializes a new Git repository in the current directory?**

- [x] git init
- [ ] git start
- [ ] git create
- [ ] git new

**2. What does `git status` show?**

- [ ] The commit history.
- [x] The current state of the working directory and staging area.
- [ ] Remote repository URLs.
- [ ] Configured Git aliases.

**3. Which command downloads changes from a remote repository and merges them into the current branch?**

- [ ] git fetch
- [x] git pull
- [ ] git push
- [ ] git clone

**4. How do you create and switch to a new branch called "feature-login" in one command?**

- [ ] git branch feature-login
- [ ] git switch feature-login
- [x] git checkout -b feature-login
- [ ] git new-branch feature-login

**5. Which command temporarily shelves uncommitted changes so you can switch branches?**

- [ ] git shelve
- [ ] git save
- [x] git stash
- [ ] git hide

---

## 8. 📌 Quick Reference Summary

| Command | Description |
|---|---|
| `grep -r "pattern" ./` | Search recursively for text in files |
| `find . -name "*.js"` | Find files by name pattern |
| `sed -i 's/old/new/g' file` | Find and replace in file (in-place) |
| `tail -f app.log` | Stream log file in real-time |
| `ps aux \| grep node` | Find running Node.js processes |
| `chmod +x script.sh` | Make a script executable |
| `curl -I https://example.com` | Fetch HTTP headers from a URL |
| `git log --oneline --graph` | Visualize commit history with branches |
| `git stash && git pull` | Stash changes, then pull remote updates |
| `git branch -d feature` | Delete a local branch (after merging) |
| `df -h && du -sh *` | Check disk usage at system and folder level |
| `tar -czvf backup.tar.gz folder/` | Create a compressed archive of a folder |

> **🚀 Productivity Tip:** Combine commands with pipes (`|`) to chain them:
> ```bash
> # Find top 5 largest files in the current directory
> find . -type f -exec du -h {} + | sort -rh | head -5
> 
> # Count occurrences of "error" in all log files
> grep -r "error" *.log | wc -l
> ```

---

*Happy Coding! 🚀*