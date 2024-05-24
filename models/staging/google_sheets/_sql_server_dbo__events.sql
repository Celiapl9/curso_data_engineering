with 

source as (

    select * from {{ source('SQL_SERVER_DBO', 'events') }}

),

renamed as (

    select

    from source

)

select * from renamed
