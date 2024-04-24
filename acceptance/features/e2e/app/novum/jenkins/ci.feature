Feature: Jenkins CI


  @android @ios @mobile @moves @o2uk @vivobr @blaude
  @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @next @live @automatic
  Scenario: Environment selection and login
    Given initiate the app
      And set environment, disable app rating and in-app messages
      And undesired users are not logged in
      And user is logged in
      And user is logged out
