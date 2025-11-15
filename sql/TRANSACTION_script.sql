INSERT INTO mipt.transaction (
    transaction_id,
    customer_id,
    product_uid,
    product_id,
    transaction_date,
    online_order,
    order_status,
    list_price,
    standard_cost
)
SELECT
    r.transaction_id,
    r.customer_id,
    p.product_uid,
    r.product_id,
    NULLIF(r.transaction_date, '')::date,
    CASE 
        WHEN lower(trim(r.online_order)) IN ('true','yes','y','t','1') THEN TRUE
        WHEN lower(trim(r.online_order)) IN ('false','no','n','f','0') THEN FALSE
        ELSE NULL
    END AS online_order,
    CASE 
        WHEN lower(trim(r.order_status)) = 'approved' THEN 'Approved'
        WHEN lower(trim(r.order_status)) = 'cancelled' THEN 'Cancelled'
        ELSE 'Unknown'
    END AS order_status,
    NULLIF(r.list_price, '')::numeric(10,2),
    NULLIF(r.standard_cost, '')::numeric(10,2)
FROM mipt.transaction_raw r
LEFT JOIN mipt.brand_ref b
    ON lower(trim(r.brand)) = lower(trim(b.brand_label))
LEFT JOIN mipt.product_line_ref pl
    ON lower(trim(r.product_line)) = lower(trim(pl.line_label))
LEFT JOIN mipt.product_class_ref pc
    ON lower(trim(r.product_class)) = lower(trim(pc.class_label))
LEFT JOIN mipt.product_size_ref ps
    ON lower(trim(r.product_size)) = lower(trim(ps.size_label))
LEFT JOIN mipt.product p
    ON p.brand_code = COALESCE(b.brand_code, 'UNK')
   AND p.line_code  = COALESCE(pl.line_code, 'UNK')
   AND p.class_code = COALESCE(pc.class_code, 'UNK')
   AND p.size_code  = COALESCE(ps.size_code, 'UNK')
WHERE r.transaction_id IS NOT NULL
  AND NULLIF(r.transaction_date, '') IS NOT NULL
  AND r.customer_id IN (SELECT customer_id FROM mipt.customer);


SELECT * FROM transaction_raw r WHERE  r.transaction_id IS NOT NULL
  AND NULLIF(r.transaction_date, '') IS not NULL
  AND r.customer_id NOT IN (SELECT customer_id FROM mipt.customer);

SELECT * FROM mipt.TRANSACTION ORDER BY transaction_id; 

