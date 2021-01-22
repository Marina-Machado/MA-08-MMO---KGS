USE DB_MMORPG
GO

CREATE VIEW V_DB_MMORPG AS 
Select a.*, b.*, c.*, d.*,  e.*,  f.*,  g.*,  h.*,  i.*,  j.*,  k.*,  l.*, m.*,  n.*,  o.*,  p.*, q.*, r.*, s.*, t.*, u.*, v.* FROM

(Select COUNT(*) as zones from dbo.areas)a,
(Select COUNT(*) as areas_has_ennemies from dbo.areas_has_ennemies)b,
(Select COUNT(*) as areas_has_NPCs from dbo.areas_has_NPCs)c,
(Select COUNT(*) as categories from dbo.categories)d,
(Select COUNT(*) as classes from dbo.classes)e,
(Select COUNT(*) as ennemis from dbo.ennemies)f,
(Select COUNT(*) as ennemies_has_quests from dbo.ennemies_has_quests)g,
(Select COUNT(*) as guildes from dbo.guilds)h,
(Select COUNT(*) as guilds_has_quests from dbo.guilds_has_quests)i,
(Select COUNT(*) as objets from dbo.items)j,
(Select COUNT(*) as PNJ from dbo.NPCs)k,
(Select COUNT(*) as joueurs from dbo.players)l,
(Select COUNT(*) as players_has_items from dbo.players_has_items)m,
(Select COUNT(*) as players_has_quests from dbo.players_has_quests)n,
(Select COUNT(*) as players_has_spells from dbo.players_has_spells)o,
(Select COUNT(*) as players_has_worlds from dbo.players_has_worlds)p,
(Select COUNT(*) as quêtes from dbo.quests)q,
(Select COUNT(*) as races from dbo.races)r,
(Select COUNT(*) as serveurs from dbo.servers)s,
(Select COUNT(*) as spells from dbo.spells)t,
(Select COUNT(*) as types from dbo.types)u,
(Select COUNT(*) as mondes from dbo.worlds)v;



