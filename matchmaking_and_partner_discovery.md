# GoBuddy — UI Design Specification

> A premium travel matchmaking app built on the Fly.io Design System.  
> Mobile-first · 390 × 844px · React + Vite + Tailwind CSS v4

---

## Design System

### Color Tokens

| Token | Hex | Usage |
|---|---|---|
| `primary` | `#281950` | Text, headings, structural elements |
| `surface` | `#7C3AED` | Primary CTAs, active chips, accent |
| `background` | `#FFFFFF` | App canvas |
| `border` | `#D5CFEF` | Card borders, dividers, input outlines |
| `text` | `#281950` | Body copy |
| `text-muted` | `#686082` | Secondary text, labels, captions |

### Typography

| Role | Family | Size | Weight | Letter-spacing |
|---|---|---|---|---|
| Display | Mackinac / Georgia (serif) | 28–30px | 575 | −0.9px |
| Heading | Mackinac / Georgia (serif) | 19–24px | 575 | −0.6px |
| Body | Fricolage Grotesque | 14–15px | 400 | — |
| Label | Fricolage Grotesque | 11–13px | 600 | +0.5px (uppercase) |
| Caption | Fricolage Grotesque | 11–12px | 400–500 | — |

### Spacing

Base unit: **4px**  
Scale: `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64`

### Border Radius

| Name | Value | Usage |
|---|---|---|
| `sm` | 4px | Tags, micro elements |
| `md` | 8px | Inputs, small cards |
| `lg` | 10px | Buttons, standard cards |
| `xl` | 16px | Large cards |
| `2xl` | 24px | Feed cards |
| `pill` | 9999px | Primary buttons, chips, badges |

### Shadows

```
card:     rgba(0,0,0,0.10) 0px  2px 25px 0px
feed:     rgba(40,25,80,0.12) 0px 8px 40px 0px
fab:      rgba(124,58,237,0.40) 0px 4px 20px 0px
```

### Motion

| Name | Duration | Easing |
|---|---|---|
| Fast | 150ms | `cubic-bezier(0.4, 0, 0.2, 1)` |
| Base | 200ms | `cubic-bezier(0.4, 0, 0.2, 1)` |
| Slow | 300ms | `cubic-bezier(0.4, 0, 0.2, 1)` |

---

## Shared Components

### Avatar
Circular monogram. Sizes: 34 · 36 · 46 · 72 · 80px. Background uses host/applicant brand color.

### Chip
Pill-shaped tag. Default: white bg + `#D5CFEF` border + muted text. Active: `#7C3AED` bg + white text.  
Sizes: regular (6px 14px padding) · small (3px 9px padding).

### VerifiedBadge
`#EDE9FE` background · `#7C3AED` text · `verified` Material Icon · 11px label.

### PrimaryBtn
Full-width pill · `#7C3AED` bg · white text · 15px/600 · 14px vertical padding.

### OutlineBtn
Full-width pill · white bg · `#D5CFEF` border (danger variant: `#DC2626`).

### BottomNav
3 tabs: Discover (`explore`) · My Trips (`luggage`) · Profile (`person`).  
Active tab color: `#7C3AED`. Inactive: `#686082`. Fixed to bottom of phone frame.

### StatusBar
Mocked iOS status bar. 9:41 · signal/wifi/battery icons. 12px / 600.

---

## Screens

### Screen 1 — Discover (Feed)

**Layout:** Vertical snap-scroll feed. Background `#F7F5FB`.

**App bar:**
- GoBuddy serif logotype (left)
- Filter icon + notifications icon + avatar (right)

**Filter pills:** All · Adventure · Culture · Luxury · Nature · Foodie  
Scrolls horizontally. Active pill: surface color.

**Trip Feed Card** (snap item, `scroll-snap-align: start`):
- Container: 24px radius, white bg, feed shadow
- **Hero photo:** 270px tall, `object-fit: cover`
  - Dark gradient overlay (bottom 55%)
  - Destination name + dates overlaid (white text, serif)
  - Verified badge (glass style: white/18% bg, blur)
  - Counter pill top-right: "1 / 4"
- **Card body:**
  - Host row: avatar + name + "Trip organizer" + budget (right-aligned)
  - Style chips + slots-left pill
  - Description (3-line clamp)
- **Action row** (border-top):
  - Heart/save toggle button (44×44px circle)
  - "View Details" outline pill button
  - "Request to Join" filled pill button (surface color)

**FAB:** 50×50px circle · surface color · `add` icon · bottom-right · above nav bar.

---

### Screen 2 — Search & Filter

**Layout:** Scrollable form with generous spacing (22px gap between fields).

