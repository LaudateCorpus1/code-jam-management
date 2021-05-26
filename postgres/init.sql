\du

CREATE TABLE IF NOT EXISTS jams (
    jam_id int GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    jam_name text NOT NULL,
    CONSTRAINT jams_pk PRIMARY KEY (jam_id)
);

CREATE TABLE IF NOT EXISTS teams (
    team_id int GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    jam_id int references jams(jam_id) NOT NULL,
    team_name text NOT NULL,
    CONSTRAINT teams_pk PRIMARY KEY (team_id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id bigint NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS team_has_user (
    team_id int references teams(team_id) NOT NULL,
    user_id bigint references users(user_id) NOT NULL,
    is_leader boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS winners (
    jam_id int references jams(jam_id) NOT NULL,
    user_id bigint references users(user_id),
    winner boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS infractions (
    infraction_id int GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    user_id bigint references users(user_id),
    jam_id int references jams(jam_id),
    infraction_type text NOT NULL,
    reason text NOT NULL,
    CONSTRAINT infractions_pk PRIMARY KEY (infraction_id)
);