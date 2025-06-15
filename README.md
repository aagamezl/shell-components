# Shell Components

A collection of reusable shell script components that provide interactive UI elements for terminal applications. These components are designed to be easily integrated into your shell scripts to enhance user interaction and improve the overall user experience.

## Components

### 1. Single List Component
- **Description**: Provides a single-selection list interface in the terminal
- **Features**:
  - Interactive cursor-based selection
  - Clear visual feedback for selected items
  - Keyboard navigation support
  - Clean terminal handling

### 2. Multiple List Component
- **Description**: Provides a multiple-selection list interface in the terminal
- **Features**:
  - Select multiple items using spacebar
  - Keyboard navigation
  - Visual selection indicators
  - Clean terminal state management

## Installation

You can install Shell Components using the following command:

```bash
wget -qO- https://raw.githubusercontent.com/aagamezl/shell-components/master/install.sh | bash
```

The installation script will:
- Create installation directory at `~/.local/share/shell-components`
- Install required dependencies
- Set up the components

## Usage

### Using Components in Your Project

1. Source the required component:
```bash
source ~/.local/share/shell-components/components/single-list.sh
```

2. Call the component function with your options:
```bash
selected=$(show_menu "Option 1" "Option 2" "Option 3")
echo "You selected: $selected"
```

### Color Utilities
The project includes color utilities that can be sourced to enhance your terminal output:
```bash
source ~/.local/share/shell-components/utils/colors.sh
```

## Installation Location
Components are installed in: `~/.local/share/shell-components`

## Project Structure
```
shell-components/
├── components/
│   ├── single-list.sh
│   └── multiple_list.sh
├── utils/
│   └── colors.sh
└── install.sh
```

## License
This project is licensed under the GNU Affero General Public License v3.0 - see LICENSE file for details.

## Author
Álvaro José Agámez Licha - aagamezl

## Contributing
Feel free to open issues or submit pull requests if you'd like to contribute to this project.