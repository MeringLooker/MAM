connection: "mc_panoply"

include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"

datagroup: mam_adwords_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

#### Exploring AdWords Search Data #####

  explore: mam_sem_extended {
    extends: [mam_sem]
    hidden: no
  }

#### Exploring AdWords Display Data #####

explore: mam_gdn_extended {
  extends: [mam_gdn]
  hidden: no
}
