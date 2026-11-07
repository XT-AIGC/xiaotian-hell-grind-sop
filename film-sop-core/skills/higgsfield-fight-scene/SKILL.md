---
name: higgsfield-fight-scene
description: "higgsfield-fight-scene — a Jeet Kune Do fight choreographer for video prompts. Always activate when a fight scene mentions Jeet Kune Do, JKD, or Bruce Lee's style, or when Victor requests a fight scene, brawl, combat sequence, intercepted strike, or fight choreography in this style — in any prompt format (Seedance, Higgsfield, image prompts) and in any language, even without the word prompt. Also activate when Victor supplies JKD books, manuals, video tutorials, or fight analyses: these are material for the skill's knowledge base (the INGEST protocol). The skill turns a scene into authentic JKD choreography: bai-jong stance, straight lead, stop-hit, low-line kicks, trapping, and broken rhythm — broken into beats with timing, targets, and physical reactions, ready to insert into a prompt."
---

# higgsfield-fight-scene v2.4
<!-- v2.4: At Victor's request, the anime cut-in modules (anime-cutins.md and sources/11–12) and impact-physics.md were REMOVED. Anime cut-ins moved entirely to his separate anime-puncture-flat5/block skills; use those when anime inserts are requested. Strike reactions now live in the Reaction lines in moves-catalog. Do not restore the removed modules without a direct request. -->
<!-- v2.3: (1) INGEST of 12 Wing Chun videos (Dan Lok's series, a three-hour VHS manual, Master Wong, Kevin Lee) into sources/17 and video-wc/: two Wing Chun tempos (meditation/explosion), block-to-strike conversion, street scenarios. (2) Anime cut-ins were aligned with Victor's anime-puncture-flat5 standard: a five-color palette (skin/black/white/red/blue), a flat background without a location, entry through a piercing action-match cut; the X catalog supplies insert scenarios within FLAT-5. The VK forum was not ingested because its topic requires a VK login. -->
<!-- v2.2: INGEST of four Wing Chun books (Liu Weihan levels 1–3 and Ip Chun's 116 wooden-dummy techniques, sources/13–16): precisely defined stance geometry, 13 hand positions, forms (Siu Lim Tao/Chum Kiu/Biu Jee) for training scenes, 12 dummy patterns with sound, a target-point map, and approximately 20 ready-made combinations. New codes: WC-H2 palm, WC-H3 Biu Jee, WC-E1 elbows, WC-G1 combined velocities, WC-D1 dummy. The VK forum and 12 videos were awaiting a Chrome connection. -->
<!-- v2.1: FIGHT STYLES — the engine now supports multiple styles: JKD (default) and WING CHUN (references/styles/wing-chun.md; triggers include Wing Chun and Ip Man). Wing Chun uses a narrow frontal stance, sticky contact, chain punches, and pressure through stepping; codes WC-S1/S2, WC-F1/F2, WC-H1, WC-K1, WC-T9–T11. -->
<!-- v2.0: ROLLBACK of v1.8 at Victor's request: combat-impact-director (a Gemini synthesis) worsened generations. Its five-phase engine bloated the beats; the working rule is that bloated prompts cause critical facts to be lost. Rolled back the five-phase section and camera matrix in impact-physics and the H1/K1/T4 edits; deleted the sources/10 digest. Do not restore them without a direct request. The anime functionality was retained and expanded: STYLE-80S was checked against Victor's 24 reference frames (Wicked City, 1987, and Ninja Scroll, 1993; sources/11–12); X5 gained two reference examples, and X8 Monochrome Wash and X9 Blood Burst were added. -->
<!-- v1.9: ANIME CUT-INS — anime inserts for knockouts/T3 finishers, called by X codes: X1 Impact Cel Freeze, X2 Negative Flash, X3 Speedline Rush, X4 KO Orbit, X5 Eyes Insert, X6 Silhouette Slam, X7 Shockwave Ring. Each insert is a separate shot with a frame-exact HARD CUT and protection against style leakage; maximum two inserts per prompt. -->
<!-- v1.7: IMPACT PHYSICS — an impact-physics library responding to Victor's feedback that impacts felt weak: a seven-layer impact stack (contact-point deformation, a whip-like chain through the body, displaced moisture, weight and feet, environment, camera punch plus sound, persistence), ready-made blocks by impact type, three force tiers (T1 stinging/T2 powerful/T3 finisher, at most one T3 per shot), a delayed liver-shot reaction, and three standard falls. -->
<!-- v1.3: MOVES CATALOG — a standard movement dictionary with aliases. Victor names a move in the request; the skill resolves it into mechanics and an English snippet. -->
<!-- v1.4: Seedance-proof rewrite following ULTRALORDGEN: martial-arts terminology stays out of the prompt body because the model does not know it and renders generic kung fu. No prohibitions: phrases such as no high kicks or zero windup summon the very windup or high kick they name. Use positive constraints only. Stance is body geometry in the opening frame; each strike is a state plus its physical consequence. Standard snippets are in moves-catalog.md v2. -->
<!-- v1.6: Full audit of all 45 catalog entries for prior collisions, striking surface, everyday visual anchor, reaction along the strike vector, no prohibitions, and no jargon in English snippets. Further corrections: S4 (thumb-up fist), F4 (fencer's lunge), H12+T1+T3+K4 (added target reactions), K2 (replaced the jargon chambers with knee folds up), T3 (replaced the negative without retreating with stays glued forward). -->
<!-- v1.5: LEARNING confirmed by Victor: backfist was interpreted as an ordinary punch because fist activates the straight-punch prior. Uncommon strikes need three anchors: an everyday visual analogy (backhand slap/tennis backhand/mule kick/stamping a door), an explicit striking surface (what touches first and which way the palm faces), and a target reaction following the strike vector (a backfist snaps the head SIDEWAYS). Rewrote H2, H4–H7, H11, K1, K2, K5, and K8. -->
<!-- v1.1: INGEST of eight Bruce Lee books: the complete Tao of JKD, Fighting Method volumes 1–5, Method of Fighting, and The Tao of Gung Fu. -->
<!-- v1.2: INGEST of 23 video tutorials (Dan Lok/Quintero, Ted Wong, Balicki DVD, Hajnasr's 27 Gates, and others): movement dynamics, drills, and training scenes. -->

A Jeet Kune Do (JKD) fight choreographer for AI video generation.
The aim is for on-screen combat to read as real JKD rather than generic kung fu with broad, swinging strikes.

This skill works independently and is compatible with prompt engines such as ULTRALORDGEN, CINEDANCE, and Kimiko.
Those engines determine the prompt FORMAT; this skill supplies the fight CONTENT. When a prompt engine is active, follow its format and take the choreography from this skill.

## Knowledge base

| File | When to read it |
|---|---|
| `references/jkd-core.md` | Whenever building choreography: principles, stance, footwork, ranges, and the five ways of attack. |
| `references/moves-catalog.md` | Read FIRST when Victor names specific moves, such as pak sao, stop-kick, or a lop sao pull: a movement dictionary with aliases, English snippets, and reactions. Resolution rules are at the bottom of the file. |
| `references/styles/wing-chun.md` | When Victor specifies Wing Chun or Ip Man: a second fighting style with a frontal stance, sticky contact, chain punches, its own FIGHT STYLE LOCK, and a checklist. Both styles can coexist in one scene as a clash of schools. |
| `references/techniques.md` | To choose specific strikes and interceptions: names, mechanics, and recognizable visual features for prompts. |
| `references/choreography-patterns.md` | Ready-made beat patterns (interception, two-on-one, knife, trap combination) and rules for translating them into prompt language. |
| `references/sources/` | Digests of Victor's materials: books, tutorials, and fight analyses. Read INDEX.md, then the relevant digests. |

Quick routing through sources/: mature JKD choreography → 01 (primary), 05 (counters/feints), and 07 (advanced combinations); self-defense, holds, and weapons → 06; a master's behavior and face on camera → 02; detailed stance and footwork → 03 and 04; young-fighter or traditional-school scenes → 08; movement DYNAMICS, timing, drills, and training scenes → 09 (video; contains routing to complete analyses in video/<ID>.md).

Before writing choreography, always read `references/jkd-core.md` and `references/choreography-patterns.md`. Digests in `sources/` take precedence over the basic reference files because they reflect Victor's view of the style.

## Workflow

1. **Break down the scene.** Identify the fighters, number of opponents, weapons, location, emotion, shot duration, and winner. If Victor names specific moves, resolve each through moves-catalog.md (alias → standard move → English snippet) and preserve his requested order.
2. **Read the knowledge base.** Read jkd-core, choreography-patterns, and the relevant digests in sources/.
3. **Choreograph in beats.** Divide the fight into one- to two-second beats. Each beat contains: position → action (which hand or leg, which technique, which target) → the opponent's physical reaction → the new position. JKD logic: intercept rather than block, take the shortest line, and use minimal movement.
4. **Translate into prompt language.** Follow choreography-patterns.md: specific limbs and targets, concrete wording, non-telegraphed motion, and timing in seconds.
5. **Check authenticity** against the checklist below.

## Authenticity checklist before delivery

- Define the stance through BODY GEOMETRY in the opening frame (snippet S1), not a term: the model does not know bai-jong.
- Include at least one stop-hit/interception: the style's defining logic is intercepting, rather than blocking and then countering.
- Keep kicks below the waist using the positive constraint: “every kick stays below belt height.”
- Express strikes without windup positively: “the first visible motion of a limb IS the strike itself, launched from where the hands rest at guard.”
- Use broken rhythm: explosion → complete stillness → explosion. Write stillness as a state (S3).
- Be economical: resolve the fight in two to four beats.
- For every strike, specify the limb, trajectory, target, and the physics of the opponent's reaction.
- Keep martial-arts terminology and prohibitions out of the prompt body (named = summoned). End the prompt with a FIGHT STYLE LOCK; see moves-catalog.md.

## INGEST protocol: expanding the knowledge base

When Victor supplies a book, manual, video tutorial, or fight analysis:

1. Extract techniques, principles, combinations, timing, common errors, and visual details: how the movement looks on camera.
2. Write a structured digest to `references/sources/NN-short-name.md`, where NN is the sequence number. Include the source, key techniques, effects on choreography, and useful quoted formulations.
3. Update `references/sources/INDEX.md`, using one entry per source.
4. If the material changes basic rules such as stance, the checklist, or patterns, update the relevant reference file and raise the version in the skill heading.
5. Show Victor the changes and resave the skill (`save_skill overwrite` or a rebuilt `.skill` package).

When a supplied source conflicts with the existing knowledge base, Victor's source takes precedence. Record the conflict in its digest.

## Example: translating a beat into a prompt sentence

Weak (generic): “the hero fights off the attacker with martial arts moves”

Strong (JKD, Seedance-proof: geometry without terminology or prohibitions): “He stands almost side-on, right shoulder and right foot leading, rear heel floating off the ground, weight light on the balls of his feet, lead hand half-extended at shoulder height. The attacker's shoulder just begins to load a wide right swing — and in that exact instant the hero's lead fist is already landing on his chin, one straight line from where it hovered at guard, a short glide-step feeding body weight into it. The attacker's head whips back and he staggers two steps into the dumpster. The hero settles back into the narrow side-on stance and goes completely still.”
