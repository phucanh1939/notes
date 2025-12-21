# Basic Graphics Pipeline

## Overview (Data Flow Graph)

[ Mesh Data (Object / Local Space) ]
            |
            v
[ Model Transform ]
            |
            v
[ World Space Vertices ]
            |
            v
[ View Transform (Camera) ]
            |
            v
[ View Space Vertices ]
            |
            v
[ Projection Transform ]
            |
            v
[ Clip Space ]
            |
            v
[ Perspective Divide + Viewport Transform ]
            |
            v
[ Screen-Space Triangles (2D + Depth) ]
            |
            v
[ Rasterization (Coverage Sampling) ]
            |
            v
[ Fragments (Depth, UV, Normal, Color) ]
            |
            v
[ Fragment Shading + Texture Sampling ]
            |
            v
[ Final Pixels ]
            |
            v
[ Framebuffer → Image ]


## Pipeline Explanation

The graphics pipeline is a **data transformation pipeline**.  
Each stage **takes structured data as input**, transforms it into a new representation,  
then **passes the result to the next stage**.

---

### 1. Mesh Data → World Space
**Input**
- Mesh vertices in **object/local space**
- Per-vertex attributes (normal, UV, color)

**Process**
- Apply **model (spatial) transformation**:
  - Translation
  - Rotation
  - Scaling

**Output**
- Vertices expressed in **world space**

---

### 2. World Space → View Space (Camera)
**Input**
- World-space vertices

**Process**
- Apply the **view matrix**
- Convert coordinates from the world’s reference frame into the **camera’s reference frame**

**Output**
- Vertices in **view (camera) space**

---

### 3. View Space → Clip Space (Projection)
**Input**
- View-space vertices

**Process**
- Apply **projection transformation** (Perspective or orthographic)
- Encode depth information for visibility

**Output**
- Vertices in **clip space**

---

### 4. Clip Space → Screen-Space Triangles
**Input**
- Clip-space vertices

**Process**
- **Perspective divide** (normalize coordinates)
- **Viewport transform** (map to screen resolution)

**Output**
- **2D triangles in screen space**
- Each vertex still carries depth and interpolated attributes

---

### 5. Screen-Space Triangles → Fragments (Rasterization)
**Input**
- 2D screen-space triangles

**Process**
- **Rasterization**, treated as a **sampling problem**
- For each pixel:
  - Sample a **coverage function** to determine triangle coverage
- Interpolate vertex attributes across the triangle

**Output**
- **Fragments** (potential pixels)
- Each fragment has:
  - Depth
  - UV
  - Normal
  - Color

---

### 6. Fragments → Final Pixels (Shading + Textures)
**Input**
- Fragments with interpolated data

**Process**
- Run **fragment shader**
- Sample **textures** using UVs
- Apply lighting and material equations

**Output**
- Final **fragment color**

---

### 7. Final Pixels → Image
**Input**
- Shaded fragments

**Process**
- Depth testing (visibility)
- Blending (transparency)
- Write passing fragments to framebuffer

**Output**
- **Final image** displayed on screen

---

### Key Idea
The pipeline progressively converts:

**Geometry → 2D samples → colored pixels**

Each stage:
- Reduces dimensionality (3D → 2D → pixels)
- Adds information (depth, lighting, texture)
- Prepares data for the next stage
