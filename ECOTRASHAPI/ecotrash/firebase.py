# core/firebase.py
import firebase_admin
from firebase_admin import credentials, firestore
import os

# Path dari .env atau default fallback
firebase_path = os.getenv("FIREBASE_CREDENTIAL_PATH", "firebase-service-account.json")

if not firebase_admin._apps:
    cred = credentials.Certificate(os.getenv("FIREBASE_CREDENTIAL_PATH"))
    firebase_admin.initialize_app(cred)

db = firestore.client()
