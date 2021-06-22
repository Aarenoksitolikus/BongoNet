CREATE TABLE IF NOT EXISTS persistent_logins (
    username  VARCHAR(64) NOT NULL,
    series    VARCHAR(64) NOT NULL,
    token     VARCHAR(64) NOT NULL,
    last_used TIMESTAMP   NOT NULL,
    PRIMARY KEY (series)
    );

INSERT INTO account (id, email, hash_password, state, username, role, avatar)
VALUES (12, 'sidikov.marsel@gmail.com', '$2a$10$5RP6GcyWspZ47uik1dLlzO9E.6O8sMM88ShX7cs9SeE59x/jZ3BlO', 'ACTIVE', 'Admin', 'ADMIN', 'https://shutniki.club/wp-content/uploads/2020/01/avatarka_dlya_admina_3_18122231.jpg')
    ON CONFLICT (id) DO NOTHING;
