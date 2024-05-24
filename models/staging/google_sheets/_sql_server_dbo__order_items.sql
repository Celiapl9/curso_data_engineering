with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'order_items') }}

),

renamed as (

    select

    from source

)

select * from renamed
