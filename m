Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764A386559
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188276; cv=fail; b=kugBAHaOPulfrG1pSEDrgsp/nGMA1XqkXCkU7hSjzpU6Dbh424R/8wip1lTygxUlZjHlK06yigV4QYUbuz9PigJpz5PgOpR3n30iFg8aJaswHH55GDyksA65jcFzEvP7RRRRYRcds/IqTBA+ocaivI2/tsqTP85O7xpYZWUD35Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188276; c=relaxed/simple;
	bh=O/FR7xhvvFs6Rf4UOYXrjcJCUxK3F5G3FKsdIKvp5Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ruzsvVdYz98+B0Ts/MICuzO9DJJcO/aklcn+W0gXyk3xZyRiJp+XEJv62k2fdcINjh7dbz4gSNf+VCXe81m6YW/Y6kSS3hPkevQd0MInfkmwYdWI/3zvFDIGAmHU7OQZB40gYe8KOqZG51n28+EpHXOmVLD8b1sCtxE4+L56KF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rZh+2xU+; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rZh+2xU+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTX3B4ijrTt/+bWNNBg5fMfe2UOVW3KfIkV1vDDhXCZNNJrZYLWWEMepY+oKTPJeeGfjnlm9H1UEKRv+JodicJg6YUGCM8HIxSPtfRrwhAHUpjMc51cu4Sk6CF+7/s4Tj9aNnGLEqVqEHwJpOD/mDC5BjkuTFbUtBnAqy0qhv33eHddhtjUyVO0OwAGLToYT8zkaURNFeL/4Ve21YpBX3GOWi+iaIdrjKPKqXsxtuzDe+U2BuNnUmqm+9UvXwGG9GoPFnRoRcBDeB3pkXkORvT36uvtgYjwRMNwAii6GbaeQOWY5E4nwWUQ2RNEUCjofWmoFhTZb2VSX1Y9xdxjowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8xHDPOhB/UlseLs0Wc74QXcMaevqA4WDI+EbLisdcQ=;
 b=w0praGf8bD4kaUfiKqzEGDUWHgRSuAiJlf1H7FeKIrQ0AajfxmlZl4TvnInZqRFp9MsO15GDYuIP3YCoE1oXN0o72EQAxMvBnXPxGXESWYPy4RLCN84pUrllq8wOei5UVyTk3rNAVKVB1Y3aGo9LJH8vvgX8hlLdDnAh6OYcELzE2OBEq/4vcF8RUyotdaeU72Lvc8csGPkfMJYhZFTjYGlnFvCyxasdpHELzKlK3Y7Au2oK1UCjlihr+AUU+zuxCW4Gct0gapdhNuJuvNhvOgrE07GaRH5eNIIaM+CgN11rwhGP6XPxrx8Lais+CKp9HU7ONdrXKNwYUdhk9nPheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8xHDPOhB/UlseLs0Wc74QXcMaevqA4WDI+EbLisdcQ=;
 b=rZh+2xU+10xL6Fracm79mJ9zEe/2CstA2PUUFaZR0HeoTkECNJMTQ86Gt8whR/HEnOYY3CJeoqcR98vkYnuCB3ULX79fhW/zwCcQ/5C5R/hc8EPMeLp9+kTZQqtQQZZJHfdqSIPjFIDftn2d88Nn10unqX5rVKqAkk/ai8ybpYbyIvIjYGa6NQ4vlIN4b4Nx+QcfAv++67Icp7HkQD0BJIXwKbkDRObRRSHerjKOHVyV57cZ6TV8bUZLu6jQrUIOEtELe+64RyF1mJheoJu5YMuZjEAYi1txB8GKnWLMNpChMIRyuayDGBiRCjWjILo63PF8SKQnALRZ35pXNamV8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:23 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 09/17] gpu: nova-core: log GSP events instead of discarding them
