{{
  config(
    materialized='view'
  )
}}

with 

src_addresses as (

    select * from {{ source('SQL_SERVER_DBO', 'addresses') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state,
        _fivetran_deleted,
        {{ to_utc('_fivetran_synced') }} as _fivetran_synced_utc--Funcion que convierte en UTC la zona horaria. DEFINIDO EN MACROS

    from src_addresses
    union all
    select
        md5('sin_address'),--El HASH con MD5 del campo address_id
        0,
        'country',
        'address',
        'state',
        null,
        null
    
)

select * from renamed
