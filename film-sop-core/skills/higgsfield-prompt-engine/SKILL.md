---
name: higgsfield-prompt-engine
description: >
  Write and audit screenplay scenes and sequences using a five-element dramatic engine —
  Goal, Obstacle, Tactic, Reversal, Value Shift — with very specific custom definitions
  (see the body; these are NOT textbook definitions and must be applied exactly as written).
  Use whenever the user wants to write a new scene, draft scene options, develop a sequence,
  OR audit/test/diagnose an existing scene, sequence, outline, or full script for structural
  strength. Trigger on phrases like "write this scene," "give me an option for," "audit my
  scene," "test this against goal/obstacle/tactic/reversal/value shift," "is this scene
  working," "what's weak here," "check my sequence," or when a screenplay/scene is pasted or a
  .docx/.pdf/Fountain/FD script is given for structural feedback. Also use proactively when the
  user is working on dramatic structure for thriller or psychological drama. Default to this
  skill for any scene-craft work rather than improvising generic story advice.
---

# higgsfield-prompt-engine

A skill for writing and auditing scenes/sequences against a precise five-element engine.

**These definitions are bespoke. Do not substitute textbook craft definitions. Apply exactly as written below.** When in doubt, re-read the relevant element's definition before judging or writing.

---

## The Five-Element Engine (the user's definitions — authoritative)

### 1. Goal
The single, unchanging thing the hero is fighting for: to fix what has already been established and reach, as fast as possible, the result that resolves it. "Already established" means *anything* set up earlier — deep backstory, a few scenes ago, or one minute ago (the stink from the previous scene counts as "the past" this scene fixes).

