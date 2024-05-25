set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.read_groq_api_key(user_id text)
 RETURNS text
 LANGUAGE sql
 STABLE
AS $function$select 
  pgp_sym_decrypt(groq_api_key::bytea, (
    select decrypted_secret 
    from vault.decrypted_secrets 
    where name = 'default_encryption_key'
  )) as groq_api_key
from public.user_settings
where user_id = user_id$function$
;


