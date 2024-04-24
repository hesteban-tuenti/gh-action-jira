@jira.QANOV-8671
Feature: Movistar Cloud

  Actions Before the Feature:
    Given user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product


  @jira.QANOV-8679 @android @ios @mobile @jira.cv.11.5 @no_automatable @impeded_legacy @jira.link.depends_on.QANOV-8678
  @jira.link.relates_to.NOV-163201 @moves @smoke
  Scenario: User who hasn't activated Movistar Cloud access to Movistar Cloud service
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Mobile line Dashboard" page
     When clicks on the "service.movistar_cloud" entrypoint
     Then the "Movistar Cloud" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "title" textfield with "Movistar Cloud" text is displayed
      And the "status_description" textfield with "Instala y accede a la app de Movistar Cloud para activar el servicio" text is displayed
      And the "features" textfield is displayed
      And the "go_to_movistar_cloud" button with "Ir a Movistar Cloud" text is displayed

  @jira.<jira_id> @<client> @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8679
  @jira.link.relates_to.NOV-163202 @moves @regression
  Scenario Outline: User who hasn't activated Movistar Cloud and without Movistar Cloud app installed access to the store to download it
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "deactivated" status
      And user has not installed the "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Movistar Cloud" page
     When clicks on the "go_to_movistar_cloud" entrypoint
     Then the "<app>" app is displayed
      And the "Movistar Cloud" page is displayed in the "<app>" store

    Examples:
          | client  | app        | jira_id    |
          | android | Play Store | QANOV-8680 |
          | ios     | App Store  | QANOV-8681 |

  @jira.QANOV-8684 @android @ios @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8679
  @jira.link.relates_to.NOV-163203 @moves @regression
  Scenario: User who hasn't activated Movistar Cloud and with Movistar Cloud app installed is redirected to Movistar Cloud app
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "deactivated" status
      And user has installed the "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Movistar Cloud" page
     When clicks on the "go_to_movistar_cloud" entrypoint
     Then the "Movistar Cloud" app is displayed

  @jira.QANOV-8685 @android @ios @mobile @jira.cv.11.5 @no_automatable @impeded_legacy
  @jira.link.depends_on.QANOV-8678 @jira.link.relates_to.NOV-163204 @moves @smoke
  Scenario: User who has activated Movistar Cloud access to Movistar Cloud service
    internal_checkpoint="NOTE: if the activation was done previously, keep in mind that it can take a while until the
    entry points are displayed. Make sure that at least half an hour passed after the activation."
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Mobile line Dashboard" page
     When clicks on the "service.movistar_cloud" entrypoint
     Then the "Movistar Cloud" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "status_description" textfield with the "Ya puedes guardar las fotos, vídeos y documentos de tu línea XXX XX XX XX" format is displayed
      And the "pick_action_text" textfield with "¿Qué quieres hacer?" text is displayed
      And the "upload_content_title" entrypoint with "Subir contenido a la nube" text is displayed
      And the "upload_content_subtitle" entrypoint with "Guarda tus recuerdos para que nunca se pierdan" text is displayed
      And the "free_up_storage_title" entrypoint with "Libera espacio de tu móvil" text is displayed
      And the "free_up_storage_subtitle" entrypoint with "Borra el contenido que ya hayas subido a Movistar Cloud" text is displayed

  @jira.QANOV-8686 @android @ios @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-163324 @moves @regression
  Scenario: User with Movistar Cloud app installed but not logged in taps any available option in Movistar Cloud screen: splash screen in Movistar Cloud app is displayed
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has installed the "Movistar Cloud" app
      And user is not logged in "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Mobile Cloud" page
     When clicks on the "upload_content_title" entrypoint
     Then the "Movistar Cloud" app is displayed
      And the "start" button with "EMPEZAR" text is displayed

  @jira.QANOV-8687 @android @ios @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-163206 @moves @regression
  Scenario: User with Movistar Cloud app installed and logged in taps the synchronize photos option: user is redirected to Movistar Cloud app
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has installed the "Movistar Cloud" app
      And user is logged in "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Mobile Cloud" page
     When clicks on the "upload_content_title" entrypoint
     Then the "Movistar Cloud" app is displayed
      And the option to upload content is displayed

  @jira.QANOV-8688 @android @ios @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.detects.MOVES-3864 @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-163236 @moves @regression
  Scenario: User with Movistar Cloud app installed and logged in taps the free up storage option: user is redirected to Movistar Cloud app
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has installed the "Movistar Cloud" app
      And user is logged in "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Mobile Cloud" page
     When clicks on the "free_up_storage_title" entrypoint
     Then the "Movistar Cloud" app is displayed
      And the option to free up storage is displayed

  @jira.<jira_id> @<client> @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-163916 @moves @regression
  Scenario Outline: A user that has Movistar Cloud activated but has not the Movistar Cloud app installed taps any available option in Movistar Cloud screen: user is redirected to the Store app
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has not installed the "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Movistar Cloud" page
     When clicks on the "free_up_storage_title" entrypoint
     Then the "<app>" app is displayed
      And the "Movistar Cloud" page is displayed in the "<app>" store

    Examples:
          | client  | app        | jira_id    |
          | android | Play Store | QANOV-8691 |
          | ios     | App Store  | QANOV-8692 |

  @jira.QANOV-8694 @android @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-172028 @moves @regression
  Scenario: A user who reached the Movistar Cloud page in the store from the Movistar Cloud screen in app in an Android device taps on the back button: user is redirected to the Movistar Cloud screen in the app
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has not installed the "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Movistar Cloud" page
     When clicks on the "free_up_storage_title" entrypoint
      And the "Play Store" app is displayed
      And clicks on the native "back" button
     Then the "Movistar Cloud" page is displayed
      And the "free_up_storage_title" button is displayed

  @jira.QANOV-8696 @ios @mobile @jira.cv.11.5 @manual @jira.link.depends_on.QANOV-8685
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-172028 @moves @regression
  Scenario: A user who reached the Movistar Cloud page in the store from the Movistar Cloud screen in app in an iOS device taps on the back button: user is redirected to the Safari browser
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "movistar_cloud" service in "activated" status
      And user has not installed the "Movistar Cloud" app
      And user has the matching subscription selected in the account
      And user is in the "Movistar Cloud" page
     When clicks on the "free_up_storage_title" entrypoint
      And the "App Store" app is displayed
      And clicks on the native "back" button
     Then the "Safari" app is displayed
