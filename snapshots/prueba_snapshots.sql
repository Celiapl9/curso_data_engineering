{% snapshot budget_snapshot_www %}

{{
    config(
      target_schema='snapshots',
      unique_key='_row',
      strategy='check',
      check_cols=['quantity'],
        )
}}

select * from {{ source('google_sheets', 'budget') }}

{% endsnapshot %}