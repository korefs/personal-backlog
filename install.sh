#!/bin/bash
"""
Personal Backlog CLI installation script
"""

echo "🎯 Installing Personal Backlog CLI..."

# Installation directory
INSTALL_DIR="/usr/local/bin"

# Check write permissions
if [ ! -w "$INSTALL_DIR" ]; then
    echo "❌ Permission denied for $INSTALL_DIR"
    echo "💡 Run: sudo ./install.sh"
    exit 1
fi

# Copy files
cp backlog "$INSTALL_DIR/backlog"
cp bl "$INSTALL_DIR/bl"

# Set permissions
chmod +x "$INSTALL_DIR/backlog"
chmod +x "$INSTALL_DIR/bl"

echo "✅ Personal Backlog CLI installed successfully!"
echo ""
echo "📖 USAGE:"
echo "  backlog --help    # View complete help"
echo "  bl --help         # Same command with alias"
echo ""
echo "🚀 QUICK EXAMPLE:"
echo "  backlog -n my-project      # Create backlog"
echo "  backlog -a my-project      # Set as active"
echo "  backlog 'New feature'      # Add task"
echo "  backlog -l                 # List backlogs"
echo "  backlog -t                 # List tasks"