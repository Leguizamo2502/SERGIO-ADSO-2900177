-- Persona
CREATE TABLE persona (
    id serial NOT NULL,
    nombres character varying(50) NOT NULL,
    email character varying(150) NOT NULL;
    edad integer NOT NULL,
    PRIMRAMARY KEY (id)
);