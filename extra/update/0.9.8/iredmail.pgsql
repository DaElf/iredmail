-- \c vmail;

-- Column used to limit number of mailing lists a domain admin can create
ALTER TABLE domain ADD COLUMN maillists INT8 NOT NULL DEFAULT 0;

-- Column used to mark sql record is a mailing list
ALTER TABLE forwardings ADD COLUMN is_maillist INT2 NOT NULL DEFAULT 0;
CREATE INDEX idx_forwardings_is_maillist ON forwardings (is_maillist);

CREATE TABLE maillists (
    id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL DEFAULT '',
    domain VARCHAR(255) NOT NULL DEFAULT '',
    name VARCHAR(255) NOT NULL DEFAULT '',
    -- a server-wide unique id (a 36-characters string) for each mailing list
    mlid VARCHAR(36) NOT NULL DEFAULT '',
    settings TEXT,
    created TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT '1970-01-01 00:00:00',
    modified TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT '1970-01-01 00:00:00',
    expired TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT '9999-12-31 00:00:00',
    active INT2 NOT NULL DEFAULT 1
);
CREATE INDEX idx_maillists_address ON maillists (address);
CREATE INDEX idx_maillists_domain ON maillists (domain);
CREATE INDEX idx_maillists_mlid ON maillists (mlid);
CREATE INDEX idx_maillists_active ON maillists (active);
