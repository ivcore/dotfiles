#!/bin/sh
# PNG Gamma trick (by @marcan42 / marcan@marcan.st)
#
# This script implements an improved version of the gamma trick used to make
# thumbnail images on reddit/4chan look different from the full-size image.
#
# Sample output (SFW; images by @Miluda):
#  https://mrcn.st/t/homura_gamma_trick.png
#  https://www.reddit.com/r/test/comments/6edthw/ (click for fullsize)
#  https://twitter.com/marcan42/status/869855956842143744
#
# Some backstory, explanation and example (slightly NSFW):
#  https://www.reddit.com/r/touhou/comments/6e6lga/a/di83t02/
#
# No idea who came up with the concept; this is an old trick, but past
# implementations I've seen were less correct than this one :-)
#
# This trick works on at least Reddit, 4chan and similar imageboards, Google
# Drive, and probably many others. It does not work on Twitter, as Twitter
# always preprocesses PNG images and strips the gAMA chunk. It does, however,
# work with e.g. imgur embed previews on Twitter.
#
# *Different* one-liner trick that works on Twitter (for grayscale images):
#  https://twitter.com/marcan42/status/869858577116086272
#
# License: public domain

high="$1" # High image (full-size original view)
low="$2" # Low image (thumbnail) (should be the same size)

output="output.png"
if [ ! -z "$3" ]; then
    output="$3" # Output image
fi

size="$(convert "$high" -format "%wx%h" info:)"

# Give a slight brightness boost to the high source, then apply the gamma.
# This ensures that the pixels look mostly white.
convert "$high" -alpha off +level 3.5%,100% -gamma 20 high_gamma.png

# Since the low image will be washed out, use gamma to darken it a bit, then
# reduce its brightness to ensure that its pixels become black after PNG gamma.
# 77% brightness gets crushed down to 0x00 or 0x01, enough for our purposes.
low_gamma="-alpha off -gamma 0.8 +level 0%,77%"

# To get rid of the slight "halo" of the high image, we're going to cancel it
# out from the low image. The equation that we need is:
#   output = ¾low + ¼                (what we want, for high = white)
#   output = ¾output_low + ¼high     (what we get)
# Solve for output_low:
#   ¾output_low + ¼high = ¾low + ¼
#   ¾output_low = ¾low + ¼ - ¼high
#   output_low = low + ⅓ - ⅓high
# This assumes "dumb" resizing (not gamma-correct). For gamma-correct resizing,
# or for viewing at 1:1 (which is equivalent to gamma-correct resizing, because
# physics, assuming your monitor isn't mangling things), this operation would
# have to be done in a linear colorspace. In practice, the vast majority of
# resizing implementations are not gamma-correct, so this works.
convert \( "$low" "$low_gamma" \) high_gamma.png \
           -compose Mathematics -define compose:args='0,-0.33,1,0.33' \
           -composite low_adjusted.png

# Now compose both images together using the mask, then set the gamma metadata.
# Note that the typical display gamma is 2.2 and image gamma is the reciprocal
# 1/2.2. Since we're adding a gamma of 20, we need 1/2.2/20 = 0.022727.
# We also force the PNG encoder to include the gAMA chunk (and no other
# spurious metadata).
convert low_adjusted.png high_gamma.png -size "$size" pattern:gray25 -composite \
        -set gamma 0.022727 -define png:include-chunk=none,gAMA "$output"
