-- ==========================================
-- CURVES (Weighted Impulse & Instant Exit)
-- ==========================================

-- Instant cut-off curve for windows vanishing/closing
hl.curve("instant_out", { type = "bezier", points = { {0.1, 1.0}, {0.1, 1.0} } })
hl.curve("linear",      { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })

-- Organic Springs:
-- High Mass (1.2 - 1.4) + Moderate Stiffness gives elements "weight" and warmth.
-- Dampening kept around ~20 lets the element overshoot *slightly* before nestling softly.
hl.curve("cloud_pop",   { type = "spring", mass = 1.2, stiffness = 220, dampening = 19 }) -- Weighted, pillowy burst
hl.curve("cloud_glide", { type = "spring", mass = 1.4, stiffness = 240, dampening = 21 }) -- Heavy floating drag
hl.curve("cloud_slide", { type = "spring", mass = 1.3, stiffness = 190, dampening = 18 }) -- Full-bodied workspace drift