Date: Fri, 11 Sep 2026 21:43:52 -0700
Message-ID: <20260912044400.677097-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d87f80-f4fc-414b-599f-08df10888447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	cBkf0N+XblJ4DOwITtEdMYkaQze4xK3RYmZO4N9hslDKZfpGZQXMYtzIlVRCUISa1uYKz3qlZx6z/F4I+cGF1IZOKS8YEb7HmXYaGdXMf+sw4Zgi0u/ziChbx+GVKgCTHL15PfBDKZrdOwWumrJCGc7RmtmfXzaKEEAvr1vmo+vYZJebeUHIShTX6bvavrgxntWiL7VJz0sz653V39SkUZi84smRzrQS0nc2v9GX4RbeE6rEeJIZmMmEKpxSX2ImjCW85XJFh/zICPT64IxYBEJqXKVL1S/1ejyzOX5t4t7t7iNnBUCuSvH+tI96RsfqaF82bWD0BuzvRVfA2Ff9upcsUPNkYFLQVOZ69xApnsuQogC1zw8LYGf8vkxUZuCZ8l65W0N77i6bIl5B3RhnUjqPM5NKdsKBGde/rbu0W59feFTd+H5+VZYiY9+x8OS0o7WnkK7a2kdc2rBiVpvXOkVBpKons4PqfgTisDj0v4C6qZVsqft1/mqWhzF968LYjmRPG5GCodEMWQhhszJgZICYUr0pocaHqc4LtAstshlobBTuG9+gKoBWmKo9xfCDa3hRFULWgPbkScLCA1cqGxhomhgqLMIv+khuAA5c89AWByrQct/7ujJVdJfNU/KB8FudW4BBHU/kU61NbSLknZ/c+pbJOvyi1KUvFjTvTrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fvGjF4PfUgkIlOPJzzCs56e7ItXIq85d8tOSHxzXNQAiAxbepGsD9nvvRflk?=
 =?us-ascii?Q?8u9EpdrYhGXKBWNSuDP79YFlaFzqCqojVI87U7iJCErwgJ32SF4UpJCFCX5q?=
 =?us-ascii?Q?O7q014EbflPs6kLcYzlLqqrDYaee32swxntRf5J7TY+THai9vvQ2Ah1e6cr4?=
 =?us-ascii?Q?VrR078jTo/B9Le7dJuI7z25LY555ezp8Ae1hlld8QjOmOvx94tQjoqrngJ7b?=
 =?us-ascii?Q?hhFQVehmdfQ/t9wtRrUTYF+6/S+ftA886zMsfKTySBJ9p49URiaQQYFVW46g?=
 =?us-ascii?Q?1YrC/azYw/4JMOqNYLyfCW9x44ag0LchBapK5fxYycnbmTdAHuEui7if7NoY?=
 =?us-ascii?Q?4SQoETPoGPjidn2P+FolwD/UmBJt5D9TNpClVdX4TTEAVtyCsJtmmv08OKj5?=
 =?us-ascii?Q?YXO+XxOAahlElZRjFt4u4rqfBHhBMr7kSElJLh2cCTYqFcBQvF4a1G1xbPYx?=
 =?us-ascii?Q?R6m5bIJAiVXEePDsiwljzigjDfaj0tpYSxAPTq+DDg8MswGWip2y49GXKG3y?=
 =?us-ascii?Q?HijRRUh2uZJSXrBTqs6mxE9RAtNhAXzzspYK4fS3/6bmUvReg/Naxn8OypV1?=
 =?us-ascii?Q?lKdfo9HDcU5w4XMflAYqE7Ku8jp1G6zqxeM25qGKw0cIegZHg0CqpmlpLrKp?=
 =?us-ascii?Q?MJvW1rat+vRTg7U4aV7L6EUlHza9Aof+NgYQXtZ93DHYTeuqVYKRmpwxipGB?=
 =?us-ascii?Q?u8JVpz7M2zXF0Tvu9Wf0Mp4qjVGz3pkgnGp99bKl/Fge/efCQXF4Zzd4bhh5?=
 =?us-ascii?Q?T+sB/eT1UrsLHIepo9cZna0RL6I4igd4rVPYLzvAj9gneIEQUQ5WvRoWrfnY?=
 =?us-ascii?Q?PNG5Qm96jhbwvfAt+KKjYbMc3h4WAUqEUnbtstRqW/q2C8E3kEe2ga5IxQay?=
 =?us-ascii?Q?oFwebqTIe2tXru9/SZPKaG62GfsJLZvgFAs7CvJxHnd+pbTUnn+o72qnWCNX?=
 =?us-ascii?Q?VBuSFxzOypxCRWSbRrW/iqcTbkwX+Xyks5/rRsMwXoX6eT9vCBRbwtwK8n+L?=
 =?us-ascii?Q?hZL9C7+ZbUIkKz6asz5yxqJakPBo3tQCfo7ytOGXFhFmL4UeXCf3+DwTaLge?=
 =?us-ascii?Q?CdNlv8wNeJSWU+hTJgo5XXX3fROKzinKOUhSKYIE6XjvSgDLEQ/ZPc2NA5bO?=
 =?us-ascii?Q?cz8+lbe1TTiBk9XC3/dbEryXGp3ZHEB6nvij58KONIpILsbOeVv356SpVlOU?=
 =?us-ascii?Q?PbPM/LTA0YrYM+QZW01LHsTfFk2v+Ia9/CdXTihOuYAtrkwUMR3cy6Bu2LuJ?=
 =?us-ascii?Q?MKVc+RDCfys3VIEpUClKubAugkdjB0GQuElvTbp2N6M5xOkPu62ryGsElcEX?=
 =?us-ascii?Q?3TL5kxngReCfd0m8Rb/6AUn3zsD8ahchoYpiEDnLi8h9kuYpDLi2GUcpxu4E?=
 =?us-ascii?Q?3GjYg9EH9rcAkTu+jRaZBTYzcmcBUZDjp4yUam1fXG2P+a3TLYCPN4qWUSop?=
 =?us-ascii?Q?+/pEvwXi0jBwTymZUngRJtB7EKqGQTFVgaS+U0uVsgEYdvRsg33MOYY4Cg6W?=
 =?us-ascii?Q?pmF/gfT/Gxaf4YlzeA3i+kQgqHVjpP953MRr4WKbXQu731k5dMiba0cxFiir?=
 =?us-ascii?Q?gVNUSzceXJEjYqx05ulHPh/JUVtub2cL4UQTyRmNhedRlX8OqXLj8DzJCfiS?=
 =?us-ascii?Q?GiHi4aBxvgr6Ee+b+zE4w+gaocUv861mwSSb1h4LvJdvCLwYfwlziM822CfA?=
 =?us-ascii?Q?ENlK1OpW8KLGu7KgjoVXCojk82JOXGVL+Sjox7r6feAOwvCDQe1aUmrDGymO?=
 =?us-ascii?Q?BN/DusPF0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d87f80-f4fc-414b-599f-08df10888447
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:23.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYkDC9OyQ6t+NvXUhuqmKRYmWZfdPAW941wphGhxtHRY7/wTs4RcVPoMcBggejMPCM6gP79a8HMyRjcNiogNmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GSP posts unsolicited messages on the same queue that carries
command replies: log records, OS error and robust-channel records, and
lifecycle notices.

