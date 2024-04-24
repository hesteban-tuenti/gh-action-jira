@jira.QANOV-9310
Feature: Topup entry point

  Actions Before the Feature:
    Given user has a "legado prepay" account type
     And user has the "balance" module configured in CMS for "dashboard" page


  @jira.QANOV-37176 @android @ios @mobile @jira.cv.11.14 @no_automatable @moves
  @regression @impeded_legacy
  Scenario: Legado prepay user can access "Recarga saldo" OB webview
    other_affected_versions="2020-47"
    Given user has a "any_admin" role
      And user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line" page
     When clicks on the "balance_module.button" button
     Then the browser webview is displayed
      And the "Recargar saldo" header is displayed