Rules:
- **The major goal never changes.** The hero is never wrong about it.
- **Every scene goal must be a causal link in the chain toward the story goal.** Test: if you can remove the scene and the chain to the story goal still holds, the scene fails the Goal test. No orphan scenes.
- The hero **can** be wrong — but only about **tactics**, never about the goal.
- "What he *ought to do*" is **not a separate thing to test.** The right move is dictated by the Obstacle + the Stakes. The world makes the correct move non-optional (he can't pitch while stinking — security stops him). If the stakes were different (life-or-death), the same obstacle (being dirty) would stop mattering and he'd skip that move. So: the "right" tactic is whatever Obstacle + Stakes make necessary. A hero taking a tactic the stakes wouldn't justify (showering while the building burns) is a flaggable inconsistency — either bad writing or deliberate self-sabotage; name which.

### 2. Obstacle
**A strong circumstance that jeopardizes either one stage of the path or the whole goal.** It *threatens* — it does not merely *cost*. It puts a stage (or the goal) at risk of failing.

- It can be a **branching search space** (many folders to check, time, patience, focus, nobody disturbing him) OR a **single hard wall** (dead battery — can't search a dead machine). A single wall typically spawns a fresh sub-goal with its own terrain (get a charger → none at home → go buy/borrow one).
- Obstacles operate at two **scales**: *local* (threatens the current stage — the stink threatens the pitch stage) or *global* (threatens the entire goal). Always identify which.
- The obstacle is **what forces the hero to choose or change a tactic.** No jeopardy → no tactic needed → no scene.
- Audit test: **name what is at risk, and at what scale.** If nothing is genuinely at risk, the obstacle is fake and the scene goes slack.

### 3. Tactic
The move the threat **forces** the hero to choose — a reasonable **guess on his current (often incomplete) knowledge**. This is **search under uncertainty**, not error-as-stupidity.

- A "wrong" tactic is not dumbness. It is a plausible probe of a space the hero can't fully see (looking in Pictures/Family for the photo — not there; now he *knows* it's not there). The hero **misreads the obstacle, the input/output, or the circumstances; he can't see what the truth would reveal.** The engine is a **knowledge/truth gap**: the distance between what he believes and what *is*.
- Each failed tactic must **return information** that narrows the search and reshapes the next move. The drama is the narrowing, not punishment.
- Audit tests:
  - ✅ good: the tactic is a reasonable bet given his current info, AND its failure tells him (and us) something new.
  - ❌ weak: a tactic he had no reason to try, OR a failure that returns **zero information** (he learns nothing; the search doesn't narrow — a wheel-spin / repeated folder).
- A failing tactic is **only** a weakness if the failure teaches nothing / produces no correction / doesn't change his next move.

### 4. Reversal
**A turn against expectation.** Forms:
1. **My own action flips on me** — what I did *for* something starts working *against* it (I shower to make the pitch → the shower makes me late and I miss it).
2. **Hidden agency revealed** — the thing/person I thought I was acting *on* (or that seemed neutral) was acting *on me* all along, for or against (the buyer was engineering my failure / secretly championing me). This is the thriller move; it often fires exactly when the **truth gap closes**.
3. General case: the situation turns opposite to what the tactic intended.

Placement rule:
- **At least one reversal per SEQUENCE**, possibly more. A single scene may be pure escalation; a *resolved sequence* with zero reversals **fails**.
- **Sequence** = the run of scenes from when a specific jeopardy (obstacle threatening one stage/sub-goal) **opens** to when it **resolves** (overcome, or it defeats him and forces a new path). A stage of the path = a sub-goal, defined by the obstacle that jeopardizes it — these two framings agree.
- Sequences **nest** (a dead battery spawns "go buy a charger," its own mini-sequence). Each resolving unit needs its own reversal. Flag the scale: full sub-goal sequence vs. sub-sequence inside it.

### 5. Value Shift
**The change in the AUDIENCE'S read of a character, triggered by a reversal.** This is the keystone and the most-misunderstood element. It does **not** happen on the page — it happens **in the viewer's mind.**

Each reversal forces the audience to **re-judge** the character. Example arc for one hero across reversals: *nice → experienced → cunning → no, he's desperate → devoted son → he's a baby → that's what a real man is → what a man.* Same for any character (antagonist: kindly old man → brutal → generous businessman → asshole → ...). It is a **moving verdict** the audience keeps revising.

THE CORE RULE: **A reversal with no value shift is inert.** A structural turn is NOT a reversal unless it moves the audience's verdict on the character. If you can't name a **before-verdict** and an **after-verdict** the audience would hold, the reversal is dead weight no matter how much plot flipped.

- The shifts across a sequence should form a **designed, deepening arc**, not random flip-flop. Audit the **trajectory**, not just presence per scene: are the revaluations building a surprising, deepening portrait, or just oscillating?

---

## The full causal chain (use this as the spine for everything)

> **Goal** (fixed engine; every scene a causal link toward it)
> → **Obstacle** (a strong circumstance that *jeopardizes* a stage or the whole goal; name what's at risk + scale)
> → **Tactic** (the move the threat *forces*; a reasonable guess on current knowledge; its outcome must return information and reshape the next move)
> → **Reversal** (turn against expectation: my act flips on me, or hidden agency revealed; ≥1 per sequence)
> → **Value Shift** (the reversal forces the *audience* to re-judge the character; no value shift → reversal is useless).

---

## Mode selection

Decide which mode the request calls for. If unclear, ask one short question.

- **AUDIT** — the user gives an existing scene/sequence/outline/script (pasted, or a file to read) and wants it tested/diagnosed.
- **WRITE** — the user asks you to write a scene, draft an option, or co-write. ("Give me an option for…", "write the scene where…")
- **CO-WRITE** — back-and-forth: the user writes, you respond with options/fixes, repeat. Run AUDIT logic continuously as you go, and deliver any new pages in screenplay format.

---

## Input handling

- Pasted prose / beat outline / scene → work directly.
- `.docx` / `.pdf` / Fountain / Final Draft / "read the whole thing" → read the file first (use the docx / pdf-reading / file-reading skills as needed), then audit/write.
- If given a full script and asked about structure, first **segment it into sequences** (jeopardy-opens → jeopardy-resolves) before auditing, and audit sequence by sequence.

---

## AUDIT mode — procedure

Work the chain in order. For the scene (and, for reversal/value-shift, the enclosing sequence):

1. **Goal** — State the scene goal in one line. Is it a causal link toward the story goal? Apply the removal test (can the scene be cut without breaking the chain?). If you don't know the story goal, ask for it — you can't fully audit Goal without it.
2. **Obstacle** — Name the strong circumstance and **exactly what it jeopardizes** and at **what scale** (stage / whole goal). If nothing is genuinely at risk → flag slack.
3. **Tactic** — Identify the tactic(s). Is each a reasonable guess on the hero's current knowledge? Is it **forced by** the jeopardy? Does each outcome **return information** that reshapes the next move? Flag wheel-spins (zero-information failures) and unmotivated tactics.
4. **Reversal** — Locate the reversal(s) in the sequence. Which form (action-flips / hidden-agency / general)? Confirm **≥1 per resolved sequence**. If zero → fail.
5. **Value Shift** — For EACH reversal, name the audience's **before-verdict → after-verdict** on the character. If you can't → the reversal is **inert** (flag it as the priority fix). Then assess the **trajectory** across the sequence: deepening designed arc, or random flip-flop?

### Audit output (in chat — NOT a file)

Use this structure:

```
SCENE/SEQUENCE: <one-line identification>

CHAIN CHECK
• Goal — <verdict + one line>
• Obstacle — <what's jeopardized + scale + verdict>
• Tactic — <forced? reasonable guess? returns info? verdict>
• Reversal — <form + present? ≥1 in sequence? verdict>
• Value Shift — <before-verdict → after-verdict per reversal; or "INERT"; trajectory note>

WEAKEST POINT: <the single element that, if fixed, recovers the most>

WHAT IF…
1. (Minimal fix — preserve the user's version) <change ONLY the single weakest point so the rest still works>
2. (Clean fix — fully works) <a version that fully works even if it departs more from the original>
3. (Optional — only if it genuinely adds something) <…>
```

The three-tier "What if" rule (the user's spec — follow exactly):
- **#1 Minimal:** start from the user's own version; change only the single weakest point so the rest of their scene still works.
- **#2 Clean:** your version that fully works, even if it departs more from the original.
- **#3 Optional:** include a third only if you feel it's genuinely necessary / adds something.

Any rewritten lines or beats in a "What if" must be delivered in **Final Draft screenplay format** (see Output formatting) so the user can paste them straight into FD.

---

## WRITE / CO-WRITE mode — procedure

Before writing, make sure you can name all five for the planned scene/sequence:
- the scene **Goal** as a causal link toward the story goal,
- the **Obstacle** and exactly what it jeopardizes (+ scale),
- the **Tactic(s)** as forced, reasonable guesses that return information,
- at least one **Reversal** in the sequence (name its form),
- the **Value Shift** each reversal produces in the audience (before-verdict → after-verdict).

If the user hasn't given the story goal or genre/theme yet, ask briefly — you need the story goal to keep scenes as causal links, and genre/theme to pitch the right register (this is built for psychological drama / thriller by default, but confirm).

Write in **Final Draft screenplay format.** After delivering pages, optionally give a one-line note on which reversal lands and what value shift it creates, so the user can see the engine working.

When asked for an **option**, give a clean self-contained scene in FD format. When asked for multiple options, make them differ in **tactic and/or reversal** (so the value shifts differ), not just tone.

---

## Output formatting (Final Draft / screenplay)

Deliver scenes and rewritten beats in standard screenplay format so they paste cleanly into Final Draft:

- **Sluglines** in caps: `INT./EXT. LOCATION - TIME`
- **Action** in present tense, left-aligned prose.
- **Character cue** in caps, centered convention (just caps on its own line in chat).
- **Dialogue** under the cue.
- **Parentheticals** in `(lower case)` on their own line under the cue when needed.
- Keep it clean — no scene numbers unless the user is working in a numbered draft.

Example:
```
INT. PITCH ROOM - DAY

MARCUS straightens his collar. Fresh shirt, still creased
from the bag. He smells like hotel soap and panic.

MARCUS
Thanks for seeing me on short notice.

The BUYER doesn't look up from the file.

BUYER
(turning a page)
Short notice is the only kind you give.
```

---

## Reminders

- The five definitions above are the user's, not the textbook's. Re-read before judging.
- Genre default: psychological drama / thriller. Confirm theme/idea with the user when writing.
- Audit is in-chat prose; rewrites within it are in FD format.
- The single most common real failure to hunt for: **a reversal that turns the plot but does not move the audience's verdict — it is inert.** Surface it first.
