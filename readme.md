# Imagemagicのshadow
![](https://raw.githubusercontent.com/yKesamaru/merge.png)

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/graph.png)
![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/graph_2.png)
![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/graph_2_no_shadow.png)
![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/graph_2_shadow.png)

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/last.png)  
  
# 環境

```bash:version
convert -version
Version: ImageMagick 6.9.7-4 Q16 x86_64 20170114 http://www.imagemagick.org
Copyright: © 1999-2017 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC Modules OpenMP 
Delegates (built-in): bzlib djvu fftw fontconfig freetype jbig jng jpeg lcms lqr ltdl lzma openexr pangocairo png tiff wmf x xml zlib

lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 18.04.6 LTS
Release: 18.04
Codename: bionic
```

```bash:-shadow
convert input.png \( +clone -background black -shadow 100x3-1-1 \) +swap -background none -layers merge +repage output.png
```

```bash:other
convert -page +4+4 input.png -alpha set \( +clone -background black -shadow 60x8+8+8 \) +swap -background none -mosaic "new.png"

convert input.png -bordercolor white -border 13 \( +clone -background black -shadow 80x3+2+2 \) +swap -background white -layers merge +repage output.jpg

convert -page +4+4 input.png -alpha set \( +clone -background black -shadow 60x8+8+8 \) \
+swap -background none -mosaic "new.png"
```

# Options

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/input.png)  
  
```bash
convert input.png -shadow 80% shadow_80.png
```

> -shadow percent-opacity{xsigma}{+-}x{+-}y{%}  

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/shadow_80_screen_capture.png)  
  
```bash
convert input.png -shadow 80%x3 shadow_80x3.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/shadow_80x3_screen_capture.png)  

```bash
convert input.png \( +clone -background black -shadow 100x3+10+10 \) clone.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/clone-0.png)  
![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/clone-1.png)  

```bash
convert input.png \( +clone -background black -shadow 100x3+10+10 \) -layers merge +repage merge.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/merge.png)  

```bash
convert input.png \( +clone -background black -shadow 100x3+10+10 \) -layers merge +repage +swap swap.png
```

```bash
convert-im6.q16: no such image `input.png' @ error/mogrify.c/MogrifyImageList/8787.
```

```bash
convert input.png \( +clone -background black -shadow 100x3+10+10 \) +swap -layers merge +repage swap.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/swap.png)  

```bash
convert input.png \( +clone -background black -shadow 100x3+10+10 \) +swap -background none -layers merge +repage bg_none.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/bg_none.png)

```bash
convert input.png \( +clone -background black -shadow 100x3-1-1 \) +swap -background none -layers merge +repage last.png
```

![](https://raw.githubusercontent.com/yKesamaru/imagemagick_shadow/master/last.png)

-clone index(s)

Make a clone of an image (or images).

Inside parenthesis (where the operator is normally used) it will make a clone of the images from the last 'pushed' image sequence, and adds them to the end of the current image sequence. Outside parenthesis (not recommended) it clones the images from the current image sequence.

Specify the image by its index in the sequence. The first image is index 0. Negative indexes are relative to the end of the sequence; for example, −1 represents the last image of the sequence. Specify a range of images with a dash (e.g. 0−4). Separate multiple indexes with commas but no spaces (e.g. 0,2,5). A value of '0−−1 will effectively clone all the images.

The +clone will simply make a copy of the last image in the image sequence, and is thus equivalent to using an argument of '−1'.

-shadow percent-opacity{xsigma}{+-}x{+-}y{%}

Simulate an image shadow.

-background color

Set the background color.

The color is specified using the format described under the -fill option. The default background color (if none is specified or found in the image) is white.

-swap index,index

Swap the positions of two images in the image sequence.

For example, -swap 0,2 swaps the first and the third images in the current image sequence. Use +swap to switch the last two images in the sequence.

-background color

Set the background color.

The color is specified using the format described under the -fill option. The default background color (if none is specified or found in the image) is white.

-layers method

Handle multiple images forming a set of image layers or animation frames.

Perform various image operation methods to a ordered sequence of images which may represent either a set of overlaid 'image layers', a GIF disposal animation, or a fully-'coalesced' animation sequence.
merge  As 'flatten' method but merging all the given image layers to create a new layer image just large enough to hold all the image without clipping or extra space. The new images virtual offset will preserve the position of the new layer, even if this offset is negative. The virtual canvas size of the first image is preserved.
mosaic  As 'flatten' method but expanding the initial canvas size of the first image in a positive direction only so as to hold all the image layers. However as a virtual canvas is 'locked' to the origin, by its own definition, image layers with a negative offsets will still become clipped by the top and left edges. See 'merge' or 'trim-bounds' if this could be a problem.
Caution is advised when handling image layers with negative offsets as few image file formats handle them correctly. Following this operation method with +repage will remove the layer offset, and create an image in which all the overlaid image positions relative to each other is preserved, though not necessarily exactly where you specified them.
Use +repage to completely remove/reset the virtual canvas meta-data from the images.

To print a complete list of layer types, use -list layers.

The operators -coalesce, -deconstruct, -flatten, and -mosaic are only aliases for the above methods and may be deprecated in the future. Also see -page, -repage operators, the -compose setting, and the GIF -dispose and -delay settings.

# Reference

<https://imagemagick.org/script/command-line-options.php>
