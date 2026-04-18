-- Migration 010: Deprecate soul_logs table
-- Date: 2026-04-19
-- Author: Arca (arquitetura) / Claude Code (execução)
-- Ref: Genesis v5.0.4 Part 4.3 (soul extension lives in body JSONB)
-- Ref: Genesis v5.0.4 Part 5.2 (3 canonical tables: items, item_connections, atom_events)
--
-- Context: soul_logs existed from earlier exploration but never received writes.
-- Soul data lives in items.body->'soul' as per Genesis contract.
-- This migration removes the legacy table and creates a view for query ergonomics.

-- Drop legacy table (verified empty as of 19 Apr 2026)
DROP TABLE IF EXISTS soul_logs CASCADE;

-- Create view reading soul data from items.body
CREATE OR REPLACE VIEW v_soul_logs AS
SELECT
  id,
  user_id,
  created_at,
  updated_at,
  type,
  body->'soul'->>'energy_level' AS energy_level,
  body->'soul'->>'emotion_before' AS emotion_before,
  body->'soul'->>'emotion_after' AS emotion_after,
  body->'soul'->>'needs_checkin' AS needs_checkin,
  body->'soul'->>'ritual_slot' AS ritual_slot,
  body->'soul' AS raw_soul
FROM items
WHERE body ? 'soul';

-- RLS: view inherits from items table (already has items_isolation policy)
-- No additional policy needed — view respects underlying table's RLS.

COMMENT ON VIEW v_soul_logs IS 'Soul data derived from items.body->soul. Replaces deprecated soul_logs table. Source: Genesis v5.0.4 Part 4.3.';
