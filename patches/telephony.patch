From f70241b8ed39dd6e6fc77eb9a5e93438cbbcd857 Mon Sep 17 00:00:00 2001
From: LineageOS-MTK <luzejij@binka.me>
Date: Tue, 7 Feb 2017 14:07:39 +0300
Subject: [PATCH] Improving fakeiccid for legacy rils & add the fixing of ussd

---
 .../com/android/internal/telephony/SubscriptionInfoUpdater.java    | 2 +-
 src/java/com/android/internal/telephony/gsm/GSMPhone.java          | 7 ++++++-
 src/java/com/android/internal/telephony/uicc/IccConstants.java     | 3 +++
 src/java/com/android/internal/telephony/uicc/RuimRecords.java      | 7 ++++---
 src/java/com/android/internal/telephony/uicc/SIMRecords.java       | 7 ++++---
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/src/java/com/android/internal/telephony/SubscriptionInfoUpdater.java b/src/java/com/android/internal/telephony/SubscriptionInfoUpdater.java
index 24c0f2d3a..c8ac89b95 100644
--- a/src/java/com/android/internal/telephony/SubscriptionInfoUpdater.java
+++ b/src/java/com/android/internal/telephony/SubscriptionInfoUpdater.java
@@ -309,7 +309,7 @@ public void handleMessage(Message msg) {
                         mIccId[slotId] = ICCID_STRING_FOR_NO_SIM;
                     }
                 } else {
-                    mIccId[slotId] = ICCID_STRING_FOR_NO_SIM;
+                    mIccId[slotId] = IccConstants.FAKE_ICCID;
                     logd("Query IccId fail: " + ar.exception);
                 }
                 logd("sIccId[" + slotId + "] = " + mIccId[slotId]);
