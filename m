Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A32387346
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967222; cv=fail; b=q8LYR5wuy/oCU88v5oTtxz6LHIjavA+rgSiW+iYCY86chshRFfA5YjIn4K5mFEe3ikSNkeeyLmIF6piX7WVfwgL1ZlOEe04396cg/g1JIsWkIC1UEHZzQAQSY/0XExwXY07u1kpIwJ786KoqlFmx8bOlDGDco7N+H5DOFi9AwGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967222; c=relaxed/simple;
	bh=b9HzY3kJVVTLGqS0zdMEDaHaL2S8Rmd+KC/3NRetZTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hjwg9C6kaxo0PZJsZ8Z9iphkMM4GOdZWCsy18jUAke3sENnuoAboRMp1f/G2cYadUVrqjKRka2bZaWtzUelj1+M1K3MbIFBYq7Vu3yTyq1xm2QBNZRJpXB41BkXNgFAw50j7RSn8ddFF0KzqQHmQGu4FWURX9kAMl4EYFO/zX0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NlFkgonH; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NlFkgonH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3DCK1CAps5yM6V9AH/s2B0vrAqzGdM/6JwG4aFoV9dqB9uIy+glT8KrvP80TUW9jYJwhBDNSU+EA3du+sjOmBYlB9aB6bks2LMCsfZKJGnTVR1kILfM8ErdrxZD6ygCTPCBh1XQk4ZgQy6VvF7j3vHW49T0KidnTxw7IXSZGz0zdc8sjvm1394XS403dn/dJOYBIZmSE5bR1KJqzDN1tFph8AQsU6Jk7NqK+Tq64vEaSPNp8+MWWF6gfc5Mhf5ygufEMHnED861A3JVPXQu20GyryfhlG1VrtkxjYn5IgWfg1M6KnUaR6DtcHTwyfV8kZSR1Lsl1t/vKbLzIk08+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mlk5ak3/7QCGT1Ud2zxMof2+83i8+FVYy8dkXQSeS1U=;
 b=ARSaB3OpM1h/OOUAk3lo5FzTHBKcSE+Zq0Wtxobhv6wjkJYWxewrNKRAPS+yKMbhaNoz3NaXulrQtKZaxZOf5wgiYPBVR8RKOrxK79S8rElfHacCpWETQ9R40TdWBEV+caYhnQspJAqI5zed/Oj60MxpNne27sKN1e2yGXpgoLTPAFG5XuJVIdFiUo0Nfca67MTPelNDrE8/xvZlfLGszxzNFeuAstbNVZcmd65vdbOnwvN+nj5ii56V7+E8MTElewCMxNu2hih0bwYb8R8pZiIHFM6eqHd2al1iRASNWLHLwoI5KmKJYKiASB2/lkN3RtVBoeEc5zhJoujjdn9cDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mlk5ak3/7QCGT1Ud2zxMof2+83i8+FVYy8dkXQSeS1U=;
 b=NlFkgonHvnfM7XCX9QAxNnYAJA6CO78QKEPGYmvD83buMz6lHylusfA3T1ux11wOBH9xhOPPLmZhoFvn8sc3EYns0F1pvS8CmYhnE/Z3I8gbUz2Kif+g/JcJz14ixnn+EJwviqK/b2PrBrqW6QLhROP7x16HBeDAOPp/Wt+XElVa9BYZ8FP78f6erGk1jACeuNihJAwyNKI94MNg2PExQ4MpiQe5lRCY5mwoPuWTJPJlCHQqtSZpa4EWHjGbE94zc7lrJc5brSTiFgzjEkXWbMCyc5Sob0CnwkJT8N2iqzZjX39xBVyf9Wr5R3bo1t45Ui+sKpvapXB6NISP/bK+RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:34 +0000
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
Subject: [PATCH v2 08/15] gpu: nova-core: dispatch GSP events instead of discarding them
Date: Fri, 28 Aug 2026 18:33:27 -0700
Message-ID: <20260829013324.499542-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf021d5-d667-4ab7-3299-08df056d8a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cBbkoOdpyQpjJnbP+LAJwA6/a5W94LknclF6l35X6joc8rXgErB/MHe0yzettL34G3LLEVolOpXIvnWCrDe0i2VwaiW+vg+xnV9gPjrOFeS2a57iZXtMzKqWJc1uUpih55joBUBO3ej/iEZRlq0cGHia7jKTG0mJLCG8FCSjlIn3ws2KPQ1nDCj7Qf17xg2OKco/cjhbtNo3uZLzzTIVYYMcVTjgp1673NfRHW79nLfz11eobHTyjyWkC0SDYLgFaXSlgLug48y9Ai6tq76Y7y6c4LiC9A4soSuoBvOlv1kXOHPOb8EPhsXNGdkso/l0TEF1lga86Q20D/utP4j40DfYQWWGc88rxpC5BRokPyXHxZkm02Y57xOV7ZkkgWE4gp2utK/HBX80cKhouO15/DolJStFfRtnYgqWqgiei3mLEefYwiaUC1UA+XpoQ2dHnIa2OxKoIlxmsR8CxQ/kbWmQgyzUTnVka7x9BwaRefMvg54j3PYGceByDIMpJFG6kbgh6AmFbvDxRURWrMcWmJ2xsj9qw/+SIptnE7JqAsH/T35SH2c/QpZMTTMExft0VSs57C26QiEJUf5lMhAhfiU/3CWx0O+t6sN9VBWGF2xTuffcpB/Ktp9GU6DKfi5QK3QnLjn89M0yc1YQJVf1VDrF4GJ19jBTYhAZjX1I9aM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TyOOLztPHGwdhBD2T7obDDOUQ+bPCE2fIDoR1LUr0UAN0iuoTwpvg1+YuS4a?=
 =?us-ascii?Q?DCyunWIgmwRzk38ftU+c+jtHfux/QCDAAkkYtz3HuE1YypESmpJVbGdDtS91?=
 =?us-ascii?Q?VjbhmQUYxmO1VvwRGoGpSzDkaY3ylE/jZIGc/WC3xhGdTlhjcawT5RNcnba3?=
 =?us-ascii?Q?wz8vQtXMX7ECFzZCeL7SZ77cSo0HOMeOPwjYYYdjCnZP1x4AM5bLiyxN3m42?=
 =?us-ascii?Q?83kxHY0erSim62cHm9YQTRH8e1lluMgYiQdWW1ObA3zuUCHgIZdsRpdQcj3/?=
 =?us-ascii?Q?ERpS+96ZI7y4VVJg6Bgv+NQ9jZ+Obbid7lhXIJqe5YVUEO0DQZGOqawxMgAD?=
 =?us-ascii?Q?5YWj/vhOL0gSomPGtxqJ3uK2f1xwrVLaxGEHPhQizGiZWicwKBhLaG1AZgem?=
 =?us-ascii?Q?SUagmCCl2JBVrlkdHH2gIc5E62N/OKdEZSyBN29BCWU6iC7dbAMLLLZqpRvd?=
 =?us-ascii?Q?cDoxIMQPRz3aNQwWJi/7fdmNhmqVkXsrAnhgkC5K1aPe+4hae8PzoAoBgsJN?=
 =?us-ascii?Q?HINVRTg/XP77a4f4wEJ4w/eBhysnb50og88ranRLxcBauB/+/pdhbDQ5XpSQ?=
 =?us-ascii?Q?ajKZJIZsepbOMw4yLL5rue9tpR55sudB2vn8+AA/2NUd6RYlZOvv5klPcOKm?=
 =?us-ascii?Q?EmQjLNomminc6dLMwWPiJSABKMLutkLbwa9yIMwXY9Uuj5GaRATJ3A9sXg5D?=
 =?us-ascii?Q?Z/pvSIa3JbTL8d0DP/0RsHyu6GCFqI8tm7m4CgXbpLFXW/w1SC3VHKx4rHoQ?=
 =?us-ascii?Q?jX7FLz9FtR2BrWSmc3rR9G9srUSzKJV8OLrlZoZvkqV08ZXQlBgjIft5WnkE?=
 =?us-ascii?Q?UH601h38eiVlVXRzHjCczg6xO1pK/UvX2ZPEcJpQpL1I0EVzK9w47hBL6Q2e?=
 =?us-ascii?Q?mmJh63iEGTW/vD47ldupfBUmxMoFxmi0IW8sjpYoxKT+XFMzNNCC0GHwXvhq?=
 =?us-ascii?Q?gdnWE03xgBBWYUUAnKRCjR+lQGHeh+6etUWYH90NrHzkFTobUrll94DcIAOp?=
 =?us-ascii?Q?m2m39HVflWPWI9TSeFheNwOmA9n4sJHhBk/KeHsjPtVoLFrfH5nZd9DkwT7S?=
 =?us-ascii?Q?C+N8W+jRn1ERe5G3FUt8sqSECqVPG65XMRW8vyEVrYXDvHg0hTpnCbLfbgXs?=
 =?us-ascii?Q?lEp8naQWU2DUk2xn6ZBEXKbY3omn9FQod7/M/EnbbKZ7IYR7mL3Jxz57nkBW?=
 =?us-ascii?Q?nTTgXMI/oQCsJ41J8atNVUkdGs4d50FaZst5et5wmKEPdjms33F8QdyTqPhH?=
 =?us-ascii?Q?eJuCM/krbgHgUvyBRKa/2owlaC511wi9dUGFNUORmf3AoWB0Km6JN6N9xDR9?=
 =?us-ascii?Q?tc+e5HuGKiYQwtDQJtuVxmiyqlR8BH/z4hrV4j8PNHsDqkid2huW/BkPiZdi?=
 =?us-ascii?Q?a7O8LL/KwZC3LPaQ9eqHmQGLWZ9F6Omrx1MIDeBDVQkp23ew/HfNv9qZ4dGb?=
 =?us-ascii?Q?AWmkeBXxkrlxtUvQYVMi7auUVmB3ZcoIlwi98SfyJB2lqwo0+TX/lb5jf/Cj?=
 =?us-ascii?Q?4xVA6qKlBfpBtFfAnCWnY7ruODvLo3VuB/IumYV+OupCsMqG5U9qeWqTV4bt?=
 =?us-ascii?Q?NmSSVHZ+40kbKMcg4CpThRmrOHP0uABxxFMTsK2itAfUS7QgScg7Zalw6HWA?=
 =?us-ascii?Q?5zabshVt8Mm6AAmaFitpG7eJ5S+PUinh52OBRW4zXrM97RUzIC3EnonT5EA0?=
 =?us-ascii?Q?t94sNhyVmulO/2agmlmrchLTdPM9tygijXKYMg/AqKIb4pAfHy8eOQwQ8gFc?=
 =?us-ascii?Q?l/Le6epyRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf021d5-d667-4ab7-3299-08df056d8a44
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:34.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZaoAG4DBXTqpibgAX9je3iSL2NFIAxxaFTFLX490lhWk5YH/LnsPUELMi31FB1WCwI0DFRnFHAWMZwlhvd1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

