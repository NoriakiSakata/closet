import * as functions from "firebase-functions";
import { db } from "../firebase";
import { DocumentData } from "@google-cloud/firestore";

export const deleteClothes = functions
  .region("asia-northeast1")
  .firestore.document("clothes/{clothesId}")
  .onDelete(async (snapshot) => {
    const data: DocumentData = snapshot.data();
    if (data === null) return;

    const uesrStatusRef = db.collection("users").doc(data.uid).collection("status").doc("status").collection("closet");
    await uesrStatusRef.doc(data.itemId).delete();
    console.log("clothes削除トリガー");

    const brandsClothesRef = db.collection("brands").doc(String(data.brandId)).collection("clothes");

    brandsClothesRef.doc(data.itemId).delete;

    console.log("brandsClothes削除トリガー");
    return Promise.resolve();
  });
