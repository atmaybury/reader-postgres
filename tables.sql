
-- USERS
CREATE TABLE public.users (
	id serial4 NOT NULL,
	username text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- SUBSCRIPTIONS
CREATE TABLE public.subscriptions (
	id serial4 NOT NULL,
	user_id int NOT NULL,
	title text NOT NULL,
	url text NOT NULL,
	CONSTRAINT subscriptions_pkey PRIMARY KEY (id),
	CONSTRAINT subscriptions_user_id_fkey 
		FOREIGN KEY (user_id)
		REFERENCES public.users(id)
);
