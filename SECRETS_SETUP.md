# ESPHome Secrets Setup

This project uses ESPHome with WiFi configuration that requires a `secrets.yaml` file to store sensitive information like WiFi credentials.

## Quick Setup

1. **Copy the template file:**
   ```bash
   cp secrets.yaml.example secrets.yaml
   ```

2. **Edit the secrets file with your actual values:**
   ```bash
   nano secrets.yaml
   ```

3. **Fill in your WiFi credentials:**
   - Replace `YourPrimaryWiFiSSID` with your actual WiFi network name
   - Replace `YourPrimaryWiFiPassword` with your actual WiFi password
   - Optionally configure secondary and tertiary networks for failover

## Required Secrets

The following secrets are referenced in the configuration files:

- `wifi_ssid` - Primary WiFi network name
- `wifi_password` - Primary WiFi password
- `wifi_ssid2` - Secondary WiFi network name (optional)
- `wifi_password2` - Secondary WiFi password (optional)
- `wifi_ssid3` - Tertiary WiFi network name (optional)
- `wifi_password3` - Tertiary WiFi password (optional)
- `api_password` - API password for ESPHome Dashboard/Home Assistant
- `ota_password` - OTA password for secure over-the-air updates (optional)

## Building and Uploading

Once you have created your `secrets.yaml` file, you can build and upload from the project root:

```bash
# From the project root directory
esphome upload --device 192.168.0.44 devices/plugs/tv_plug.yaml
```

Or from the device directory:

```bash
# From the device directory
cd devices/plugs/
esphome upload --device 192.168.0.44 tv_plug.yaml
```

## Security Notes

- **Never commit `secrets.yaml` to version control** - it's already in `.gitignore`
- Keep your `secrets.yaml` file secure and don't share it
- Use strong passwords for API and OTA access
- Consider using different passwords for different environments (development, production)

## Troubleshooting

If you get errors about missing secrets files:

1. Ensure `secrets.yaml` exists in the project root
2. Check that all required secrets are defined in the file
3. Verify the YAML syntax is correct (no tabs, proper indentation)
4. Make sure you're running ESPHome from the correct directory
