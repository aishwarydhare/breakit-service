from pyfcm import FCMNotification


def send():
    fcmToken = "cSeBuIbVygE:APA91bEjtnc_AYjHACCqv7UWsNMSjDCVDXrvUw9h2kKStE7sAkPjBF6rKl4P9Ah88TAte-fdPqAoZAWRsuM-nR9gt_mS35mE9Uf3f80Lee8KHrgegwKOpzCFKG28OfA-68w9AiNbh6D4"
    appId = 'petrol_pump'
    messageTitle = 'Order Placed'
    messageBody = 'Order placed. '
    message_data = {
        "title": 'my notif',
        "message": 'my notif msg',
        "order_id": "123",
        "quantity": "986",
    }
    sendSingleFCMMessage2(appId, fcmToken, messageTitle, messageBody, message_data)


fcm_pp_server_key = "AAAAMLNeCMI:APA91bFtqNaoq9YJLrKLQQKKwnJQMiO8roveBPtvtCB4DPaXTE1DvNWj3r9X816HRwHNrIDpCESDRHcFQqPAXa5LCgZc33NCC2Niwcy9BUm8W5hZ8mLigPnUovSH5uvHfuTvMDcEWT_K"


fcm_url = "https://fcm.googleapis.com/fcm/send"


def sendSingleFCMMessage2(app_id, fcm_token, message_title, message_body, message_data):
    petrol_pump_app_id = 'petrol_pump'
    fcm_pp_server_key = "AAAAMLNeCMI:APA91bFtqNaoq9YJLrKLQQKKwnJQMiO8roveBPtvtCB4DPaXTE1DvNWj3r9X816HRwHNrIDpCESDRHcFQqPAXa5LCgZc33NCC2Niwcy9BUm8W5hZ8mLigPnUovSH5uvHfuTvMDcEWT_K"
    try:
        push_service = FCMNotification(api_key=fcm_pp_server_key)
        print("sending android fcm notification")
        result = push_service.notify_single_device(registration_id=fcm_token,
                                                   data_message=message_data,
                                                   message_body=message_body,
                                                   message_title=message_title,
                                                   time_to_live=15,
                                                   click_action="OpenNotificationActivity",
                                                   low_priority=False)
        print(result)
        # to try sending notification on iOS device
        # if ios_also:
        #     sendIOSFcmNotification(app_id, fcm_token, message_title, message_body)
    except Exception as e:
        print(e)


def sendSingleFCMMessage(app_id, fcm_token, message_title, message_body, ios_also=True):
    petrol_pump_app_id = 'petrol_pump'
    fcm_pp_server_key = "AAAAMLNeCMI:APA91bFtqNaoq9YJLrKLQQKKwnJQMiO8roveBPtvtCB4DPaXTE1DvNWj3r9X816HRwHNrIDpCESDRHcFQqPAXa5LCgZc33NCC2Niwcy9BUm8W5hZ8mLigPnUovSH5uvHfuTvMDcEWT_K"
    try:
        push_service = FCMNotification(api_key=fcm_pp_server_key)
        print("sending android fcm notification")
        result = push_service.notify_single_device(registration_id=fcm_token,
                                                   data_message={'title': message_title, 'message': message_body},
                                                   time_to_live=15, click_action="OpenSplashActivity",
                                                   low_priority=False)
    except Exception as e:
        print(e)


send()
