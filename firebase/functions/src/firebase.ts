import * as admin from "firebase-admin";

admin.initializeApp();


export const auth = admin.auth();
export const db = admin.firestore();
export const firestore = admin.firestore;

export default admin;
