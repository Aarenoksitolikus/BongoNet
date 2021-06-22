CREATE TABLE IF NOT EXISTS persistent_logins (
    username  VARCHAR(64) NOT NULL,
    series    VARCHAR(64) NOT NULL,
    token     VARCHAR(64) NOT NULL,
    last_used TIMESTAMP   NOT NULL,
    PRIMARY KEY (series)
    );

INSERT INTO profile (user_id, about, birthday, first_name, last_name, sex, status)
VALUES (12, 'ABOUT', '1994-02-02', 'Марсель', 'Сидиков', 'MALE', 'A am a BOSS here')
    ON CONFLICT (id) DO NOTHING;