nova-core discarded every message that was not the reply a caller was
waiting for, and an unrecognized function code aborted the in-flight
command. The GSP's error reports never reached the kernel log.

Log every non-reply message according to its function code, on the
receive path that already reads it, and leave the in-flight command
waiting for its reply. Event payloads, such as XID numbers and log
contents, are not decoded.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 52 ++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9f99e6bbb4fa..340760e384d0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -557,8 +557,7 @@ fn notify_gsp(bar: Bar0<'_>) {
 
     /// Sends `command` to the GSP and waits for the reply.
     ///
-    /// Messages with non-matching function codes are silently consumed until the expected reply
-    /// arrives.
+    /// Events that arrive before the reply are logged and consumed.
     ///
     /// The queue is locked for the entire send+receive cycle to ensure that no other command can
     /// be interleaved.
@@ -815,8 +814,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// The expected message type is specified using the `M` generic parameter. If the pending
-    /// message has a different function code, `ERANGE` is returned and the message is consumed.
+    /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
+    /// is logged as an event.
     ///
     /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
@@ -825,8 +824,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function code of the message was not recognized.
-    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -835,11 +833,11 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         Error: From<M::InitError>,
     {
         let message = self.wait_for_msg(timeout)?;
-        let function = message.header.function().map_err(|_| EINVAL)?;
+        let function = message.header.function();
+        let seq = message.header.sequence();
 
-        // Extract the message. Store the result as we want to advance the read pointer even in
-        // case of failure.
-        let result = if function == M::FUNCTION {
+        // An early return here would leave the read pointer on this message.
+        let result = if matches!(function, Ok(f) if f == M::FUNCTION) {
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
@@ -850,11 +848,13 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
                         dev_warn!(
                             &self.dev,
                             "GSP message {:?} has unprocessed data\n",
-                            function
+                            M::FUNCTION
                         );
                     }
                 })
         } else {
+            self.log_event(function, seq);
+
             Err(ERANGE)
         };
 
@@ -865,4 +865,34 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
 
         result
     }
+
+    /// Logs an event, meaning a message that no caller was waiting for.
+    ///
+    /// An OS error or robust-channel record is logged at error level and an unknown function code
+    /// at warning level. Every other event is recorded only by the receive trace in
+    /// [`Self::wait_for_msg`].
+    fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
+        match function {
+            Ok(MsgFunction::OsErrorLog) => {
+                dev_err!(&self.dev, "GSP reported an OS error (seq {})\n", seq);
+            }
+            Ok(MsgFunction::RcTriggered) => {
+                dev_err!(
+                    &self.dev,
+                    "GSP triggered robust-channel recovery (seq {})\n",
+                    seq
+                );
+            }
+            // Nothing to do for the remaining known function codes.
+            Ok(_) => {}
+            Err(raw) => {
+                dev_warn!(
+                    &self.dev,
+                    "unknown GSP message function {:#x} (seq {})\n",
+                    raw,
+                    seq
+                );
+            }
+        }
+    }
 }
-- 
2.55.0

