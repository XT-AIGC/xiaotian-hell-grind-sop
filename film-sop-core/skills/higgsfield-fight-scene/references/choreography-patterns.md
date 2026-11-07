# Choreography Patterns — Beat Patterns and Translation into Prompt Language

## Rules for Translating Choreography into a Video Prompt

AI video models generate “movie kung fu” by default: wide windups, high kicks, endless combinations. To get JKD, the prompt must ACTIVELY override these defaults:

1. **Specific limbs and targets.** Not "he punches" → "his lead right fist snaps into the jaw". Every strike: which limb, which trajectory, which target. Martial-arts terms (bai-jong, pak sao, side kick as a label) do NOT go into the prompt body — only geometry (snippets in moves-catalog.md v2).
2. **Remove the windup with a POSITIVE lock** (the prohibition “no windup” itself conjures a windup): `the first visible motion of the arm IS the strike already travelling, launched from where the hands rest at guard`. Remove high kicks with the lock `every kick stays below belt height`.
3. **Stance in the first frame.** Full body geometry (snippet S1) in the first frame, before the exchange begins; in later frames, reprise “the narrow side-on stance” with identical wording.
4. **Reaction physics.** Every impact = a described reaction from the opponent's body (see the table in techniques.md). Without it, the model “misses” the contact.
5. **Beat timing.** 1 beat ≈ 1–2 seconds of screen time. An 8-second shot = 4–6 beats maximum, including 1–2 beats of stance/pause. Do not cram in 10 strikes.
6. **The pause is part of the fight.** Broken rhythm requires written stop-stills: `he settles back into stance, motionless` — that is the style.
7. **The camera favors profile.** A sideways stance and straight punches read best in profile or three-quarter view; low kicks require a frame that shows the legs (not a chest-up close-up).
8. **One exchange = one shot.** For multishot sequences, cut at the broken-rhythm pauses — natural edit points.

## The Dramatic Arc of a JKD Fight

The classic form of the style (and Bruce Lee on film): **stillness → provocation/opponent's attack → interception → burst (1–3 actions) → stillness.**
The hero is almost motionless before and after. Violence is a brief flash between two pauses. This distinguishes a JKD scene from a “meat grinder.”

## Ready-to-Use Beat Patterns

### P1. Intercepting a Single Attack (SDA-counter) — 4–6 sec
1. The hero in bai-jong, motionless. The opponent square-on, aggressive.
2. The opponent launches a sweeping haymaker (telegraph).
3. Stop-hit: a straight lead to the jaw AT THE MOMENT of the windup + a step in. The opponent's strike dies halfway.
4. The opponent staggers/falls. The hero returns to stance, stillness.

### P2. Kick-to-Punch Entry (Long → Medium Range) — 6–8 sec
1. Stance, circling in an arc.
2. The opponent steps forward → stop-kick (low side kick) to the knee.
3. The knee buckles; the opponent pitches forward.
4. Meeting the fall — straight lead or lead hook to the jaw.
5. The opponent falls past the hero. The hero — stillness.

### P3. Trap-Combo (Medium → Close Range) — 6–8 sec
1. The opponent throws a straight punch — the hero uses pak sao (hand deflection) + a simultaneous straight lead. One beat, one movement.
2. The opponent sways and attempts a second strike → lop sao: a wrist pull into an oncoming backfist.
3. The opponent is jerked forward and down, falling past. The hero releases the hand, stillness.

### P4. Straight Blast Finish (Pressure) — 4–6 sec
1. The intercepted/stunned opponent loses structure.
2. Straight blast: chain vertical punches; the hero drives forward while the opponent retreats.
3. Finish — side kick to the body, sending the opponent into an obstacle (crates, door, wall).

### P5. Two Opponents (2-on-1) — 8–12 sec, 2 Shots
Principle: do NOT fight both simultaneously. Geometry: move so the opponents line up (one screens the other).
1. Shot 1: circling → the nearer opponent attacks → P1 (interception) or P2 (kick to the knee); opponent #1 falls, screening #2.
2. Shot 2: #2 steps over/around the falling opponent → the hero meets him with a stop-kick or P3.
Give each opponent a different pattern; do not repeat.

### P6. Against a Knife — 6–10 sec
1. The knife enters the frame — the hero instantly opens the distance, hands rise into a narrow frame, body sideways.
2. Knife thrust → an angled move off the line + a low side kick to the knee on the armed side.
3. Both hands grip the weapon wrist (lop sao), an elbow drops onto the forearm — the knife falls.
4. Straight lead / side kick — open the distance. Stillness.

## Anti-Patterns (Internal Choreographer's Check — Do NOT Transfer as Prohibitions into the Prompt!)

Everything on this list is excluded through POSITIVE phrasing in the prompt (low kicks → “every kick stays below belt height”; interception instead of a block → snippet T5/T6; angled exit → snippet F5). Do not put “no high kicks,” “no spinning,” or “no blocking” into the prompt body — naming a prohibited action summons it.

- High kicks to the head, spinning attacks, jump kicks — these are not JKD (unless Victor explicitly requests them).
- Alternating “block-strike-block-strike” exchanges — JKD intercepts rather than blocks.
- Combinations longer than 4 consecutive actions without a pause.
- A square boxing stance, dancing shoulders.
- A hero retreating backward in a straight line — JKD exits on angles/with a pendulum step.
- Windups, “loaded” punches from the hip, karate kamae.

## Choreography Output Template (Before Packaging as a Prompt)

```
SCENE: [who/where/how many seconds/who wins]
PATTERN: [P1–P6 or custom]
BEAT 1 (0.0–1.5s): [position/stance]
BEAT 2 (1.5–3.0s): [opponent's attack → hero's interception: limb, technique, target]
BEAT 3 (3.0–4.5s): [physical reaction → progression]
BEAT 4 (4.5–6.0s): [finish + stillness]
CAMERA NOTE: [profile/three-quarter, what must remain visible — legs for kicks]
```
Then package it in the active prompt engine's format (ULTRALORDGEN/CINEDANCE) or, if no engine is active, as a clean English prose prompt organized by beats.
