Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65833876A1
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158706; cv=fail; b=Af2p8GlMpELhf12BrUDN7oIdbc9eDWJPip86VP/uHqH+AjYSFSz+GM+pAGJRh6D/X/hmvwiryV1gGAQwU1ezWH+tAdHzbE+PTfhc17w1z7Gz+n0yeu1YNo+9CXjBry4nh/Mk3DLR+8ucicToxQzT92NzvzCpgIOnaRnVUPHDcdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158706; c=relaxed/simple;
	bh=b9HzY3kJVVTLGqS0zdMEDaHaL2S8Rmd+KC/3NRetZTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=usOQXuXQpqqqdzHaLS10CLy4L5XSr3ghoVu1LP2xujNXwLtu87qB+GOxyvlBs6WsXnvLaRIK0Y8OSJIWsbOZn8FWu0EdtCqb+Zdvzq4FVhv24cDb0fNS9bM7KwEbk3A/ZGQJm7lqHEBUBRIELjkP+hjs3jCaT8FbUSeZkkoLY7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fzkGGis5; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fzkGGis5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pps3sonoKbMCxH5i6192wyNFP7ZNxstsv9AnNjCpIouK8zc7e0fjkCu6aPsQ523WgZERWNhmpkU5uOrZq5BqpjsaYsswaKnsOP1jANyzXbnedT8W3Hkoc7ckmE6IAvx9FCdowJNPXgv4NDzEwLPl+XdrLU5SqeUyaJKTiusUNN/ijIOEcgN1bnAKtUni9XcDzn9vW/USuqdNRUmmN4lyTmlcTKf6+G2pdWocuV7AOiF+JJ31Nfv45fUl1yPdIAnR1H+RjAZLsL6lM+D96kZMGdBHNe80hD8Lv2IaW34KyhI32XXFLt8lNThkPW5SgV7coEQi8qvkMlnFW1xryh0N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mlk5ak3/7QCGT1Ud2zxMof2+83i8+FVYy8dkXQSeS1U=;
 b=GFSzWHbj11DB1FvDVHfY6DYHDXKr/eDB5S9A3siIWn4JugS7LocxYwFU9bG8UMhyLKz9x8D10CdDi1NhajbPq5EVcnIJXlFVBZfW8czlE2CaEpSKHLuPtcUZxp7qxT3qTKtdP61Dc3JgFVIUgcNSBAL3cJVE/teRGqmIZ4kDGG7Mt0e9aCY61GM4k+0Yx3iQwG3CFTVOXwazIF+SnOxTPq3227JDwEQ6sCxYkNcoP2rh7E7hAIEdEVd0/QiuQ7UAffvzjw3XNzTlAw+8zDHPGZpng4q/HFN76CxWPjnyFSOZXS0+mvLUQbG5cghhwYdkGJm5k2mRxTeB4P/YFyUVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mlk5ak3/7QCGT1Ud2zxMof2+83i8+FVYy8dkXQSeS1U=;
 b=fzkGGis5lbnpcHygkGWLKnnWputA3tmBqng1OooXki2vbDNr6KO3ZwiUaWTtqnFAvNLu4Vdz/xIprKZDWWVHqbWT4BLMnQDsUFkvRLW8SQ4W2krwbfeUsPpN+b739AhjFah7Tr6pkJ7SP3ftgK/epqY6AQUj9O3/WpmopxfHTmCWmje2zZrEZBOQCxNsNU/aLFm9FHbUB4R7rWOSZp3ddjROs3bShUh1ClZusAalSDTdXA4E7SqhTenrmMSPxZ4x/Jdf4OAZt42FL0dLPOwQtsAl4DW4sOqP7s3CVkAwWd7dJAWg6zJ1xfc7miKDZG2d+m4EO2iVud948q+W+vZdzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:34 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 10/17] gpu: nova-core: dispatch GSP events instead of discarding them
