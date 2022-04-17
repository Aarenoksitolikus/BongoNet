CREATE TABLE IF NOT EXISTS persistent_logins
(
    username VARCHAR
(
    64
) NOT NULL,
    series VARCHAR
(
    64
) NOT NULL,
    token VARCHAR
(
    64
) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY
(
    series
)
    );

UPDATE profile
SET about      = 'ABOUT',
    birthday   = '1994-02-02',
    first_name = 'Марсель',
    last_name  = 'Сидиков',
    sex        = 'MALE',
    status     = 'A am a BOSS here'
WHERE user_id = 12;
