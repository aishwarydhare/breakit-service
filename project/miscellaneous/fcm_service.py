from pyfcm import FCMNotification

from config.settings import FCM_KEY

fcm_url = "https://fcm.googleapis.com/fcm/send"


def sendFcmMessage(fcm_token, message_title, message_body, message_data):
    try:
        push_service = FCMNotification(api_key=FCM_KEY)
        push_service.notify_single_device(registration_id=fcm_token,
                                          data_message=message_data,
                                          message_body=message_body,
                                          message_title=message_title,
                                          time_to_live=15,
                                          click_action="OpenMainActivity",
                                          low_priority=False)
    except Exception as e:
        print(e)
