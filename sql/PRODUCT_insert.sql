INSERT INTO mipt.product (
    brand_code,
    line_code,
    class_code,
    size_code
)
SELECT DISTINCT
    COALESCE(b.brand_code, 'UNK') AS brand_code,
    COALESCE(pl.line_code, 'UNK') AS line_code,
    COALESCE(pc.class_code, 'UNK') AS class_code,
    COALESCE(ps.size_code, 'UNK') AS size_code
FROM mipt.transaction_raw r
LEFT JOIN mipt.brand_ref b
       ON lower(trim(r.brand)) = lower(trim(b.brand_label))
LEFT JOIN mipt.product_line_ref pl
       ON lower(trim(r.product_line)) = lower(trim(pl.line_label))
LEFT JOIN mipt.product_class_ref pc
       ON lower(trim(r.product_class)) = lower(trim(pc.class_label))
LEFT JOIN mipt.product_size_ref ps
       ON lower(trim(r.product_size)) = lower(trim(ps.size_label));



SELECT * FROM mipt.product ORDER BY brand_code, line_code, class_code, size_code;