
-- public.users definition
CREATE TABLE public.users (
	id serial4 NOT NULL,
	username text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);
