

CREATE OR REPLACE VIEW tmlink_joined_fourteen  AS

SELECT 

	tions.application_number,
    tions.application_country,
    tions.madrid_number,
    tions.current_status,
    tions.filing_date,
    tions.registration_date,
    tions.renewal_due_date,
    apps.applicant_country,
    apps.applicant_name,
    niceclass.nice_class,
    deets.trademark_text,
    deets.uid_trademark


FROM tmlinkapplications tions
LEFT JOIN tmlinkapplicants apps on apps.application_number = tions.application_number
LEFT JOIN tmlinkniceclass niceclass on niceclass.application_number = tions.application_number
LEFT JOIN tmlinktrademarkdetails deets  on deets.application_number = tions.application_number
WHERE CAST( tions.filing_date AS DATE)  > '2014-01-01'
;