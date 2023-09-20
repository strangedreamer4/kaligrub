#!/bin/bash

echo "Enter the path to the background image (e.g., /path/to/your/background_image.jpg):"
read BACKGROUND_IMAGE

# Check if the image file exists
if [ ! -f "$BACKGROUND_IMAGE" ]; then
    echo "Error: Background image not found at $BACKGROUND_IMAGE"
    exit 1
fi

# Copy the image to the GRUB directory
sudo cp "$BACKGROUND_IMAGE" /boot/grub/

# Edit the GRUB configuration file
sudo sed -i '/^GRUB_BACKGROUND=/d' /etc/default/grub
echo "GRUB_BACKGROUND=\"/boot/grub/$(basename "$BACKGROUND_IMAGE")\"" | sudo tee -a /etc/default/grub > /dev/null

# Update GRUB to apply the changes
sudo update-grub

echo "GRUB background image has been changed to $BACKGROUND_IMAGE"
echo "Please reboot your system to see the new background."

exit 0
