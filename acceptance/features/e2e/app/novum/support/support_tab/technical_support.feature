# -*- coding: utf-8 -*-
@jira.QANOV-3477
Feature: Technical support


  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-154753 @mobile @moves @no_automatable @regression
  Scenario Outline: A Legado user can access to the FAQ topics from the Support tab
    commented_tags="@depends_on.NOV-187448 @depends_on.NOV-187483"
    movistar_likes_link is the last one, but order changed to avoid issue with scroll in automation in Android.
    A tentative fix was done but it's now working. To be reviewed
    Given user has a "legado" account type
      And user has a "admin" role
      And user is in the "Support" page
      And user has a "<membership_status>" membership status
     When clicks on the "main_topics_module.<topic_element>" entrypoint
     Then the internal webview with "Atención al cliente y Ayuda - Movistar" header is displayed
      And the "<webview_text>" string in internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | membership_status | topic_element                        | webview_text             | jira_id     |
          | priority          | movistar_likes_link                  | Movistar Likes           | QANOV-78373 |
          | priority          | help_with_my_bill_link               | mi factura               | QANOV-3482  |
          | priority          | actual_and_previous_consumption_link | mi consumo               | QANOV-3483  |
          | priority          | internet_not_working_link            | no funciona Internet     | QANOV-3484  |
          | priority          | failures_in_movistar_plus_link       | Fallos en Movistar Plus+ | QANOV-3485  |
          | priority          | movistar_voicemail_link              | Buzón de voz             | QANOV-3486  |
          | no-priority       | movistar_likes_link                  | Movistar Likes           | QANOV-78374 |
          | no-priority       | help_with_my_bill_link               | mi factura               | QANOV-3487  |
          | no-priority       | actual_and_previous_consumption_link | mi consumo               | QANOV-3488  |
          | no-priority       | internet_not_working_link            | no funciona Internet     | QANOV-3489  |
          | no-priority       | failures_in_movistar_plus_link       | Fallos en Movistar Plus+ | QANOV-3490  |
          | no-priority       | movistar_voicemail_link              | Buzón de voz             | QANOV-3491  |

  @jira.<jira_id> @android @cert0 @cert1 @live @ios @jira.cv.11.8 @live @automatic @mobile @netcracker @next @o2uk @regression
  Scenario Outline: <account_type> user can access to Aura from the Support Tab
    Given user has the "<account_type>" account types
      And user is in the "Support" page
     When clicks on the "support_aura" entrypoint
     Then the "Aura" page is displayed

    Examples:
          | account_type   | jira_id      |
          | legacy postpay | QANOV-3237   |
          | AO2 postpay    | QANOV-573452 |
          | postpay;prepay | QANOV-573453 |

  @jira.<jira_id> @android @ber @cert0 @cert1 @live @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-254776 @automatic @mobile
  @o2uk @sanity @har
  Scenario Outline: <account_type> user can open a conversation from the support chat module
    The chat should cover the screen when opened.
    In production environments, the SDK only works with store versions of the app.
    Given user has a "<account_type>" account type
      And user is in the "Support" page
     When clicks on the "support_chat_module" entrypoint
     Then the "Support Chat" page is displayed
      And the "O2" header is displayed
      And the "support_chat_inputtext" inputtext is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | account_type   | jira_id      |
          | legacy postpay | QANOV-256055 |
          | AO2 postpay    | QANOV-573454 |

  @jira.QANOV-129608 @android @ios @jira.cv.12.5 @manual @mobile @moves @regression
  Scenario: Admin-light legacy prepay user can tap on the diagnostics button: "Login Escalation Required" page is displayed
    other_affected_versions="2021-34-B"
    Given user has a "admin-light" role
      And user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user is in the "Support" page
     When clicks on the "diagnostics_module.button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-244230 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A o2de user can access to the "O2 Community" screen
    Given user has the "Entrypoint list" module configured in CMS for "Support" page
      And user is in the "Support" page
     When clicks on the "faqs.o2_community" entrypoint
     Then the internal webview with "Hilfe und Tipps für O2 Kunden - Produkttests - News | O2 Community" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-408276 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es user can call for technical assistance
    Given user is in the "Support" page
      And user has the "Phone Assistance" module configured in CMS for "Support" page
     When clicks on the "contact_methods.phone" card
     Then the "dialer" app is displayed
      And the "1551" phone number is inserted on the dialer

  @jira.QANOV-408277 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: An o2es user with Whatsapp installed can click on the whatsapp card
    TBD the elements for the popup. Support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Support" page
      And user has the "Whatsapp Assistance" module configured in CMS for "Support" page
      And user is logged in the "WhatsApp" app
      And the current time is within the support service time
     When clicks on the "contact_methods.whatsapp" card
     Then the "Use Whatsapp" popup is displayed
      And clicks on the "popup.close" button
     Then the "Support" page is displayed

  @jira.QANOV-408278 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user with Whatsapp installed user can use whatsapp for technical assistance
    Support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Support" page
      And user has the "Whatsapp Assistance" module configured in CMS for "Support" page
      And user is logged in the "WhatsApp" app
      And the current time is within the support service time
     When clicks on the "contact_methods.whatsapp" card
      And the "Use Whatsapp" popup is displayed
      And clicks on the "popup.accept" button
      And the O2es conversation will be displayed on the WhatsApp app

  @jira.<jira_id> @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: An o2es user without Whatsapp installed will be redirected to the <store> when asks for assistance
    Support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Support" page
      And user has the "Whatsapp Assistance" module configured in CMS for "Support" page
      And user does not have installed the "whatsapp" app
      And the current time is within the support service time
     When clicks on the "contact_methods.whatsapp" card
     Then the "<store>" app is displayed

    @android
    Examples:
          | store      | jira_id      |
          | Play Store | QANOV-408279 |

    @ios
    Examples:
          | store     | jira_id      |
          | App Store | QANOV-408280 |

  @jira.QANOV-408281 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user can not see the whatsapp contact card in out of service hours
    Support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Support" page
      And user has the "Whatsapp Assistance" module configured in CMS for "Support" page
      And the current time is not within the support service time
     Then the "contact_methods.whatsapp" card is not displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: An <role> o2es user can contact support assistance by email
    Given user has a "<role>" role
      And user has the "Email Assistance" module configured in CMS for "Support" page
      And user is in the "Support" page
     When clicks on the "contact_methods.email" card
     Then the "Email" app is displayed
      And the "addressee" textfield with "ayuda@o2online.es" text is displayed
      And the "subject" textfield with "Contacto App - O2 [CONTEXT:user.user_login]" text is displayed

    Examples:
          | role        | jira_id      |
          | admin       | QANOV-408282 |
          | admin-light | QANOV-408283 |

  @jira.QANOV-408284 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es user can access the o2es help website from the more_info module
    Given user is in the "Support" page
      And user has the "More Info" module configured in CMS for "Support" page
     When clicks on the "more_info" module
     Then the external webview is displayed
      And the "Ayuda e información de O2" string in browser is displayed
      And clicks on the native "back" button
      And the "Support" page is displayed
