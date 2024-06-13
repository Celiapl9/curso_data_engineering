{{
  config(
    materialized='view'
  )
}}



WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
         

        event_id,
        page_url,
        event_type,
        user_id,
        product_id,
        session_id,
        {{ to_utc('created_at') }} as created_at_utc,
        order_id,
        _fivetran_deleted,
        {{ to_utc('_fivetran_synced') }} as _fivetran_synced_utc



    FROM src_events
    )

SELECT * FROM renamed_casted