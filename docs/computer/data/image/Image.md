# Image 

## What is an Image

An **image** is a visual representation of an object, scene, or concept, captured or created through physical or digital means.

Unlike human vision, which is dynamic, adaptive, and deeply interpretative, an **image** is a static or recorded depiction that lacks real-time perception, depth awareness, and contextual understanding.

**Images** can be captured, created, or stored using various methods, such as photography, painting, or digital rendering.

**Images** can be **analog** (paintings, photographs) or **digital** (bitmap, vector graphics)

## Types of Digital Images

### **Types of Digital Images**  

| **Type** | **Definition** | **Representation in Binary** | **Best For** | **Formats** |
|------------|-------------|--------------------|------------|------------|
| **Raster (Bitmap)** | Made of individual pixels, each storing color information. Fixed resolution, loses quality when scaled. | Stored as a grid of pixel values, where each pixel has color channels (e.g., RGB: 8-bit per channel = 24-bit per pixel). | Photos, digital art | JPEG, PNG, GIF, BMP, TIFF |
| **Vector** | Uses mathematical formulas to define shapes, lines, and colors. Infinitely scalable without losing quality. | Described using geometric formulas (points, lines, curves) stored as mathematical expressions instead of pixel data. | Logos, icons, illustrations | SVG, AI, EPS, PDF |
| **3D Images** | Represents 3D objects using meshes, textures, and lighting. Used in 3D modeling and rendering. | Meshes: Stored as lists of vertices and edges. Textures: Stored as raster images mapped onto the surface. Lighting: Stored as mathematical models. | Games, animation, 3D printing | OBJ, FBX, STL |
| **HDR Images** | Stores a wider range of brightness and color data for high-quality lighting and shading. Used in photography and VFX. | Uses **floating-point precision** (e.g., 16-bit or 32-bit per channel) to store high dynamic range pixel values instead of standard 8-bit integers. | Photography, cinema, gaming | HDR, EXR |

## How to Represent a Raster Image in Binary

### Representation

- An Raster Image is represent in computer using tiny dots (**pixels**) arranged in a grid.

- Each pixel has a **color** value, represented in binary using diferrent **color models**.

- The **color** value of a **pixel** is an **approximation** because computers use a limited number of bits to represent a continuous range of colors, just like [floating-point] numbers approximate real [numbers].

#### What is a Color

**Color** is the perception of different wavelengths of light by the human eye and brain.

It is a visual property that arises when light interacts with objects and is either absorbed, reflected, or emitted.

**Example:** A wavelength of 495 nm can be mapped to a color value, approximated as #00FF00 in a 24-bit RGB representation.

#### Common Color Models

| **Color Model** | **Idea (Channels & Meaning)** | **Use Case** |
|---------------|--------------------------------|-------------|
| **RGB** (Red, Green, Blue) | Additive model; combines light to form colors. Each channel represents intensity of red, green, and blue (0–255 for 8bit each channel). | Digital screens (monitors, TVs, cameras). |
| **CMYK** (Cyan, Magenta, Yellow, Black) | Subtractive model; absorbs light. Cyan, Magenta, Yellow control color, Black (K) adds depth. | Printing (magazines, paper). |
| **HSL** (Hue, Saturation, Lightness) | Hue (color, 0°–360°), Saturation (color intensity, 0%–100%), Lightness (brightness, 0%–100%). | Graphic design, color selection. |
| **HSV** (Hue, Saturation, Value) | Similar to HSL, but Value represents brightness differently. | Image editing, UI design. |
| **YUV / YCbCr** | Y (Luminance), U/Cb (Blue Chrominance), V/Cr (Red Chrominance). Separates brightness from color. | Video compression (JPEG, MPEG, HDTV). |
| **LAB (CIELAB)** | L (Lightness), A (Green–Red), B (Blue–Yellow). Designed to match human vision. | High-precision color correction, photography. |  

### Storage & Compression

Images can be stored in computer in different ways:

- Raw (BMP, TIFF): Stores every pixel's binary value directly (no compression).
- Compressed (JPEG, PNG, GIF): Uses algorithms to reduce file size.
    - Lossless Compression (PNG) retains all data.
    - Lossy Compression (JPEG) removes less noticeable details.

## History of Images

1. Early Beginnings (Pre-19th Century)  
   - Cave Paintings: Earliest visual representations (~30,000 years ago).  
   - Ancient Art: Ancient Egyptians, Greeks, and Romans depicted gods and historical events.

2. Invention of Photography (19th Century)  
   - 1826: Joseph Nicéphore Niépce captured the first permanent photograph ("View from the Window at Le Gras").  
   - 1839: Louis Daguerre developed the daguerreotype, the first commercially successful photographic process.  
   - 1850s: Albumen prints and wet collodion process improved photographic clarity.  
   - 1871: Richard Leach Maddox introduced the dry plate process, making photography portable.

3. Color Photography and Film (20th Century)  
   - 1907: Autochrome plate introduced the first commercial color photography process.  
   - 1935: Kodachrome film became popular for vibrant color photographs.

4. Modern Era (Digital Age - 21st Century)  
   - Digital Photography (1990s–Present): Transition from film-based to digital photography with digital sensors (CCD, CMOS).  
   - 2000s: Rise of smartphone cameras, making photography ubiquitous.  
   - High-resolution sensors (e.g., 4K, 8K, and beyond) for sharper images.

5. Image Editing and Software (1990s–Present)  
   - Software like Adobe Photoshop revolutionized image editing and manipulation.  
   - AI and Machine Learning now power many tools for automatic enhancement, deepfakes, and style transfers.

6. 3D Imaging and Rendering (2000s–Present)  
   - Advancements in 3D rendering technology for film, gaming, and virtual reality (VR).  
   - Augmented Reality (AR) and Mixed Reality (MR) are increasingly using image data for immersive experiences.

7. High Dynamic Range (HDR) and 3D Imaging  
   - HDR imaging has become common in photography and cinema, providing better contrast and color range.  
   - 3D scanning and printing continue to grow in popularity for entertainment, engineering, and manufacturing.

[floating-point]: ../number/FloatingPoint
[numbers]: ../number/Number

