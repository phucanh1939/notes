# Basic Graphics Pipeline

The graphics pipeline is best understood as a **data transformation pipeline**.

At every stage, data:

* Comes in with a clear structure
* Is transformed into a new representation
* Is passed forward to the next stage

We start with abstract 3D geometry (just numbers), and step by step, we turn it into **colored pixels on the screen**.

---

## High-Level Flow

```
Mesh Data (Object / Local Space)
        |
        v
Model Transform
        |
        v
World Space Vertices
        |
        v
View Transform (Camera)
        |
        v
View Space Vertices
        |
        v
Projection Transform
        |
        v
Clip Space
        |
        v
Perspective Divide + Viewport Transform
        |
        v
Screen-Space Triangles (2D + Depth)
        |
        v
Rasterization (Coverage Sampling)
        |
        v
Fragments (Depth, UV, Normal, Color)
        |
        v
Fragment Shading + Texture Sampling
        |
        v
Final Pixels
        |
        v
Framebuffer → Image
```

---

## 1. Mesh Data → World Space

**Question this stage answers:** *Where is this object placed in the world?*

### Input

* Mesh vertices in **object / local space**
* Per-vertex attributes (normal, UV, color, etc.)

At this point, the mesh is only a **shape description**. It has no idea where it lives in the scene.

### Process

Apply the **model (spatial) transform**:

* **Scale**: how big the object is
* **Rotate**: how it is oriented
* **Translate**: where it is positioned

### Output

* Vertices expressed in **world space**

Now the object shares the same coordinate system as everything else in the scene.

---

## 2. World Space → View Space (Camera)

**Question this stage answers:** *How does the camera see the world?*

### Input

* World-space vertices

### Process

Apply the **view matrix**.

Conceptually, instead of moving the camera, the pipeline:

* Moves the entire world
* So that the camera sits at the origin
* Looking down its forward axis (-z)

### Output

* Vertices in **view (camera) space**

All positions are now defined relative to the camera.

---

## 3. View Space → Clip Space (Projection)

**Question this stage answers:** *How does 3D depth turn into something projectable?*

### Input

* View-space vertices

### Process

Apply a **projection transform**:

* **Perspective projection**: distant objects appear smaller
* **Orthographic projection**: size does not depend on depth

This step:

* Encodes depth information
* Defines the **view frustum**
* Prepares data for clipping and visibility checks

### Output

* Vertices in **clip space**

Clip space is a mathematical staging area, not yet screen-aligned.

---

## 4. Clip Space → Screen-Space Triangles

**Question this stage answers:** *How do projected points map to actual screen coordinates?*

### Input

* Clip-space vertices

### Process

1. **Perspective divide**

   * Divide coordinates by `w`
   * Normalize positions into a canonical cube (roughly `[-1, 1]`)

2. **Viewport transform**

   * Map normalized coordinates to actual screen resolution

### Output

* **2D triangles in screen space**
* Each vertex still carries:

  * Depth
  * Interpolated attributes (UV, normal, etc.)

Now geometry is aligned with the pixel grid.

---

## 5. Screen-Space Triangles → Fragments (Rasterization)

**Question this stage answers:** *Which pixels does this triangle affect?*

### Input

* 2D screen-space triangles

### Process

Rasterization can be treated as a **sampling problem**:

* Each pixel samples a **coverage function**
* Determines whether the triangle covers that pixel

For covered pixels:

* Vertex attributes are **interpolated** across the triangle

### Output

* **Fragments** (potential pixels)

A fragment is not a pixel yet — it is a pixel candidate carrying:

* Depth
* UV
* Normal
* Other interpolated data

---

## 6. Fragments → Final Pixels (Shading + Textures)

**Question this stage answers:** *What color should this pixel be?*

### Input

* Fragments with interpolated data

### Process

Run the **fragment shader**:

* Sample textures using UVs
* Apply lighting calculations
* Combine material properties

This is where most visual detail is produced.

### Output

* A final **color value** for each fragment

---

## 7. Final Pixels → Image

**Question this stage answers:** *Which fragments actually appear on screen?*

### Input

* Shaded fragments

### Process

* **Depth testing**: keep the closest fragment
* **Blending**: handle transparency
* Write passing fragments into the **framebuffer**

### Output

* The final **image** displayed on screen

---

## Key Idea

The graphics pipeline progressively converts:

**3D geometry → 2D samples → colored pixels**

Along the way, each stage:

* Reduces dimensionality (3D → 2D → pixels)
* Refines information (depth, texture, lighting)
* Produces clean input for the next stage

Once you see it as a structured data pipeline, the entire process becomes predictable and easy to reason about.
