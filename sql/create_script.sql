CREATE TABLE CUSTOMER (
  customer_id INT PRIMARY KEY,
  
  first_name VARCHAR NOT NULL,
  
  last_name VARCHAR,
  
  gender_code CHAR(1) NOT NULL
  	    REFERENCES GENDER_REF(gender_code),
  	  
  DOB DATE,
  
  deceased_indicator BOOLEAN NOT NULL,
  
  owns_car BOOLEAN NOT NULL,
  
  segment_code VARCHAR(10) NOT NULL
  	    REFERENCES WEALTH_SEGMENT_REF(segment_code),
  	  
  property_valuation SMALLINT NOT NULL,
  
  job_title VARCHAR,
  
  industry_code VARCHAR(10) NOT NULL
  	    REFERENCES INDUSTRY_REF(industry_code),
  	  
  address VARCHAR NOT NULL,
  
  postcode VARCHAR NOT NULL,
  
  state_code VARCHAR(10) NOT NULL
        REFERENCES STATE_REF(state_code)
);

CREATE TABLE PRODUCT (
    product_uid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 

    brand_code VARCHAR(10) NOT NULL
        REFERENCES BRAND_REF(brand_code),

    line_code  VARCHAR(10) NOT NULL
        REFERENCES PRODUCT_LINE_REF(line_code),

    class_code VARCHAR(10) NOT NULL
        REFERENCES PRODUCT_CLASS_REF(class_code),

    size_code  VARCHAR(10) NOT NULL
        REFERENCES PRODUCT_SIZE_REF(size_code)
);

CREATE TABLE TRANSACTION (
  transaction_id INT PRIMARY KEY,
  
  customer_id INT NOT NULL
  	    REFERENCES CUSTOMER(customer_id),
  
  product_uid INT NOT NULL
  		REFERENCES PRODUCT(product_uid),
  		
  product_id INT NOT NULL,
  
  transaction_date date NOT NULL,
  
  online_order boolean,
  
  order_status VARCHAR(20) NOT NULL,
  
  list_price NUMERIC(10,2) NOT NULL,
  
  standard_cost NUMERIC(10,2)
);

CREATE TABLE GENDER_REF (
  gender_code CHAR(1) NOT NULL PRIMARY KEY,
  gender_label VARCHAR(10) NOT NULL
);

CREATE TABLE GENDER_MAP (
  raw_gender VARCHAR NOT NULL PRIMARY KEY,
  gender_code char(1) NOT NULL
  		REFERENCES GENDER_REF(gender_code)
);

CREATE TABLE STATE_REF (
  state_code VARCHAR(10) NOT NULL PRIMARY KEY,
  state_name VARCHAR(20) NOT NULL,
  country VARCHAR(20) NOT NULL
);

CREATE TABLE STATE_MAP (
  raw_state VARCHAR NOT NULL PRIMARY KEY,
  state_code VARCHAR(10) NOT NULL
  		REFERENCES STATE_REF(state_code)
);

CREATE TABLE INDUSTRY_REF (
  industry_code VARCHAR(10) NOT NULL PRIMARY KEY,
  industry_label VARCHAR(50) NOT NULL
);

CREATE TABLE INDUSTRY_MAP (
  raw_industry VARCHAR NOT NULL PRIMARY KEY,
  industry_code VARCHAR(10) NOT NULL
        REFERENCES INDUSTRY_REF(industry_code)
);

CREATE TABLE WEALTH_SEGMENT_REF (
  segment_code VARCHAR(10) NOT NULL PRIMARY KEY,
  segment_label VARCHAR(20) NOT NULL,
  segment_rank SMALLINT NOT NULL
);

CREATE TABLE PRODUCT_LINE_REF (
  line_code VARCHAR(10) PRIMARY KEY,
  line_label VARCHAR(20)
);

CREATE TABLE PRODUCT_CLASS_REF (
  class_code VARCHAR(10) NOT NULL PRIMARY KEY,
  class_label VARCHAR(10) NOT NULL,
  class_rank SMALLINT
);

CREATE TABLE PRODUCT_SIZE_REF (
  size_code VARCHAR(10) NOT NULL PRIMARY KEY,
  size_label VARCHAR(10) NOT NULL
);

CREATE TABLE BRAND_REF (
  brand_code VARCHAR(10) NOT NULL PRIMARY KEY,
  brand_label VARCHAR(30) NOT NULL
);

commit;

