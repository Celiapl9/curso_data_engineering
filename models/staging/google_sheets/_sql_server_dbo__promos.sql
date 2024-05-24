with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'promos') }}

),

renamed as (

    select

    from source

)

select * from renamed
