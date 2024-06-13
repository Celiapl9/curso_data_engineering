with src_budget

    as (

    select * from {{ source('google_sheets', 'budget') }}

),

renamed_casted as (

    select
         _row,
         product_id,
        quantity,
        month,
        convert_timezone('UTC',_fivetran_synced) AS date_load


    from src_budget

)

select * from renamed_casted
