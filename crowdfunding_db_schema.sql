-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/FEmtc9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "subcategory" (
    "subcategory_id" int   NOT NULL,
    "subcategory_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     ),
    CONSTRAINT "uc_subcategory_subcategory_name" UNIQUE (
        "subcategory_name"
    )
);

CREATE TABLE "category" (
    "category_id" int   NOT NULL,
    "category" varchar(100)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     ),
    CONSTRAINT "uc_category_category" UNIQUE (
        "category"
    )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     ),
    CONSTRAINT "uc_contacts_email" UNIQUE (
        "email"
    )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" decimal(15,2)   NOT NULL,
    "pledged" decimal(15,2)  DEFAULT 0 NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int  DEFAULT 0 NOT NULL,
    "country" varchar(50)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" int   NOT NULL,
    "subcategory_id" int   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "subcategory" ADD CONSTRAINT "fk_subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "campaign" ("subcategory_id");

ALTER TABLE "category" ADD CONSTRAINT "fk_category_category_id" FOREIGN KEY("category_id")
REFERENCES "campaign" ("category_id");

ALTER TABLE "contacts" ADD CONSTRAINT "fk_contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "campaign" ("contact_id");

