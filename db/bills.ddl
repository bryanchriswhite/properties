-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "bills"
 (
	"rec_num"			INTEGER, 
	"id"			INTEGER, 
	"bill_number"			VARCHAR (7), 
	"bill_date"			VARCHAR (10), 
	"district"			VARCHAR (2), 
	"pva_acct_number"			VARCHAR (10), 
	"pva_acct_suffix"			VARCHAR (10), 
	"map_number"			VARCHAR (25), 
	"description"			VARCHAR (50), 
	"location"			VARCHAR (50), 
	"name_1"			VARCHAR (50), 
	"name_2"			VARCHAR (50), 
	"address"			VARCHAR (50), 
	"city_st_zip"			VARCHAR (50), 
	"zip_5"			VARCHAR (5), 
	"zip_4"			VARCHAR (4), 
	"comment"			VARCHAR (254), 
	"bill_value"			VARCHAR (10), 
	"paid_amount"			VARCHAR (10), 
	"bill_status"			VARCHAR (10), 
	"discount"			VARCHAR (10), 
	"penalty_1"			VARCHAR (10), 
	"penalty_2"			VARCHAR (10)
);

-- CREATE INDEXES ...
CREATE INDEX "bills__bill_number_idx" ON "bills" ("bill_number");
CREATE UNIQUE INDEX "bills__id_idx" ON "bills" ("id");
CREATE INDEX "bills__MapNumber_idx" ON "bills" ("map_number");
CREATE INDEX "bills__Name1_idx" ON "bills" ("name_1");
ALTER TABLE "bills" ADD CONSTRAINT "bills__pkey" PRIMARY KEY ("id");
CREATE INDEX "bills__rec_num_idx" ON "bills" ("rec_num");


-- CREATE Relationships ...
