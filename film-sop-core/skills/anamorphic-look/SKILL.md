---
name: anamorphic-look
description: Write the anamorphic-lens block for image and video generation prompts: focal choice, oval bokeh, horizontal flares, strong-blur anchoring, film stock and the tech tail. Use when a prompt mentions anamorphic, анаморф, 24/35/40 мм, размытие, флэры, film still.
---

# Anamorphic Look

How to make a generator actually produce an anamorphic image instead of a generic photo with the word "anamorphic" in it. The model does not obey the lens name — it obeys the *visual evidence* of the lens. Every block below writes that evidence in.

Talk to the user in their language; the prompt itself stays in English. No brand names, product names or camera/lens/film manufacturers anywhere in the prompt — describe the look, not the label.

## 1. Pick the focal length from the job

| Job | Focal | Diagonal FOV | Why |
|---|---|---|---|
| Location / establishing / geography | 24 mm | ~84° | default for locations; room reads, depth stacks |
| Location with a hero object or depth layers | 35 mm | ~63° | keeps blur usable, less edge stretch |
| Tight interior, narrow street, vehicle | 40 mm | ~57° | when 24 mm would hit the walls |
| Medium shots / performance | 50 mm | ~47° | faces still readable |
| Portrait / inserts | 85 mm | ~29° | never 24 mm on a face |

Rule: faces are never shot on 24 mm — the face stretches. For character plates use 85 mm (portrait), 50 mm (full body), 35 mm (groups).

For video generators write FOV degrees, not millimetres: `84° diagonal field of view, anamorphic rectilinear character. Lens locked for the whole shot.`

## 2. Anchor "strong blur" in physics

"Strong blur" alone does nothing on a wide lens. Blur on 24/35 mm only exists when the camera is **close** to a foreground subject and the aperture is **wide open**. Always write:

1. **Focus point** — one named object: `Focus locked on the nearest white line / the chair / the edge of the first column`.
2. **Distance** — `camera 1–3 m from the focus point`, lens at knee / waist / chest height.
3. **Aperture** — `wide open`.
4. **What dissolves** — name the layers: `the foreground X melts into creamy out-of-focus, the far Y dissolves into soft blur`.

Without a named focus point the model keeps everything sharp.

## 3. Describe the bokeh and flare as objects

Anamorphic signature, written every time, never as a bare adjective:

```
anamorphic bokeh with elongated vertical oval highlights on [the wet floor / the puddles / the lamp bulbs / the window glow] and a long horizontal blue streak flare off [the brightest light source in frame]
```

- Ovals are **vertical** (stretched up-down), not round.
- Streak flares are **horizontal**, usually blue; name the source they come off. If the only source is warm (tungsten, fire), write `warm-orange streak flare` — a blue streak off a tungsten lamp reads fake.
- No bright source in frame → no streak. Give the frame one highlight (a lamp, a horizon band, a wet reflection) so the flare has a reason to exist.

## 4. Pair the film stock with the light

Describe the stock by its balance and speed, never by manufacturer:

| Scene | Stock wording |
|---|---|
| Night, interiors, dusk, tungsten | `tungsten-balanced 500-speed colour negative film grain` |
| Daylight, overcast, sun, pastel | `daylight-balanced 250-speed colour negative film, fine grain` |

## 5. The tech tail (locations)

Append to every location prompt, adapting the three bracketed parts:

```
Shot on real 35mm film, [tungsten-balanced 500-speed / daylight-balanced 250-speed] colour negative film grain; anamorphic [24/35/40]mm lens with subtle horizontal flare and gentle highlight bloom; rule-of-thirds composition; natural true-to-life color; realistic environment physics — [dust / haze / rain / drifting smoke / puddle ripples]; gritty documentary film realism, indistinguishable from a real photograph, absolutely no CGI or render look. No cloned or duplicated elements. Clean environment plate, no characters. No text, no watermark, no logo. Aspect ratio 2.39:1.
```

Rain reads only when it is **backlit** by a lamp or neon and falls in visible streaks — say so.

## 6. Camera anchor and angle

Anamorphic wides fall apart without a hard physical camera position. Always:

```
Three-quarter angle, camera set to one side looking diagonally [across the room / into the depth], lens at [knee / waist / chest] height[, tilted slightly up].
```

One camera, one side of the space, one height. The 3/4 diagonal is what makes the anamorphic depth stack read.

## 7. Aspect ratio

Default 2.39:1. For natural-language generators write it in words at the end (`Aspect ratio 2.39:1.`) and also set it in the UI. For flag-based generators add the equivalent `21:9` aspect flag.

## 8. Assembly order (location)

1. `Cinematic film still.` + location in one line + mood
2. Camera anchor (angle, side, height)
3. What is in frame, foreground → background
4. Palette 60/30/10
5. Lighting (source, colour temp, direction, contrast)
6. Focus point + aperture + what dissolves + bokeh/flare objects
7. Tech tail

## 9. Failure fixes

| Symptom | Fix |
|---|---|
| Everything sharp | name the focus point, put the camera 1–3 m from it, say "wide open" |
| Round bokeh | write "elongated **vertical** oval highlights" and name what they sit on |
| No flare | add one bright source in frame and name the streak coming off it |
| Fisheye / barrel distortion | add "rectilinear", drop to 35 mm |
| Stretched face | you used 24 mm on a person — switch to 85/50 |
| Looks like 3D render | keep the tech tail intact, keep "real 35mm film" + grain + physics line |
| Blue flare on a warm lamp | change streak colour to warm-orange to match the source |
| A logo or brand appears | you named a product somewhere — replace it with a description of the look |

## 10. Negatives

Natural-language generators: write removals positively (`uniform tone edge to edge` instead of `no gradient`). The tech tail's own `No cloned… No text…` lines are the only accepted exceptions. Flag-based generators: a negative flag with 3–5 single words max.
