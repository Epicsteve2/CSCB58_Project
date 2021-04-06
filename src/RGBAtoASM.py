"""
made by Stephen Guo
Works for PNG images in RGBA format, probably works in RGB format too
you can check by adding:
    print(image.mode)
after opening the image.
"""

from PIL import Image

image = Image.open("titleBetter.png")
index = 0
previousColor = ""

print("li $v0, 32		# syscall for sleeping for 30 ms")
print("li $a0, 30")
print("addi $t4, $zero, BASE_ADDRESS")

for x in range(0, 64):
    for y in range(0, 64):
        currentPixel = image.getpixel((y, x))
        hexColor = "0x%02x%02x%02x" % (  # gets current pixel color in hex
            currentPixel[0],
            currentPixel[1],
            currentPixel[2],
        )

        print("addi $t3, $t4,", 4 * index)
        if previousColor != hexColor:  # saves memory by not writing the same colors
            print("li $t5,", hexColor)
        previousColor = hexColor
        print("sw $t5, 0($t3)")  # stores color

        index += 1
    print("syscall      # sleeps for 30 ms")
