import { region, https } from 'firebase-functions';
import { ErrorCodes, Region } from './constants';
import { getMessaging } from './utils';
import { Message } from 'firebase-admin/lib/messaging/messaging-api';

interface Params {
  title: string;
  body: string;
}

export const sendNotification = region(Region).https.onCall(
  async (params: Params, context) => {
    const uid = context.auth?.uid;

    if (!uid) {
      throw new https.HttpsError(
        'unauthenticated',
        'Could not add to Mailchimp list',
        { errorCode: ErrorCodes.notLoggedIn }
      );
    }

    const messaging = getMessaging();

    const message: Message = {
      data: {
        title: params.title,
        body: params.body,
      },
      notification: {
        title: params.title,
        body: params.body,
      },
      android: {
        priority: 'high',
      },
      apns: {
        payload: {
          aps: {
            contentAvailable: true,
          },
        },
      },
      token:
        'eFNz4gsNSHm3krnRk4bgJj:APA91bHoGiVRdkKC9cWi9ksW0gKVXv0hKR-po4QSse0wMYEQtCPoBp5zD8kpLbgD5XpURA0QsIvU4IEFu1NosJ_cTmcGXdZ1obsY1owBABPPQKifUfNX1AKJJIMOIZKBcbFiQqYvUJMu',
    };

    const result = await messaging.send(message);

    console.log(`Message sent: ${result}`);
  }
);
