-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE "assessments"
 (
	"id"			SERIAL, 
	"bill_number"			INTEGER, 
	"bill_id"			INTEGER, 
	"pc_id"			INTEGER, 
	"value"			INTEGER
);

-- CREATE INDEXES ...
CREATE INDEX "assessment_id_idx" ON "assessments" ("id");
ALTER TABLE "assessments" ADD CONSTRAINT "assessment_pkey" PRIMARY KEY ("id");
CREATE INDEX "assessment_bill_id_idx" ON "assessments" ("bill_id");
CREATE INDEX "assessment_PropType_id_idx" ON "assessments" ("pc_id");


-- CREATE Relationships ...
