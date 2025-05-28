
-- USERS
CREATE TABLE public.users (
	id serial4 NOT NULL,
	username text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- FEEDS
CREATE TABLE public.feeds (
	url text NOT NULL,
	title text NOT NULL,
	last_checked timestamptz NOT NULL DEFAULT NOW(),
	CONSTRAINT feeds_pkey PRIMARY KEY (url)
);

-- SUBSCRIPTIONS
CREATE TABLE public.subscriptions (
	id serial4 NOT NULL,
	user_id int NOT NULL,
	feed_url string NOT NULL,
	CONSTRAINT subscriptions_pkey PRIMARY KEY (id),
	CONSTRAINT subscriptions_user_id_fkey 
		FOREIGN KEY (user_id)
		REFERENCES public.users(id),
	CONSTRAINT subscriptions_feed_url_fkey 
		FOREIGN KEY (feed_url)
		REFERENCES public.feeds(url)
);

