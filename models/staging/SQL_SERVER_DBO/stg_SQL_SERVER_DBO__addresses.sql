


with 

source as (

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
        CONVERT_TIMEZONE('UTC', TO_TIMESTAMP_TZ (_fivetran_synced)) as _fivetran_synced_utc--Funcion que convierte en UTC la zona horaria

    from source

    UNION ALL

    select

     md5('sin_address'),--El HASH con MD5 del campo address_id
            0,
            'country',
            'address',
            'state',
            null,
            null



    from source


)

select * from renamed
