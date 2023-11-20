SELECT c.company_code
	,c.founder
	,count(DISTINCT (l.lead_manager_code))
	,count(DISTINCT (s.senior_manager_code))
	,count(DISTINCT (m.manager_code))
	,count(DISTINCT (E.employee_code))
FROM company c
LEFT JOIN lead_manager l ON c.company_code = l.company_code
LEFT JOIN senior_manager s ON c.company_code = s.company_code
LEFT JOIN manager m ON c.company_code = m.company_code
LEFT JOIN Employee E ON c.company_code = E.company_code
GROUP BY c.company_code
	,c.founder
ORDER BY c.company_code ASC
