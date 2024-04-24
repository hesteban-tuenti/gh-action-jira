Feature: Setup


  @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr
  @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
  Scenario: Environment selection and login
    Given terminates the app
      And terminates other apps
      And launches the app
      And initiate the app
      And set environment, disable app rating and in-app messages
      And undesired users are not logged in
      And user is logged in
