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
        'dsm7u2154EXGr9-H51rAmo:APA91bHv6Rrl9TIP4OskHWrcQASDkH803FE1A6ekb6jY0P8ztSa2UbZ9Cz9tzC7aGJpafw-h31mIYrqrEAH23xGNR0-Xr6TDtwRQV1529KYBrnECsjEEMyolx900qLdLvAgAZiPF_597',
    };

    const result = await messaging.send(message);

    console.log(`Message sent: ${result}`);
  }
);