Date: Fri,  7 Aug 2026 20:11:12 -0700
Message-ID: <20260808031120.363869-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: ac985e98-5aac-47b6-8d48-08def4fac07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+KRCqMsjCnDBLlutniEwBcBpM56DC+yX0HlLxofFVUggnWZO+j1Y16uovDOd7tNkb1cqhYVsoGydSku+Gcl4BMvXMj/pn+7/C1N06iFO20KBtYgBmeYyw2kDEXDpnZokfvFsYEPzlVnNbpXRHYvRKHw9AK/ovrnuob54hcFaMosYNc19AQ1HNoUNST6hKKksfOvdsj9lBL1VPo78pemBiovW+jxcKUxbVrnEKddMnDFF4P/nUvbnU6+IeIYxLMhxi5oR0/N+quo0CJX/Ggx/aD72EhgTcpk4drbpgf1DX4BYU82OeXExAPXhBp8GzNFLmgNzxauYPZloPDqeGukRfsgG3illX138pJF9e1nAdk+kZ4UrCdayCZwPjndKgUbP7J4U6Iq6vMjryqykwIUvfjGoVrcUNbpOzjXRu+vxEtLCNO9mryyy4z6cTcAdgEF3eh0tx4IToLkhhmMiUCju/ysdMjxAigwyM/aKcg3QSdOFCkuDMSS9hwT0vM6Ea+J6R/jqf10rtb1F19PnjRPTjLi4QKGn07vpFI4oq/XKWZYKmzG3YOag9dPyWWiozglmIvetg5qF623pe/6DQwSBiKO9qh2ZVOdTOyRXxgA8zYumSEoRw5OhcHixiCIL18pfbGFpQqq/vKZVzHFFhrzW+WZPDaRHmWsU85aJjj9Hs+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nu5tzc2EfG/r16HU/BjLU9AzfDVdacTOVEBDXPmx/k4uuh91svrz4amzObLp?=
 =?us-ascii?Q?TjMaet3L6riwPMnC05CxX0kTuiW7EgXS8mX3oJcAiR3UN57ORJMNSnAINACy?=
 =?us-ascii?Q?zE+XL41zWjH87ORdBTKTJIaLg3zwXlNpzpRLn+dizpFb+AJi6qxaGYZ4KJVw?=
 =?us-ascii?Q?6fpEWM4ordyz7Bvt4jyHdH7ldy4Nlb1etZgkrghSajywOhpqL2AksBR2/vim?=
 =?us-ascii?Q?SIR03ZnArsdrT5ZNLKKSEkNGSsST2QejrHZtNVUDvXkD2zVcPncOW37csx9l?=
 =?us-ascii?Q?0t0NPXEZZz2vQAy45cATMJsjButHaTrS6NqnOZmMVcGpk3KvIDNpFuGkFCv+?=
 =?us-ascii?Q?Sp6j8zxezHHohbSzXzj+Kv8Se3HuhmXJo40xWmiE8qWf60F+UnWY/OQG52Xt?=
 =?us-ascii?Q?pZ8AKpv9JxCO3BD8tV8VHrZtZZBtq7B37VSlWdsdOqRq+X831hkqII+vAIGX?=
 =?us-ascii?Q?sHo5/VOt8xhTeWkZnyalUTmkpvUIqTuc8Eap8Ax4TXHVc3BRATfD4THVLvjF?=
 =?us-ascii?Q?gnYBglPhwg0PMjEmyL2cCEbgo4zGA+zEW9ib74vh6E0mw5wlxwFHM5fy+Ulb?=
 =?us-ascii?Q?45/QGwKD5G8NebK8S/zPSIBedPJ4/G+ZmQF2z147F6DSSCzmbbOuG+1Q6FOI?=
 =?us-ascii?Q?gNavZPrIKMRA591XR9mUQw0mT7ZXTnjWntD+yrWO4z2TGmfrUDLGiO347zjb?=
 =?us-ascii?Q?eEyxMX/bj1jGeyVnSzGNRtdyf+Neq7P1lJhEa91xvutTkiAsqv8d8/eevXXF?=
 =?us-ascii?Q?LAQUABA48Rz5xqeWUEx83oR9GV1y8LL8KDVNypcnQweTM9RVqjOtlEB199a+?=
 =?us-ascii?Q?J2MBv4CJEMozbRD3W6KQKdoiIS8CYS8jcDyd15UUH2JGCF76FLSOvZixljLq?=
 =?us-ascii?Q?DWeO1ZHKvxiF6DIuD9xoXDW7856hRS9VLQstX540wA/DxjeM50DTccLgDuiZ?=
 =?us-ascii?Q?mocdwo1aChp96z8cRO/ACU/FExV063cqmGw8X5PYv22sFy9ksXz5xJBjI/A8?=
 =?us-ascii?Q?rUK3sYvJ/mIxmgCgoi1tzvqTE4Z5u1imFEZJffyFjOsG0+bf8u6IVgiqE+Mp?=
 =?us-ascii?Q?EuqcfEywPmDagq9QhrQolJLW3tFuM/+eXuXO5r+A6ozYiDraOyKW3iAruW8M?=
 =?us-ascii?Q?WDKRKrrO/KCP8XwJci2ZiTifPlhDzqHRYwSU3PnGgv3CLSTAoDxukpjwy7uX?=
 =?us-ascii?Q?IbrfK3za2AGOHiLdsQ6yv0jTh1+xu2VIeD1kwefXMsXK0HzMOVUTe66dTdpI?=
 =?us-ascii?Q?GobWYYM8xTRMtfFIRooYWzBws3ZIv9pu5eB4hVLQ+nQ9t3FEieaHFUIYd6S+?=
 =?us-ascii?Q?QQcmJuDwc5lFFv6RbZp/F6IhUBv6v/2tKcnsm4F8sha2mAINNOpHSuob6Uzl?=
 =?us-ascii?Q?Lu2S9CDGZqurMP9X+odv2L3cgnpuWzxhZpzgTCybqenrM/jROjIQ1Yada4+S?=
 =?us-ascii?Q?K+aWyzZAZkl4qt+BSIe/GP0cNNSPGRXCWRpsbBOssmQZQ83/JodM+D24uCT6?=
 =?us-ascii?Q?gy7wNMC/Ug5xe+Fra5bVNMwbVfDNxuzpFTxEZwSi0i1ppTEwbwCRhc1ldouk?=
 =?us-ascii?Q?pbqwlb7i63+/Hriids5YEPPMjh5ipz6os7h0CFS0wSRTbHrMvWWStwlPjAaD?=
 =?us-ascii?Q?labXjsWY0EgV3AjZJqPWxJ1BWefCAyT7aDIg3INcYC0OwgCWe2WEbylOJu4T?=
 =?us-ascii?Q?J8qHnq2mRsGA4rJUsyNShcXlAy+6uUrlE2lXCb8zCUpmJY3IpwR++/Ns8RIR?=
 =?us-ascii?Q?0SI4pL4Kaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac985e98-5aac-47b6-8d48-08def4fac07a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:34.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWIzZuIttv49Lc92pS+M0gQB+yBWH1E27KyttgY/o8CeD8HEZ85Pvzdk5RGj4whWjv/SheX68g39u1jBC/m+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

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