diff --git a/src/java/com/android/internal/telephony/gsm/GSMPhone.java b/src/java/com/android/internal/telephony/gsm/GSMPhone.java
index e2624dad1..183e445ea 100644
--- a/src/java/com/android/internal/telephony/gsm/GSMPhone.java
+++ b/src/java/com/android/internal/telephony/gsm/GSMPhone.java
@@ -1514,7 +1514,12 @@ private void updateCallForwardStatus() {
             // Complete pending USSD
 
             if (isUssdRelease) {
-                found.onUssdRelease();
+                // MTK weirdness
+                if(ussdMessage != null) {
+                    found.onUssdFinished(ussdMessage, isUssdRequest);
+                } else {
+                    found.onUssdRelease();
+                }
             } else if (isUssdError) {
                 found.onUssdFinishedError();
             } else {
diff --git a/src/java/com/android/internal/telephony/uicc/IccConstants.java b/src/java/com/android/internal/telephony/uicc/IccConstants.java
index d395fc186..cbe621f7a 100644
--- a/src/java/com/android/internal/telephony/uicc/IccConstants.java
+++ b/src/java/com/android/internal/telephony/uicc/IccConstants.java
@@ -107,4 +107,7 @@
 
     //UICC access
     static final String DF_ADF = "7FFF";
+	
+	//CM-Specific : Fake ICCID
+    static final String FAKE_ICCID = "00000000000001";
 }
diff --git a/src/java/com/android/internal/telephony/uicc/RuimRecords.java b/src/java/com/android/internal/telephony/uicc/RuimRecords.java
index d348c8125..445e25a4a 100644
--- a/src/java/com/android/internal/telephony/uicc/RuimRecords.java
+++ b/src/java/com/android/internal/telephony/uicc/RuimRecords.java
@@ -690,10 +690,11 @@ public void handleMessage(Message msg) {
                 data = (byte[])ar.result;
 
                 if (ar.exception != null) {
-                    break;
+                    mIccId = FAKE_ICCID;
+                }
+                else {
+	                mIccId = IccUtils.bcdToString(data, 0, data.length);
                 }
-
-                mIccId = IccUtils.bcdToString(data, 0, data.length);
 
                 log("iccid: " + mIccId);
 
diff --git a/src/java/com/android/internal/telephony/uicc/SIMRecords.java b/src/java/com/android/internal/telephony/uicc/SIMRecords.java
index 8b6f74395..496158efd 100644
--- a/src/java/com/android/internal/telephony/uicc/SIMRecords.java
+++ b/src/java/com/android/internal/telephony/uicc/SIMRecords.java
@@ -874,11 +874,12 @@ public void handleMessage(Message msg) {
                 data = (byte[])ar.result;
 
                 if (ar.exception != null) {
-                    break;
+                    mIccId = FAKE_ICCID;
+ +                }
+ +                else {
+                    mIccId = IccUtils.bcdToString(data, 0, data.length);
                 }
 
-                mIccId = IccUtils.bcdToString(data, 0, data.length);
-
                 log("iccid: " + mIccId);
 
             break;
			 
From b2d8e71dc88c974238140eb55acf6d53a2777fc5 Mon Sep 17 00:00:00 2001
From: LineageOS-MTK <luzejij@binka.me>
Date: Wed, 8 Feb 2017 01:09:30 +0400
Subject: [PATCH] Deleted +

---
 src/java/com/android/internal/telephony/uicc/SIMRecords.java | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/java/com/android/internal/telephony/uicc/SIMRecords.java b/src/java/com/android/internal/telephony/uicc/SIMRecords.java
index 496158efd..100abd774 100644
--- a/src/java/com/android/internal/telephony/uicc/SIMRecords.java
+++ b/src/java/com/android/internal/telephony/uicc/SIMRecords.java
@@ -875,8 +875,8 @@ public void handleMessage(Message msg) {
 
                 if (ar.exception != null) {
                     mIccId = FAKE_ICCID;
- +                }
- +                else {
+                }
+                else {
                     mIccId = IccUtils.bcdToString(data, 0, data.length);
                 }
 
 From b2ca9ee8f24ad8fc6a01354d4ced37f00240d20b Mon Sep 17 00:00:00 2001
From: LineageOS-MTK <luzejij@binka.me>
Date: Fri, 10 Feb 2017 15:55:41 +0300
Subject: [PATCH] Use display name instead of numeric carrier and Re-add
 operators class

Thanks to @DerTeufel and @fire855
---
 .../com/android/internal/telephony/Operators.java  | 151 +++++++++++++++++++++
 .../internal/telephony/SubscriptionController.java |  12 ++
 2 files changed, 163 insertions(+)
 create mode 100644 src/java/com/android/internal/telephony/Operators.java

diff --git a/src/java/com/android/internal/telephony/Operators.java b/src/java/com/android/internal/telephony/Operators.java
new file mode 100644
index 000000000..51359eda6
--- /dev/null
+++ b/src/java/com/android/internal/telephony/Operators.java
@@ -0,0 +1,151 @@
+/*
+ * Copyright (C) 2013-2014 The CyanogenMod Project
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ *      http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ */
+
+package com.android.internal.telephony;
+
+import java.io.File;
+import java.io.FileNotFoundException;
+import java.io.FileReader;
+import java.io.IOException;
+import java.util.Collections;
+import java.util.Map;
+import java.util.HashMap;
+
+import org.xmlpull.v1.XmlPullParser;
+import org.xmlpull.v1.XmlPullParserException;
+
+import android.os.Environment;
+import android.telephony.Rlog;
+import android.util.Xml;
+
+import com.android.internal.util.XmlUtils;
+
+public class Operators{
+
+
+    // Initialize list of Operator codes
+    // this will be taken care of when garbage collection starts.
+    private HashMap<String, String>  initList() {
+        HashMap<String, String> init = new HashMap<String, String>();
+        //taken from spnOveride.java
+
+        FileReader spnReader;
+
+        final File spnFile = new File(Environment.getRootDirectory(),
+                                     "etc/selective-spn-conf.xml");
+
+        try {
+            spnReader = new FileReader(spnFile);
+        } catch (FileNotFoundException e) {
+            Rlog.w("Operatorcheck", "Can not open " +
+                   Environment.getRootDirectory() + "/etc/selective-spn-conf.xml");
+            return init;
+        }
+
+        try {
+            XmlPullParser parser = Xml.newPullParser();
+            parser.setInput(spnReader);
+
+            XmlUtils.beginDocument(parser, "spnOverrides");
+
+            while (true) {
+                XmlUtils.nextElement(parser);
+
+                String name = parser.getName();
+                if (!"spnOverride".equals(name)) {
+                    break;
+                }
+
+                String numeric = parser.getAttributeValue(null, "numeric");
+                String data    = parser.getAttributeValue(null, "spn");
+
+                init.put(numeric, data);
+            }
+        } catch (XmlPullParserException e) {
+            Rlog.w("Operatorcheck", "Exception in spn-conf parser " + e);
+        } catch (IOException e) {
+            Rlog.w("Operatorcheck", "Exception in spn-conf parser " + e);
+        }
+        return init;
+    }
+    //this will stay persistant in memory when called
+    private static String stored = null;
+    private static String storedOperators = null;
+
+    public static String operatorReplace(String response){
+        // sanity checking if the value is actually not equal to the range apn
+        // numerics
+        // if it is null, check your ril class.
+        if(response == null ||
+           (5 != response.length() && response.length() != 6)){
+            return response;
+        }
+        // this will check if the stored value is equal to other.
+        // this uses a technique called last known of good value.
+        // along with sanity checking
+        if(storedOperators != null && stored != null && stored.equals(response)){
+            return storedOperators;
+        }
+        stored = response;
+        try {
+            // this will find out if it a number then it will catch it based
+            // on invalid chars.
+            Integer.parseInt(response);
+        }  catch(NumberFormatException E){
+            // not a number, pass it along to stored operator until the next
+            // round.
+            storedOperators = response;
+            return storedOperators;
+        }
+        // this code will be taking care of when garbage collection start
+        Operators init = new Operators();
+        Map<String, String> operators = init.initList();
+        storedOperators = operators.containsKey(response) ? operators.get(response) : response;
+        return storedOperators;
+    }
+
+    // this will not stay persistant in memory, this will be taken care of
+    // iin garbage collection routiene.
+    private Map<String, String> unOptOperators = null;
+    // unoptimized version of operatorreplace for responseOperatorInfos
+    // this will provide a little more flexiblilty  in a loop like sisuation
+    // same numbers of checks like before
+    // this is for the search network functionality
+    public String unOptimizedOperatorReplace(String response){
+        // sanity checking if the value is actually not equal to the range apn
+        // numerics
+        // if it is null, check your ril class.
+        if(response == null ||
+           (5 != response.length() && response.length() != 6)){
+            return response;
+        }
+
+        try {
+            // this will find out if it a number then it will catch it based
+            // on invalid chars.
+            Integer.parseInt(response);
+        }  catch(NumberFormatException E){
+            // an illegal char is found i.e a word
+            return response;
+        }
+
+        if (unOptOperators == null){
+            unOptOperators = initList();
+        }
+
+        return unOptOperators.containsKey(response) ? unOptOperators.get(response) : response;
+    }
+}
diff --git a/src/java/com/android/internal/telephony/SubscriptionController.java b/src/java/com/android/internal/telephony/SubscriptionController.java
index 2979a760e..2ec3f9286 100644
--- a/src/java/com/android/internal/telephony/SubscriptionController.java
+++ b/src/java/com/android/internal/telephony/SubscriptionController.java
@@ -264,6 +264,13 @@ public void notifySubscriptionInfoChanged() {
          // FIXME: Remove if listener technique accepted.
          broadcastSimInfoContentChanged();
      }
+	 
+	 private boolean isNumeric(String str) {
+         for (char c : str.toCharArray()) {
+             if (!Character.isDigit(c)) return false;
+         }
+         return true;
+     }
 
     /**
      * New SubInfoRecord instance and fill in detail info
@@ -308,6 +315,11 @@ private SubscriptionInfo getSubInfoRecord(Cursor cursor) {
                 + " iconTint:" + iconTint + " dataRoaming:" + dataRoaming
                 + " mcc:" + mcc + " mnc:" + mnc + " countIso:" + countryIso + " userNwMode:" + userNwMode);
         }
+		
+		if (isNumeric(carrierName)) {
+            carrierName = displayName;
+            logd("[getSubInfoRecord] carrierName changed to: " + displayName);
+        }
 
         // If line1number has been set to a different number, use it instead.
         String line1Number = mTelephonyManager.getLine1NumberForSubscriber(id);
		 
From 880b07f5abc0957d8de9839416ce99375e9b1187 Mon Sep 17 00:00:00 2001
From: LineageOS-MTK <luzejij@binka.me>
Date: Mon, 22 May 2017 23:10:22 +0300
Subject: [PATCH] Fix 2g/3g switch

---
 src/java/com/android/internal/telephony/PhoneBase.java | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/java/com/android/internal/telephony/PhoneBase.java b/src/java/com/android/internal/telephony/PhoneBase.java
index dc790d798..07b36c362 100644
--- a/src/java/com/android/internal/telephony/PhoneBase.java
+++ b/src/java/com/android/internal/telephony/PhoneBase.java
@@ -1750,7 +1750,7 @@ public void setPreferredNetworkType(int networkType, Message response) {
         // Only set preferred network types to that which the modem supports
         int modemRaf = getRadioAccessFamily();
         int rafFromType = RadioAccessFamily.getRafFromNetworkType(networkType);
-
+/*
         if (modemRaf == RadioAccessFamily.RAF_UNKNOWN
                 || rafFromType == RadioAccessFamily.RAF_UNKNOWN) {
             Rlog.d(LOG_TAG, "setPreferredNetworkType: Abort, unknown RAF: "
@@ -1764,8 +1764,8 @@ public void setPreferredNetworkType(int networkType, Message response) {
             }
             return;
         }
-
-        int filteredRaf = (rafFromType & modemRaf);
+*/
+        int filteredRaf = (rafFromType);
         int filteredType = RadioAccessFamily.getNetworkTypeFromRaf(filteredRaf);
 
         // The getNetworkTypeFromRaf, has no way to differentiate between MODE_GSM_UMTS
		 
From d3f5b5bfcb9544d320b7be9f7f3ef2c3b816997e Mon Sep 17 00:00:00 2001
From: LineageOS-MTK <luzejij@binka.me>
Date: Tue, 23 May 2017 13:45:12 +0300
Subject: [PATCH] Correct data transfer after device reboot

---
 .../internal/telephony/dataconnection/DataConnection.java   | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/src/java/com/android/internal/telephony/dataconnection/DataConnection.java b/src/java/com/android/internal/telephony/dataconnection/DataConnection.java
index edc58afc2..093389fbf 100644
--- a/src/java/com/android/internal/telephony/dataconnection/DataConnection.java
+++ b/src/java/com/android/internal/telephony/dataconnection/DataConnection.java
@@ -1503,13 +1503,12 @@ public boolean processMessage(Message msg) {
                                     + " rat=" + rat + " ignoring");
                         }
                     } else {
-                        if (drs == ServiceState.STATE_IN_SERVICE) {
-                            // have to retry connecting since no attach event will come
-                            if (mConnectionParams.mRetryWhenSSChange) {
-                                retVal = NOT_HANDLED;
-                                break;
-                            }
-                        } else {
+                        // have to retry connecting since no attach event will come
+                        if (mConnectionParams.mRetryWhenSSChange) {
+                            retVal = NOT_HANDLED;
+                            break;
+                        }
+                        if (drs != ServiceState.STATE_IN_SERVICE) {
                             // We've lost the connection and we're retrying but DRS or RAT changed
                             // so we may never succeed, might as well give up.
                             mInactiveState.setEnterNotificationParams(DcFailCause.LOST_CONNECTION);