The GSP posts unsolicited messages onto the same queue that carries
command replies: logs, OS error and robust-channel records, and
lifecycle notices.

Anything that was not the reply a caller awaited was discarded, and an
unrecognized function code aborted the in-flight command, so the GSP's
error reports never reached the log.

Route every non-reply message to a dispatcher, which logs the error
records and leaves the in-flight command waiting for its reply. The
dispatch runs on the existing command and wait loops, so events are
handled during normal operation before any interrupt exists. Event
payloads, such as XID numbers and log contents, are not decoded.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 64 ++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f0f28b6ded7a..0df52df1da89 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -547,11 +547,11 @@ fn notify_gsp(bar: Bar0<'_>) {
 
     /// Sends `command` to the GSP and waits for the reply.
     ///
-    /// Messages with non-matching function codes are silently consumed until the expected reply
-    /// arrives.
+    /// A message read while waiting that is not the reply goes to
+    /// [`CmdqInner::dispatch_event`].
     ///
-    /// The queue is locked for the entire send+receive cycle to ensure that no other command can
-    /// be interleaved.
+    /// The queue is locked for the entire send+receive cycle, so no other command can be
+    /// interleaved.
     ///
     /// # Errors
     ///
@@ -805,8 +805,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// The expected message type is specified using the `M` generic parameter. If the pending
-    /// message has a different function code, `ERANGE` is returned and the message is consumed.
+    /// The expected message type is specified using the `M` generic parameter. A message whose
+    /// function code matches is decoded and returned. Any other message, whether its function code
+    /// is a different one or is unrecognized, goes to [`Self::dispatch_event`] and `ERANGE` is
+    /// returned.
     ///
     /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
@@ -815,8 +817,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function code of the message was not recognized.
-    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -825,11 +826,13 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         Error: From<M::InitError>,
     {
         let message = self.wait_for_msg(timeout)?;
-        let function = message.header.function().map_err(|_| EINVAL)?;
+        let function = message.header.function();
+        let seq = message.header.sequence();
+        let matched = matches!(function, Ok(f) if f == M::FUNCTION);
 
-        // Extract the message. Store the result as we want to advance the read pointer even in
-        // case of failure.
-        let result = if function == M::FUNCTION {
+        // Bind the result rather than returning early. The read pointer must advance past this
+        // message on every path.
+        let result = if matched {
             let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
             let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
 
@@ -840,7 +843,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
                         dev_warn!(
                             &self.dev,
                             "GSP message {:?} has unprocessed data\n",
-                            function
+                            M::FUNCTION
                         );
                     }
                 })
@@ -853,6 +856,41 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
             message.header.length().div_ceil(GSP_PAGE_SIZE),
         )?);
 
+        if !matched {
+            self.dispatch_event(function, seq);
+        }
+
         result
     }
+
+    /// Routes a GSP message that is not the reply a caller is waiting for.
+    ///
+    /// GSP-reported errors are logged at error level and unrecognized function codes at warning
+    /// level. Every other known function code is consumed without a log line, because the RPC
+    /// receive trace in [`Self::wait_for_msg`] already records its arrival.
+    fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
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
+            // GSP logs, libos prints, NoCat assertion records, and the other known event codes.
+            // None of them requires action.
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

