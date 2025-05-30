
-- USERS
CREATE TABLE public.users (
	id serial4 NOT NULL,
	username text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	created_at timestamptz NOT NULL DEFAULT NOW(),
	CONSTRAINT users_id_pkey PRIMARY KEY (id),
	CONSTRAINT users_username_key UNIQUE (username),
	CONSTRAINT users_email_key UNIQUE (email)
);

-- FEEDS
CREATE TABLE public.feeds (
	id serial4 NOT NULL,
	url text NOT NULL,
	title text NOT NULL,
	created_at timestamptz NOT NULL DEFAULT NOW(),
	last_checked timestamptz NOT NULL DEFAULT NOW(),
	CONSTRAINT feeds_id_pkey PRIMARY KEY (id),
	CONSTRAINT feeds_url_key UNIQUE (url)
);
CREATE INDEX feeds_last_checked_idx ON public.feeds(last_checked);

-- SUBSCRIPTIONS
CREATE TABLE public.subscriptions (
	id serial4 NOT NULL,
	user_id int NOT NULL,
	feed_id int NOT NULL,
	created_at timestamptz NOT NULL DEFAULT NOW(),
	CONSTRAINT subscriptions_id_pkey PRIMARY KEY (id),
	CONSTRAINT subscriptions_user_id_fkey 
		FOREIGN KEY (user_id)
		REFERENCES public.users(id) ON DELETE CASCADE,
	CONSTRAINT subscriptions_feed_id_fkey 
		FOREIGN KEY (feed_id)
		REFERENCES public.feeds(id) ON DELETE CASCADE
);
CREATE INDEX subscriptions_user_id_idx ON public.subscriptions(user_id);
CREATE INDEX subscriptions_feed_id_idx ON public.subscriptions(feed_id);
CREATE INDEX subscriptions_created_at_idx ON public.subscriptions(created_at);

-- Composite index for common queries
CREATE INDEX subscriptions_user_feed_idx ON public.subscriptions(user_id, feed_id);

-- FOLDERS
CREATE TABLE public.folders (
	id serial4 NOT NULL,
	user_id int NOT NULL,
	name text NOT NULL,
	created_at timestamptz NOT NULL DEFAULT NOW(),
	CONSTRAINT folders_id_pkey PRIMARY KEY (id),
	CONSTRAINT folders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE
);
CREATE INDEX folders_user_id_idx ON public.feeds(user_id);
