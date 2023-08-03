-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  -- galaxy TEXT REFERENCES galaxies(name) ON DELETE CASCADE,
  -- moons TEXT REFERENCES moons(name) ON DELETE CASCADE
  galaxy_id INTEGER REFERENCES galaxies ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons ON DELETE CASCADE
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", 
--   "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

INSERT INTO galaxies
  (name)
  VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id, moon_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1, 1),
  ('Mars', 1.88, 'The Sun', 1, (1,2)),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1, (2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);

  
  INSERT INTO 
  moons (name)
  VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');
