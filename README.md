# Continuously Integrated Home IoT

Stack:

- esphome
- Jenkins
- Github

## Project Structure

This project organizes ESPHome device configurations by functional category:

```
/projects/esphome_Jenkins/
├── config/           # Base configurations (wifi, common settings)
├── fccid/            # FCC ID base templates
├── devices/          # Device-specific configurations
│   ├── plugs/        # Smart plugs
│   ├── lights/       # Smart lights/bulbs
│   ├── safety/       # Safety equipment
│   └── other/        # Miscellaneous devices
├── docs/
│   └── requirements/ # StrictDoc requirements documentation
├── include/          # Additional device templates
├── Makefile
└── README.md
```

## Device Configurations

### Smart Plugs
- **TV Plug**: Standard smart plug for TV power control
- **Hot Water Plug**: Auto-reactivation plug (30s delay) for hot water systems
- **Dryer Fan Plug**: Auto-reactivation plug (30s delay) for dryer ventilation
- Various FEIT and Vivitar smart plugs

### Smart Lights
- FEIT RGB bulbs and BR30 lights
- Merkury smart bulbs
- Various outdoor and indoor lighting solutions

### Safety Equipment
- CNC machine safety controls
- Other safety-related devices

## Requirements Documentation

Project requirements are documented using StrictDoc format in `docs/requirements/`:
- Project structure requirements
- Device configuration standards
- Automation behavior specifications
- Makefile requirements

