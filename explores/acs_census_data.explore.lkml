explore: acs_census_data_core {
  extension: required
  persist_for: "10000 hours"
  view_name: state
  label: "ACS Census Data"

  join: county {
    sql_on: ${state.key} = ${county.state_key} ;;
    relationship: one_to_many
  }

  join: census_tract {
    sql_on: ${county.county_fips} = ${census_tract.county_key} ;;
    relationship: one_to_many
  }

  join: blockgroup {
    sql_on: ${census_tract.census_tract} = ${blockgroup.census_tract_key} ;;
    relationship: one_to_many
  }

}
