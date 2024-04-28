if ! command -v python3 &>/dev/null; then
    echo "Python is not installed. Installing Python..."
    
    # Install Python using the appropriate package manager
    # For Ubuntu/Debian-based systems
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install -y python3
    # For CentOS/RHEL-based systems
    elif command -v yum &>/dev/null; then
        sudo yum install -y python3
    else
        echo "Unsupported operating system. Please install Python manually."
        exit 1
    fi
fi

# Check if pip is installed
if ! command -v pip3 &>/dev/null; then
    echo "pip is not installed. Installing pip..."
    
    # Install pip for Python 3
    sudo apt install -y python3-pip  # For Ubuntu/Debian-based systems
    # Or sudo yum install -y python3-pip for CentOS/RHEL-based systems
fi

pip install -r requirements.txt
python3.9 manage.py collectstatic