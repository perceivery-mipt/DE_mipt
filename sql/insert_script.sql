INSERT INTO GENDER_REF (gender_code, gender_label) VALUES
('F', 'Female'),
('M', 'Male'),
('U', 'Unknown');

INSERT INTO GENDER_MAP (raw_gender, gender_code) VALUES
('Female', 'F'),
('Male',   'M'),
('F',      'F'),
('M',      'M'),
('Femal',  'F'),   
('U',      'U');  

INSERT INTO STATE_REF (state_code, state_name, country) VALUES
('NSW', 'New South Wales', 'Australia'),
('VIC', 'Victoria', 'Australia'),
('QLD', 'Queensland', 'Australia')
;

INSERT INTO STATE_MAP (raw_state, state_code) VALUES
('New South Wales', 'NSW'),
('NSW',             'NSW'),
('Victoria',        'VIC'),
('VIC',             'VIC'),
('QLD',             'QLD');

INSERT INTO INDUSTRY_REF (industry_code, industry_label) VALUES
('AGRI', 'Agriculture'),
('ENT',  'Entertainment'),
('FIN',  'Financial Services'),
('HLTH', 'Health'),
('IT',   'IT'),
('MANU', 'Manufacturing'),
('NA',   'n/a'),
('PROP', 'Property'),
('RETL', 'Retail'),
('TELC', 'Telecommunications');

INSERT INTO INDUSTRY_MAP (raw_industry, industry_code) VALUES
('Health',              'HLTH'),
('Financial Services',  'FIN'),
('Property',            'PROP'),
('IT',                  'IT'),
('Retail',              'RETL'),
('Argiculture',         'AGRI'),
('Manufacturing',       'MANU'),
('Telecommunications',  'TELC'),
('Entertainment',       'ENT'),
('NULL',                'NA'),
('n/a',                 'NA');

INSERT INTO WEALTH_SEGMENT_REF (segment_code, segment_label, segment_rank) VALUES
('MASS', 'Mass Customer',      1),
('AFFL', 'Affluent Customer',  2),
('HNW',  'High Net Worth',     3);

INSERT INTO PRODUCT_LINE_REF VALUES
('STD', 'Standard'),
('ROAD', 'Road'),
('TOUR', 'Touring'),
('MNT', 'Mountain'),
('UNK', 'Unknown');

INSERT INTO PRODUCT_CLASS_REF (class_code, class_label, class_rank) VALUES
('LOW',  'low',    1),
('MED',  'medium', 2),
('HIGH', 'high',   3),
('UNK',  'unknown', NULL);

INSERT INTO PRODUCT_SIZE_REF (size_code, size_label) VALUES
('S',   'small'),
('M',   'medium'),
('L',   'large'),
('UNK', 'Unknown'); 

INSERT INTO BRAND_REF (brand_code, brand_label) VALUES
('GIANT', 'Giant Bicycles'),
('NORCO', 'Norco Bicycles'),
('OHM',   'OHM Cycles'),
('SOLEX', 'Solex'),
('TREK',  'Trek Bicycles'),
('A2B',   'WeareA2B'),
('UNK',   'Unknown');   -- для (Blanks)


commit;












