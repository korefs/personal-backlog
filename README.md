# 🎯 Personal Backlog CLI

A simple and efficient personal backlog manager for the command line. Organize your tasks, projects and ideas quickly and intuitively.

## ✨ Features

- 📋 **Multiple backlogs**: Create and manage different backlogs for distinct projects
- 🎯 **Active backlog**: Set a default backlog to add tasks quickly
- 🔢 **Unique IDs**: Each task has a unique ID for easy reference
- 🔄 **Task movement**: Move tasks between backlogs without complications
- ✅ **Completion status**: Mark tasks as completed
- 🔍 **Status filtering**: Filter tasks by status (pending, done, completed)
- 🚀 **Short alias**: Use `bl` as shortcut for `backlog`
- 💾 **Local persistence**: Data saved in `~/.personal-backlog/`

## 🚀 Installation

### Requirements

- **Python 3** (3.6 or higher)

### Quick Installation (Recommended)

```bash
# Download and install directly from GitHub
curl -fsSL https://raw.githubusercontent.com/korefs/personal-backlog/main/install.sh | sudo bash
```

### Manual Installation

```bash
# Clone or download the files
git clone https://github.com/korefs/personal-backlog.git
cd personal-backlog

# Run the installer
sudo ./install.sh
```

### Local Usage

```bash
# Make files executable
chmod +x backlog bl

# Use directly
./backlog --help
./bl --help
```

## 📖 Usage

### Basic Commands

```bash
# Create a new backlog
backlog -n work
backlog -n personal

# Set active backlog
backlog -a work

# Add tasks (to active backlog)
backlog "Implement feature X"
backlog "Fix API bug"
backlog "Review documentation"

# List backlogs
backlog -l

# List tasks from active backlog
backlog -t

# List tasks from a specific backlog
backlog -t personal

# Filter tasks by status
backlog -s pending              # Show only pending tasks from active backlog
backlog -s done                 # Show only completed tasks from active backlog
backlog -t work -s completed    # Show only completed tasks from 'work' backlog
```

### Task Management

```bash
# Move task between backlogs
backlog -m 5 personal    # Move task #5 to 'personal' backlog

# Mark task as completed
backlog -c 3            # Complete task #3

# View complete help
backlog --help
```

### Using the Alias

```bash
# All commands work with 'bl'
bl -n new-project
bl "New important task"
bl -l
bl -t
```

## 🌟 Usage Examples

### Complete Flow

```bash
# 1. Create backlogs for different contexts
backlog -n work
backlog -n studies
backlog -n home

# 2. Set work backlog as active
backlog -a work

# 3. Add some tasks
backlog "Implement JWT authentication"
backlog "Write unit tests"
backlog "Deploy to production"

# 4. View current status
backlog -l
# 📋 Available backlogs:
#   • home - 0 task(s)
#   • studies - 0 task(s)
#   • work (active) - 3 task(s)

# 5. View tasks from active backlog
backlog -t
# 📋 Tasks from 'work' backlog:
#   ⏳ #1: Implement JWT authentication
#   ⏳ #2: Write unit tests
#   ⏳ #3: Deploy to production

# 6. Complete a task
backlog -c 1

# 7. Move task to another backlog
backlog -m 3 studies
```

### Usage Scenarios

#### Developer
```bash
bl -n frontend
bl -n backend
bl -n devops
bl -a backend
bl "Implement user API"
bl "Optimize database queries"
```

#### Student
```bash
bl -n math
bl -n programming
bl -n english
bl -a programming
bl "Study sorting algorithms"
bl "Practice recursion exercises"
```

#### Personal Use
```bash
bl -n home
bl -n shopping
bl -n projects
bl -a home
bl "Fix kitchen faucet"
bl "Organize office"
```

## 📂 Data Structure

Data is saved in `~/.personal-backlog/`:

```
~/.personal-backlog/
├── config.json          # Configuration (active backlog, next ID)
└── backlogs/
    ├── work.json         # 'work' backlog
    ├── personal.json     # 'personal' backlog
    └── ...
```

### Data Format

**config.json**
```json
{
  "active_backlog": "work",
  "next_task_id": 10
}
```

**backlogs/work.json**
```json
{
  "name": "work",
  "created": "2024-01-15T10:30:00",
  "tasks": [
    {
      "id": 1,
      "description": "Implement feature X",
      "created": "2024-01-15T10:35:00",
      "status": "done",
      "completed": "2024-01-15T15:20:00"
    },
    {
      "id": 2,
      "description": "Fix bug Y",
      "created": "2024-01-15T11:00:00",
      "status": "pending"
    }
  ]
}
```

## 🔧 Command Reference

| Command | Description | Example |
|---------|-------------|---------|
| `backlog -n <name>` | Create new backlog | `backlog -n work` |
| `backlog -a <name>` | Set active backlog | `backlog -a work` |
| `backlog <description>` | Add task to active backlog | `backlog "New feature"` |
| `backlog -l` | List all backlogs | `backlog -l` |
| `backlog -t [backlog]` | List tasks | `backlog -t` or `backlog -t personal` |
| `backlog -s <status>` | Filter tasks by status | `backlog -s pending` |
| `backlog -m <id> <target>` | Move task to another backlog | `backlog -m 5 personal` |
| `backlog -c <id>` | Mark task as completed | `backlog -c 3` |
| `backlog -h, --help` | Show help | `backlog --help` |

## 💡 Tips and Tricks

### Productivity
- Use quotes for descriptions with spaces: `backlog "Task with multiple words"`
- Keep an active backlog to add tasks quickly
- Use IDs to reference tasks in discussions: "I'll work on task #5"
- Filter tasks by status to focus on specific work: `backlog -s pending`
- Combine backlog and status filters: `backlog -t work -s done`

### Organization
- Create backlogs by project, context or life area
- Use descriptive prefixes: `backlog -n mobile-app`, `backlog -n personal-site`
- Move completed tasks to an "archive" backlog if you want to keep history

### Integration with Other Tools
```bash
# Add task based on Git issue
backlog "Fix: $(git log -1 --pretty=format:'%s')"

# Backup backlogs
tar -czf backlog-backup-$(date +%Y%m%d).tar.gz ~/.personal-backlog/

# List pending tasks from all backlogs
for backlog in ~/.personal-backlog/backlogs/*.json; do
  echo "=== $(basename "$backlog" .json) ==="
  backlog -t "$(basename "$backlog" .json)" -s pending
done

# Show daily standup - what's done and what's pending
echo "✅ COMPLETED:"
backlog -s done
echo ""
echo "⏳ TODO:"
backlog -s pending
```

## 🔍 Troubleshooting

### Permissions
If the command doesn't work after installation:
```bash
# Check if it's in PATH
which backlog

# Check permissions
ls -la /usr/local/bin/backlog

# Reinstall if needed
sudo ./install.sh
```

### Corrupted Data
If there are problems with the data:
```bash
# Check structure
ls -la ~/.personal-backlog/

# Reset configuration (WARNING: deletes all data)
rm -rf ~/.personal-backlog/
```

## 🤝 Contributing

1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/new-functionality`)
3. Commit your changes (`git commit -am 'Add new functionality'`)
4. Push to the branch (`git push origin feature/new-functionality`)
5. Open a Pull Request

## 📋 Roadmap

- [x] Filters by status (pending, completed)
- [ ] Task priorities
- [ ] Dates and deadlines
- [ ] Export to CSV/JSON
- [ ] Git hooks integration
- [ ] Optional web interface
- [ ] Sync with external services (Trello, GitHub Issues)

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

---

**Happy coding!** 🚀