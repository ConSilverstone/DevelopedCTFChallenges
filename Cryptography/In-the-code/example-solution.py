"""
Hex-Imager.

This module provides functionality for converting hexedecimal data into images.

Note:
    This tool requires;
    pillow,
    binascii,
    io
    modules to function.
"""

from PIL import Image # From the Pyphon Imaging Library import the Image function
from binascii import unhexlify # Module to convert to byes using unhexify function.
from io import BytesIO

hex_file = "communications.txt"
output_image = "reconstructed_image.png"

# Read file
with open(hex_file, "r") as f:
    hex_data = f.read()

# Split by whitespace (handles spaces/newlines/tabs)
hex_list = hex_data.split()

# Join into one continuous hex string
hex_string = "".join(hex_list)

# Convert hex into bytes
image_bytes = unhexlify(hex_string)

# Load image from bytes
image = Image.open(BytesIO(image_bytes))

# Save image
image.save(output_image)

print("Done:", output_image)