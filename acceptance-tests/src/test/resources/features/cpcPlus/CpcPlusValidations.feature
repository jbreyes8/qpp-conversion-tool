@tcID_264827 @qppct_devprev
@testRail @rubin @qppct_dev_api @qppct_imp_api @qppct_smoke @qppct_devprev_api
Feature: C264827 - QPPCT-909 test Validate that the ct repository's sample files successfully convert

  Scenario Outline: Negative - Failing as intended
    Given User starts QPPCT API test
    When User makes a Multipart POST request with <file_path>
    Then User receives 422 response code
    And  the JSON response at $.errors[*].details[*].message should contain <message>

    Examples:
      | file_path                                                           | message                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | ./sample-files/2018/CPCPLUS-1a-ImproperProgramName.xml              | CT - The Clinical Document program name cpc+ is not recognized. Valid program names are MIPS_VIRTUALGROUP, MIPS_GROUP, CPCPLUS, or MIPS_INDIV.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | ./sample-files/2018/CPCPLUS-1c-IncorrectProgramName.xml             | CT - The Clinical Document program name cpc is not recognized. Valid program names are MIPS_VIRTUALGROUP, MIPS_GROUP, CPCPLUS, or MIPS_INDIV.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | ./sample-files/2018/CPCPlus_No_APM_ID.xml                           | CT - One and only one Alternative Payment Model (APM) Entity Identifier should be specified. Here is a link to the IG section on identifiers: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | ./sample-files/2018/CPCPLUS-3b-NoCPC+ID.xml                         | CT - CPC+ submissions must contain a practice site address. Please refer to the 2018 IG for more details https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=26 regarding practice site addresses.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | ./sample-files/2018/CPCPLUS-4a-ImproperCPC+ID.xml                   | CT - The Alternative Payment Model (APM) Entity Identifier is not valid.  Here is a link to the IG section on identifiers: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPLUS-4b-ImproperCPC+ID-2.xml                 | CT - The Alternative Payment Model (APM) Entity Identifier is not valid.  Here is a link to the IG section on identifiers: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPLUS-4c-ImproperCPC+ID-3.xml                 | CT - The Alternative Payment Model (APM) Entity Identifier is not valid.  Here is a link to the IG section on identifiers: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=16                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPlus_Missing_Practice-Site-Addr.xml          | CT - CPC+ submissions must contain a practice site address. Please refer to the 2018 IG for more details https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=26 regarding practice site addresses.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | ./sample-files/2018/CPCPLUS-8a-NoQualityCategory.xml                | CT - CPC+ submissions must contain one Measure section                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | ./sample-files/2018/CPCPLUS-10a-ImproperPerformancePeriod.xml       | CT - A CPC Plus Performance period start must be 01/01/2018. Please refer to the IG for more information here: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | ./sample-files/2018/CPCPLUS-10b-ImproperPerformancePeriod.xml       | CT - A CPC Plus Performance period end must be 12/31/2018. Please refer to the IG for more information here: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | ./sample-files/2018/CPCPLUS-10c-NoPerformancePeriod.xml             | CT - A CPC Plus Performance period start must be 01/01/2018. Please refer to the IG for more information here: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | ./sample-files/2018/CPCPLUS-11a-CMS165IncorrectUUID.xml             | CT - The electronic measure id: CMS165v6 requires a IPP,IPOP with the correct UUID of 5C206C23-4CF9-4390-9E76-0F243FE59DCF. Here is a link to the IG containing all the valid measure ids: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPLUS-11b-CMS122IncorrectUUID.xml             | CT - The electronic measure id: CMS122v6 requires a performanceRateUuid with the correct UUID of B2497764-9F9D-402B-8852-1FB3BAA30B2C. Here is a link to the IG containing all the valid measure ids: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | ./sample-files/2018/CPCPLUS-12a-Group1Fail.xml                      | CT - CPC+ Submissions must have at least 2 of the following outcome measures: 40280382-5abd-fa46-015b-49abb28d38b2,40280382-5abd-fa46-015b-4981e40b37e6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | ./sample-files/2018/CPCPLUS-12b-Group1Fail-2.xml                    | CT - CPC+ Submissions must have at least 2 of the following outcome measures: 40280382-5abd-fa46-015b-49abb28d38b2,40280382-5abd-fa46-015b-4981e40b37e6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | ./sample-files/2018/CPCPLUS-12c-Group2Fail.xml                      | CT - CPC+ Submissions must have at least 7 of the following other measures: 40280382-5abd-fa46-015b-4993577e382e,40280382-5abd-fa46-015b-49956e7c383a,40280382-5b4d-eebc-015b-5844953b00a3,40280382-5abd-fa46-015b-49b36bf238d7,40280382-5abd-fa46-015b-499c87c0385e,40280382-5971-4eed-015a-5c465a344ded,40280382-5b4d-eebc-015b-5d99505001ea,40280382-5abd-fa46-015b-1b7c6bb929d0,40280382-5abd-fa46-015b-49b5b1e638e3,40280382-5abd-fa46-015b-49973dc03846,40280382-5abd-fa46-015b-498df1243816,40280382-5b4d-eebc-015b-8245e0fa06b7,40280382-5b4d-eebc-015b-5ea9efcc02ac,40280382-5abd-fa46-015b-4989b55937fe,40280382-5b4d-eebc-015b-5e87add90267,40280382-5abd-fa46-015b-49a7a51f38a0,40280382-5971-4eed-015a-4e002d4b4b66                                                                      |
      | ./sample-files/2018/CPCPLUS-12d-Group2Fail-2.xml                    | CT - CPC+ Submissions must have at least 9 of the following measures: 40280382-5abd-fa46-015b-4993577e382e,40280382-5abd-fa46-015b-49956e7c383a,40280382-5b4d-eebc-015b-5844953b00a3,40280382-5abd-fa46-015b-49b36bf238d7,40280382-5abd-fa46-015b-499c87c0385e,40280382-5971-4eed-015a-5c465a344ded,40280382-5b4d-eebc-015b-5d99505001ea,40280382-5abd-fa46-015b-1b7c6bb929d0,40280382-5abd-fa46-015b-49b5b1e638e3,40280382-5abd-fa46-015b-49973dc03846,40280382-5abd-fa46-015b-498df1243816,40280382-5b4d-eebc-015b-8245e0fa06b7,40280382-5b4d-eebc-015b-5ea9efcc02ac,40280382-5abd-fa46-015b-4989b55937fe,40280382-5b4d-eebc-015b-5e87add90267,40280382-5abd-fa46-015b-49a7a51f38a0,40280382-5971-4eed-015a-4e002d4b4b66,40280382-5abd-fa46-015b-49abb28d38b2,40280382-5abd-fa46-015b-4981e40b37e6. |
      | ./sample-files/2018/CPCPLUS-13a-CMS122IPOPMissing.xml               | CT - The electronic measure id: CMS122v6 requires 1 IPP or IPOP(s) but there are 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | ./sample-files/2018/CPCPLUS-13b-CMS165DENOMMissing.xml              | CT - The electronic measure id: CMS165v6 requires 1 DENOM(s) but there are 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | ./sample-files/2018/CPCPLUS-13c-CMS130NUMERMissing.xml              | CT - The electronic measure id: CMS130v6 requires 1 NUMER(s) but there are 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | ./sample-files/2018/CPCPLUS-13f-CMS2DENEXCEPMissing.xml             | CT - The electronic measure id: CMS2v7 requires 1 DENEXCEP(s) but there are 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | ./sample-files/2018/CPCPLUS-13h-CMS139DENEXNotProvided.xml          | CT - The electronic measure id: CMS139v6 requires 1 DENEX(s) but there are 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | ./sample-files/2018/CPCPLUS-14a-CMS160PRMissing.xml                 | CT - The Performance Rate is missing                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPLUS-14b-CMS156NUM1NotProvided.xml           | CT - The electronic measure id: CMS156v6 requires 2 NUMER(s) but there are 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | ./sample-files/2018/CPCPLUS-14f-CMS160DENOM2Missing.xml             | CT - The measure data with population id 'CCF8EF1D-ACEB-4160-BECE-EBC6DE6AC295' must have exactly one Aggregate Count.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | ./sample-files/2018/CPCPLUS-15a-CMS50PRNotProvided.xml              | CT - The Performance Rate is missing                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | ./sample-files/2018/CPCPLUS-15b-CMS122PRUUIDIncorrect.xml           | CT - The electronic measure id: CMS122v6 requires a performanceRateUuid with the correct UUID of B2497764-9F9D-402B-8852-1FB3BAA30B2C. Here is a link to the IG containing all the valid measure ids: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | ./sample-files/2018/CPCPLUS-15c-CMS156PR1PR2UUIDSame.xml            | CT - The electronic measure id: CMS156v6 requires a performanceRateUuid with the correct UUID of 8B77586E-A421-42C4-A8E2-741FDBCF60B6. Here is a link to the IG containing all the valid measure ids: https://ecqi.healthit.gov/system/files/2018_CMS_QRDA_III_Eligible_Clinicians_and_EP_IG_v2_508.pdf#page=94                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | ./sample-files/2018/CPCPLUS-16a-CMS164PRGreaterThan1.xml            | CT - The Performance Rate 1.001 is invalid. It must be a decimal between 0 and 1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | ./sample-files/2018/CPCPLUS-16b-CMS125PRNegative.xml                | CT - The Performance Rate -.888889 is invalid. It must be a decimal between 0 and 1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
