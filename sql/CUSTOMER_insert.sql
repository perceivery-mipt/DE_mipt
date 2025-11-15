INSERT INTO mipt.customer (
    customer_id,
	first_name,
	last_name,
	gender_code, -- join 
	dob,
	deceased_indicator,
	owns_car,
	segment_code, -- join
	property_valuation,
	job_title,
	industry_code, -- join
	address,
	postcode,
	state_code -- join
)

SELECT
    r.customer_id,
    r.first_name,
    r.last_name,
    gm.gender_code,
    r.dob,
    CASE WHEN lower(r.deceased_indicator) IN ('yes','y','true','t','1') THEN TRUE ELSE FALSE END,
    CASE WHEN lower(r.owns_car) IN ('yes','y','true','t','1') THEN TRUE ELSE FALSE END,
    ws.segment_code,
    r.property_valuation,
    r.job_title,
    im.industry_code,
    r.address,
    r.postcode,
    sm.state_code
FROM mipt.customer_raw r
LEFT JOIN mipt.gender_map gm
    ON r.gender = gm.raw_gender
LEFT JOIN mipt.wealth_segment_ref ws
    ON r.wealth_segment = ws.segment_label
LEFT JOIN mipt.industry_map im 
    ON r.job_industry_category = im.raw_industry
LEFT JOIN mipt.state_map sm
    ON r.state = sm.raw_state
;

SELECT *
FROM mipt.customer
;