**Fields:**
- Destination (text input)
- Date Range (two date inputs side-by-side)
- Budget (range slider, `$500 – $2,500`)
- Age Range (range slider, `22 – 35`)
- Preferred Gender (3-button toggle: Any / Female / Male)
- Travel Style (multi-select chips: Adventure · Foodie · Luxury · Backpacker · Nature · Culture)

**Actions:** Apply Filters (primary) · Reset (outline)

---

### Screen 3 — Trip Details

**Layout:** Scrollable. Sticky CTA at bottom.

**Hero:** 240px photo. Floating back button (36×36px, white/92% bg) at top-left.

**Info rows** (icon + label + value, border-bottom dividers):
- Budget · Available Slots · Preferred Gender · Preferred Age

**Sections** (uppercase 11px labels):
- Trip Host (avatar + name + verified badge)
- Travel Style (active chips)
- About This Trip (full description, 1.65 line-height)

**Sticky bottom:** "Request to Join" primary button.

---

### Screen 4 — Create Trip

**Layout:** Scrollable. Form inside elevated card (16px radius, card shadow).

**Fields:**
- Destination · Start Date · End Date (dates side-by-side)
- Budget
- Travel Style (multi-select chips)
- Preferred Gender (select dropdown)
- Age Preference (range slider, `22 – 40`)
- Available Vacancies (number input)
- Description (4-row textarea)

**Actions:** "Publish Trip" (primary pill)

---

### Screen 5 — Edit Trip

Same layout as Screen 4. All fields pre-filled.

**Actions:** "Save Changes" (primary) · "Delete Trip" (danger outline)

---

### Screen 6 — My Trips

**Layout:** Scrollable list with bottom nav.

**Trip card (compact):**
- 92×92px thumbnail (left) + content (right)
- Destination name (serif) + status badge (Active/Closed/Draft with color)
- Date range + members joined count
- Action row (border-top, 3 buttons): Edit · Requests · Delete (red)

**Status badge colors:**
- Active: `#16A34A` (green)
- Closed: `#686082` (muted)
- Draft: `#D97706` (amber)

---

### Screen 7 — Request to Join

**Layout:** Centered, scrollable. Ample top padding.

**Content:**
- Large avatar (72px) — user's own
- "Your Request" heading + verified badge + trip destination subtitle
- Multiline textarea (7 rows) with character counter (`{n}/500`) bottom-right
- Cancel (outline) + Send Request (primary)

---

### Screen 8 — Request Sent

**Layout:** Vertically and horizontally centered.

**Content:**
- 96×96px circle, `#EDE9FE` bg, `check_circle` icon (50px, surface color)
- "Request Sent!" serif heading (30px)
- Confirmation paragraph (max-width 270px, centered)
- "Back to Discover" primary button (max-width 320px)

---

### Screen 9 — Manage Requests

**Layout:** Scrollable applicant list.

**Applicant card:**
- Avatar (46px, tappable → Applicant Profile) + name + verified badge + status badge
- Age · Gender subtitle
- Travel style chips
- 2-line intro quote (italic feel via `"…"` wrapping)
- **Action row** (pending only): Accept (green) · Hold (amber) · Decline (red)

**Status indicator colors:**
- Accepted: border `#DCFCE7`, text `#16A34A`
- Held: border `#FEF9C3`, text `#D97706`
- Declined: border `#F3F4F6`, text `#6B7280`

---

### Screen 10 — Applicant Profile

**Layout:** Scrollable. Sticky 3-button action bar at bottom.

**Hero section** (`linear-gradient(150deg, #EDE9FE, #F3E8FF)`):
- Floating back button (same as Screen 3)
- 80px avatar + name + verified badge + age/gender
- Stats row: Trips · Rating · Languages (serif numbers, 22px)

**Sections:**
- Languages (default chips)
- Travel Style (active chips)
- About (full bio)

**Sticky action bar:**
- Accept (`#DCFCE7` bg · `#16A34A` text)
- Hold (`#FEF9C3` bg · `#D97706` text)
- Decline (`#FEE2E2` bg · `#DC2626` text)
- All: pill shape, equal flex width

---

## Design Principles

1. **Premium minimalism** — no gradients (except subtle hero overlays for readability), no glassmorphism, no neumorphism.
2. **Trust signals** — verified badges throughout, consistent host identity, clear slot counts.
3. **Whitespace first** — 22–24px section gaps, generous card padding.
4. **Serif + sans pairing** — serif for emotional/destination names, sans for functional UI.
5. **Restrained color** — purple palette stays constrained; status colors (green/amber/red) only appear for feedback states.
6. **Touch targets** — all interactive elements minimum 44×44px.
7. **Accessible contrast** — primary `#281950` on white ≈ 9:1 (WCAG AAA). Surface `#7C3AED` on white ≈ 5.8:1 (WCAG AA).