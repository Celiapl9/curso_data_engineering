{{
  config(
    materialized='view'
  )
}}

with 

src_promos as (

    select * from {{ source('SQL_SERVER_DBO', 'promos') }}

),

renamed as (

    select
        distinct md5(promo_id) as promo_id,
        promo_id as promo_name,
        discount as discount_dollar,
        status as promo_status,
        _fivetran_deleted,
        {{ to_utc('_fivetran_synced') }} as _fivetran_synced_utc

    from src_promos

)

select * from renamed