with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'products') }}

),

renamed as (

        select
            product_id,
            price as price_euro,
            name,
            inventory,
            _fivetran_deleted,
            CONVERT_TIMEZONE('UTC', TO_TIMESTAMP_TZ(_fivetran_synced)) as _fivetran_synced_utc--convertir la zona horaria
        from source
        union all
        select
            md5('sin_producto'),
            0,
            'No existente',
            0,
            null,
            null
    )

    select * from renamed


