connection: "mc_panoply"

include: "/DCM/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_dcm_extended {
  extends: [mam_dcm]
  hidden: no
}
