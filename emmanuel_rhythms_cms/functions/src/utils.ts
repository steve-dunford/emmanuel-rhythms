import * as admin from 'firebase-admin';

let app: admin.app.App | undefined = undefined;

let messaging: admin.messaging.Messaging | undefined = undefined;

function getApp(): admin.app.App {
  if (app == undefined) {
    app = admin.initializeApp();
  }
  return app;
}

export function getMessaging(): admin.messaging.Messaging {
  if (messaging === undefined) {
    messaging = getApp().messaging();
  }
  return messaging;
}
