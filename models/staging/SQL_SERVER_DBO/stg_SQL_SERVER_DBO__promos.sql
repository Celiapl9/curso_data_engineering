with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'promos') }}

),

renamed as (

    select
        promo_id,
        discount as DISCOUNT_EUROS,
        status,
        _fivetran_deleted,
        _fivetran_synced AS _fivetran_synced_utc

    from source

    UNION ALL
    select
        md5(PROMO_ID) as PROMO_ID_HASHED,  -- Aquí aplicamos la función hash
        DISCOUNT as DISCOUNT_EUROS,
        case 
            when STATUS = '1' then 'active'
            else 'inactive'
        end as STATUS,  -- Transformamos el campo STATUS(preguntar lo del valor 10)
        _FIVETRAN_DELETED,
        _FIVETRAN_SYNCED AS _fivetran_synced_utc
    from source
    
)

select * from renamed
