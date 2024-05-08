insert into public.conversations (name, user_id, system_prompt, summary, model)
values ('Culture générale', 1, '', '', 'llama3-8b-8192');

insert into public.user_settings (user_id, groq_api_key)
values (1, '')