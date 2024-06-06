with 

source as (

    select * from {{ source('google_sheets', 'budget') }}

),

renamed as (

    select

    from source

)

select * from renamed
