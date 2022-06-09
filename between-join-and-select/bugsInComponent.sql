WITH bug_com AS (
    SELECT bug_num, component_id, 
    COUNT(*) OVER(PARTITION BY bug_num) AS n_components,
    COUNT(*) OVER(PARTITION BY component_id) AS n_bugs
    FROM BugComponent
)

SELECT b.title AS bug_title, c.title AS component_title, 
bc.n_bugs AS bugs_in_component
FROM bug_com bc 
INNER JOIN Bug b ON bc.n_components > 1 AND b.num = bc.bug_num
INNER JOIN Component c ON c.id = bc.component_id
ORDER BY 3 DESC, c.id, b.num;