#      | ./sample-files/2018/CPCPLUS-aa-SampleFile.xml                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

  Scenario Outline: These scenarios generate 201 which works with submission validation, but goes against CPC Validations. Need to figure out who to follow
    Given User starts QPPCT API test
    When User makes a Multipart POST request with <file_path>
    Then User receives 201 response code

    Examples:
      | file_path                                                      |
      | ./sample-files/2018/CPCPLUS-2a-NullNPI.xml                     |
      | ./sample-files/2018/CPCPLUS-2b-NoNPISection.xml                |
      | ./sample-files/2018/CPCPLUS-2c-NullNPI-2.xml                   |
      | ./sample-files/2018/CPCPLUS-2d-NullTIN.xml                     |
      | ./sample-files/2018/CPCPLUS-2e-MissingTIN.xml                  |
      | ./sample-files/2018/CPCPLUS-6a-InvalidTIN.xml                  |
      | ./sample-files/2018/CPCPLUS-6b-InvalidTIN-2.xml                |
      | ./sample-files/2018/CPCPLUS-7a-ImproperNPIFormat.xml           |
      | ./sample-files/2018/CPCPLUS-7b-ImproperNIPFormat-2.xml         |
      | ./sample-files/2018/CPCPLUS-5b-AddressProvided.xml             |
      | ./sample-files/2018/CPCPLUS-14c-CMS138DENEXCEP3Missing.xml     |
      | ./sample-files/2018/CPCPLUS-14d-CMS137POP1STRAT1NUMMissing.xml |
      | ./sample-files/2018/CPCPLUS-16c-CMS127PRNull.xml               |

  Scenario Outline: Negative - Failing as intended, but error messages should become more specific in future releases
    Given User starts QPPCT API test
    When User makes a Multipart POST request with <file_path>
    Then User receives 422 response code
    And  the JSON response at $.errors[*].details[*].message should contain <message>

    Examples:
      | file_path                                                     | message                                                                                                |
      | ./sample-files/2018/CPCPLUS-13d-CMS124NUMERNotProvided.xml    | CT - The MEASURE_DATA_CMS_V2 has 0 aggregate count values. A single aggregate count value is required. |
      | ./sample-files/2018/CPCPLUS-13e-CMS347NUMER1NotProvided.xml   | CT - The MEASURE_DATA_CMS_V2 has 0 aggregate count values. A single aggregate count value is required. |
      | ./sample-files/2018/CPCPLUS-13g-CMS149DENEXCEPNotProvided.xml | CT - The MEASURE_DATA_CMS_V2 has 0 aggregate count values. A single aggregate count value is required. |
      | ./sample-files/2018/CPCPLUS-13i-CMS156DENEX1Missing.xml       | CT - The MEASURE_DATA_CMS_V2 has 0 aggregate count values. A single aggregate count value is required. |
      | ./sample-files/2018/CPCPLUS-14e-CMS347IPOP1Missing.xml        | CT - The MEASURE_DATA_CMS_V2 has 0 aggregate count values. A single aggregate count value is required. |

  Scenario Outline: Positive - CPCPlus team said these should fail, but they pass because /converter automatically translates lower case to upper case
    Given User starts QPPCT API test
    When User makes a Multipart POST request with <file_path>
    Then User receives 201 response code

    Examples:
      | file_path                                               |
      | ./sample-files/2018/CPCPLUS-1b-LowerCaseProgramName.xml |
      | ./sample-files/2018/CPCPLUS-11c-CMS125LowerCaseUUID.xml |
      | ./sample-files/2018/CPCPLUS-11d-CMS137LowerCaseUUID.xml |

  #TODO: Come back to this test to check for warning messages
  Scenario Outline: Positive - These should generate warning messages, but it hasn't been implemented yet
    Given User starts QPPCT API test
    When User makes a Multipart POST request with <file_path>
    Then User receives 201 response code

    Examples:
      | file_path                                              |
      | ./sample-files/2018/CPCPLUS-9a-IASectionAdded.xml      |
      | ./sample-files/2018/CPCPLUS-9b-IAandPISectionAdded.xml |
      | ./sample-files/2018/CPCPLUS-9c-PISectionAdded.xml      |
