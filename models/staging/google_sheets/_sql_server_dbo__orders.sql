with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'orders') }}

),

renamed as (

    select

    from source

)

select * from renamed
