{% snapshot user2_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='check',
      check_cols=['last_name'],
    )
}}

select * from {{ source('SQL_SERVER_DBO', 'users') }}

{% endsnapshot %}