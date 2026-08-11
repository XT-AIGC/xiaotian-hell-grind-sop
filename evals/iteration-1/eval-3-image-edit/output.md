```text
Edit the original image: remove the single lamppost directly behind the character and reconstruct the wall that it currently covers.

CHANGE: Remove only the lamppost behind the character. Fill the revealed area with a continuous extension of the existing wall, matching the exact masonry pattern, surface wear, moisture, perspective, local shadow density and light falloff already present around it.

PRESERVE EXACTLY:
- The character's face, hair, body, pose, hands, wardrobe and silhouette
- Every other object and its position
- Camera angle, framing, perspective and depth relationships
- The complete visible wall outside the removed lamppost area
- Ground, reflections and all existing shadows not cast by the removed lamppost
- Color grade, contrast, grain, texture and cinematic falloff

ONLY CHANGE: remove the lamppost and continue the existing wall naturally through that exact area. 100% identical otherwise.
```

使用Nano Banana Pro对原图执行一次局部后处理。只改这一处，不使用Seedream进行点改，也不加载角色表演或Seedance视频镜头模块。如果NBP仍无法干净移除，再把同一最小CHANGE交给GPT Image 2作为最后局部修复。

