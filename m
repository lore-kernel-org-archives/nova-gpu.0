Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC08A95E
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111589; cv=fail; b=o/CzhytvSrFKAuQBdhGQujBda+VWQ0SulDCnJG3MJ/ezlcsnVNhxovlrpagb/Xol4x57BIU4Y9q1h/lZRsvXLArV2QiHzggkAlA8s+Z8ehLFi9E76cPr44DQhE8wxBfVfFq4Wn1hE0Da2Mwk6B5mbse0wHSwVqV9NzqhBJiQSLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111589; c=relaxed/simple;
	bh=PquewrBMWE1SdW2RP0bgZY3ke6KhNt2t0Xx8I/pFVKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYun5i6IW0CnsK6dMMNgAE8gxGQmT40wAFnT6R6Surr8LyY3auX09vk2SRiHnJGcjOihM/N8c/NzfehIOap/ZNTqHE+nyOQPWJw5XPeSkM6mqDPD3NAOqpDLBdBJYDnH4yGMJEN8JHTNztPsLbnbawIOw8/3qnZ0+1S849OJDGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sOcJs32O; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sOcJs32O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV0hJqZSP9HQaEsi7GvCE3MPOILsZ7NC7qGSUDmBYSDQOxG/CaG6piWlwB3uR59ZMnD6vdPsdALqGUcZvZWpb/AJIbZ8g1hi+yPvXDsSHsjbr+fvKJve9YA8KeCkZB4axYnzQC+8WwFWizfG1lCJvZHbC8n45VWEZGgtu5eFqui5pr0F31suq8ol6FbIASwSawb5ZEJCmnXdNGEfjeiBHBuZQZzceTZ8C2wlyRrxoO5UAUKcjlL0njolVbwz7zuRtD72QLahr87RCwLvhPphHlrEnUwF4IithyoinRaxc5qQn3UezUzz86tcBtxfbE7+w/O1vlCIRLd/NiHNwqhtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eIC7FDs/BFOEJphSqs0EQ9BCb3JBgbLKFOX0s3/xI4=;
 b=zM9r7UInoK0oID+sm75jhfQR5ATjgQoJLxaOnpbXQJmR6nNtIvKAlKmRwUn1TkMlDOIBDDH9CBncdQSgRUyoOz0gbAAFMpWHxrujTzgfXtSJ8KiXcVrV+plNvLzrFnSdO0k37sR1wHqAIR1yDVa+ojDY1ZrjMIIGTQTn/DU0nmmofrwqNfil/H2xB+KejPrdsm34i7zr7IBJEKCokLS1Sr+RnjSLb8sZkF4fup3kjtLngdsB0uTQ/B6xZwd55n9Q+VlWODQo+T6hvvdEEDf1EU98lXKM29tfQ/Ar4JxvQUCfHbzgqq7sQokqin59XWQvtCyE9ZDY0zoB4DAgMmDicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eIC7FDs/BFOEJphSqs0EQ9BCb3JBgbLKFOX0s3/xI4=;
 b=sOcJs32Op1MMcOgpUQ6SgNypacrF5Y1r9AHdb1V+zBpezvByoZftxn6TiAhJRKT0a30LIW/LXxuUTc/jzZCpEFxy0Uk7YjA4kZTmBqnOiuI9LovWsDdzESOxuzv2vlZWhUaUgn+WKqWL59EVonE0ClFsdqgz4oQ/C0zJOdj+FE0tTy494LNcyqW7rUNjKZcKd5O6+FKtgbeLwE5QjUK4SWgKsTydho2c1NM6phwA/LDypFoLGlfaXJTb23oWiZwyW8N56PJF9YAxWs8FM6r7nxbb9S1CMunnej2eRNnC9b4bhqzSMFluhsBLY4O5BZgpMIDOsgBOSuo4g2U7TVVYUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:42 +0000
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
Subject: [PATCH 17/27] gpu: nova-core: gsp: add GMC dispatch on receive
Date: Tue, 18 Aug 2026 20:52:10 -0700
Message-ID: <20260819035221.336390-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: c35d030e-d5ab-4d81-c881-08defda5525c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pjq4TIpR16owcJ8U+zTza18cj6eITYD4N6fGuQATaJHOPjndlWjAAGcN1HFTt0kgIu0rCrB6aQYVbKsjRrEWR6611xdTbVoPwGB/4gAgWCZUqbe2qr9+ZR7TFhROw787AY+wLOmRDodgp5qr1SyuRsCcCnQfSM6bj5hJeX8VboNiSHV9JPRu9nmJdIvUu94uaqx+G1QkGssuXC6MmjpdnwJzHR3U1fnqyl7bWyE1r9mmh85ofnHK72Lx+u7n4DcPGh7ebBlL8TjzE0I23zxs2qQ5ODza6zzpj357CPuS8TlBYiOgYQHnPtd6YoFQ40Sy78wpqy9X9M2xInHa96MENbaS/NY+ZRS53nw00qEzWyKpt7Q2nwqf3EQRWVCSaT/V2JewR2xDGAkDbyUuaAT4o7Cngv+kbaMjj+BFkYF+ALMBGDIPL9DI9BavvqA81urYUMO/ctB7max1HNvJLDSlEC3Ni5qYnmWYYF0mgl1n+tBDA/Spzz/1oXB0PpooIf0vlLdLKRuywV01DBkkhuu/9/8/VKxzD5q1MVSLqVqgtKYY/3S+nHxfasNyA01kCLn8pEqCTfZh8NlCR8LgWamAWCTYPjnwtV+4RVTAMpvkpSwMKM2N/xYCgc4NG1CsZfVIMHavK4NfCfz0ZbFvjFuSMkZfoQBg1PrzjvGXquxokm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GkJxJbicyyNY9S/Q2IDsAf88Vn4Q0UH4TLbEkays4gmsz0WTWezUvddzMtu?=
 =?us-ascii?Q?p6bum82AcIqPUQ+zw/X9cYmN4dFoDhADKdnX81cWmxj35GHnO8NAzQgCmkcQ?=
 =?us-ascii?Q?BTaI7li+ANG6HG9uN2UH0LY8A4IgFIbvjIAvN1pIwXgjaow68d7SKTyNw174?=
 =?us-ascii?Q?b//OTHzdkYgvupF0siM5g43bNlEaPUjlVLeM4VgFhOrVbGkiUWFGZETqte0A?=
 =?us-ascii?Q?jbIurxg2+ZomzpmPQtDwLVSXFpynwP6cxzxILXn2YEMJ8kpLPmiblnH0a1L2?=
 =?us-ascii?Q?TeTbk8warYG+uWGeEVuyodTnvMjLsp4fB8HH3/yOy/8HLMvSjLep97aqFyAq?=
 =?us-ascii?Q?ttK1Skph9h0WbUgjDNOAc4JkMlryr4NbLHCuN1auC1qBodKmTvpadil1Tx8+?=
 =?us-ascii?Q?1YH8d8sNcZ4C0agKxckWuS4zjCAd1Y9bUlkdhqfZtM50TNTWT1mXiMLG7aJy?=
 =?us-ascii?Q?dw7rteFlGkNl6BjCaUETCLomLjeWKxnQVLPqLQHEuU5jpsyF0NdiDzRQu6zY?=
 =?us-ascii?Q?3e/+eq2W/4S3LuN+HPDIW2iSOiiVi1SxFjCSZgagfiP3yfPpr2D4ojXi2JFM?=
 =?us-ascii?Q?qitjIlWEQJoLH6Ph1ENV/5ZLayMQzFW8QCu3LN34GWCOhmyUWcUOCatSWE2Y?=
 =?us-ascii?Q?ek3rdbTzMFqhXb9LOdLxRuxUx1Sss5UK5lx1r30UIsWqQFlxYqseTl/j5gIp?=
 =?us-ascii?Q?YILXUBP0yxnCX0jssRX2j0SdBkvOiE06yr8N0avok2yi/61puC+eooF3OQ9Q?=
 =?us-ascii?Q?gxrxbk5LPmy6GIzxOwlfuyHXq1ZvTlNJ4d1mi5LUlbnEj+oT7J28ZqGgGZiE?=
 =?us-ascii?Q?6qW4snPrhOrf4BZVKwRtBQ55oO7lam7AuAyTbEBcGfk7A2wonX2BHc6zh/Sj?=
 =?us-ascii?Q?Dtd4Zg5jGvJMZi1XhGA9gHgbTs8f7Vk4lgpmjdqzchn36njfSelfk9QJhKXM?=
 =?us-ascii?Q?vx3Of8MnmnPlmhr6wEXNn1aJ36MZ2toygmg7epGCfmIEGr4fey67F5dXvxw4?=
 =?us-ascii?Q?CSV6+HBn+y0+WGvhJnCxE6JJ4Awg2ZCcZR0QatQAwiyPUjWuLcWwzfGXNvdJ?=
 =?us-ascii?Q?hX65XrhuaRv8td/Lg768+TlEiXRKNFOt9RZCnbAH7Ox6Y6YRIVihtKrJXv6n?=
 =?us-ascii?Q?ewvEenInG4qoD7jpJPIGgpAfC8rTW6gAScqiXSnKrTOi6M2F4i9SJiR7ELwB?=
 =?us-ascii?Q?vWceKPgdmTs6L2qdTIKjKVhSKNxgP3yHoZSN59PPjFhVHq8iejlrUwMr2mDd?=
 =?us-ascii?Q?0Qzxr2eZ+mc4XSTGs7JL+14jMB6XnMtnAvHY1H9eryQRtcPo2mnhN2sPjmWk?=
 =?us-ascii?Q?hmBk88ygBwLuRePl/V7LErHTOWTc11EWw5PeiDeizxFjGMQyh4gINNmbNXW5?=
 =?us-ascii?Q?lt7kgL8Jt+1W4xEeK82HNSzKFs6OugeCVCeqnA19i8jfqnjf2ERS6IQ2+a91?=
 =?us-ascii?Q?KzclQTAPuwd+/2KOjjYfwYldyCR8JygFuXMzqVU8KO7pqla7UkKM9cGr4hol?=
 =?us-ascii?Q?7NmMcRvL2GENHCbUcaU2/y2T11MjHHSqVH1Y06xgkiP5XyvRybwZQckk2ihG?=
 =?us-ascii?Q?CquCVIUljMNF7UoNOsJRsbdGRreHfMA8e5MbDZy9lpJLdByyxb7iDeLyfIY8?=
 =?us-ascii?Q?4mQer+kRyEPRXXPdc2pJq3ttkTqjgTY+cR1NUbrBcEyCpeXMO0A9RrBYAh5t?=
 =?us-ascii?Q?60RarLlya+wpco4lK0ky2Wc007+nhfT2rP6mHM9J11sO3aL2Falw0MFy3D2D?=
 =?us-ascii?Q?IN+yR5kDTg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35d030e-d5ab-4d81-c881-08defda5525c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:42.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYL7vj2hAg0DsMhlBewR/O0F6gcKntXOENvCgEoMpHi8S5QfR/0AE/0R9Q+jFQWmWSy1JMLO1dMZTMp4+llvyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The r000 boot path delivers the load-and-execute steps as GMC events
keyed by command id, where the RPC path keys on a function code, so the
boot loop needs its own dispatch.

Add a GMC receive that dispatches on the command id. A GMC element and
an RPC element share every field through the NVDM header, so this checks
the NVDM type before reading the GMC header and drops an element of the
other kind rather than handing the handler a command id decoded from an
RPC header. An element nobody claims yields Ok(None), and the read
pointer advances on every path.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 69 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 20 +++++++++
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index fba94153e744..7da61bc9ad92 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -641,7 +641,6 @@ struct GspMessage<'a> {
 /// A GMC message ready to be processed from the message queue.
 ///
 /// This is the type returned by [`CmdqInner::wait_for_gmc_msg`].
-#[expect(dead_code)]
 struct GmcMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspGmcMsgElement,
@@ -791,6 +790,22 @@ fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
         self.inner.lock().receive_msg(timeout, None)
     }
 
+    /// Receives one GMC event from the GSP and passes its command id and raw payload slices to
+    /// `handler`.
+    ///
+    /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
+    /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
+    ///
+    /// See [`CmdqInner::receive_gmc_and_dispatch`] for return values, queue state, and errors.
+    #[expect(dead_code)]
+    pub(crate) fn receive_gmc_and_dispatch<R>(
+        &self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+    ) -> Result<Option<R>> {
+        self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
@@ -1314,7 +1329,6 @@ fn drain(&mut self) -> Result {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the framing is invalid, or the queue was already poisoned by an earlier such
     ///   failure. Either failure poisons the queue, so recovery requires a reset.
-    #[expect(dead_code)]
     fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
@@ -1366,4 +1380,55 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
             contents: (slice_1, slice_2),
         })
     }
+
+    /// Receive the next GMC event from the GSP and dispatch it through a handler.
+    ///
+    /// The handler receives the GMC command id and the raw payload slices that follow the
+    /// [`super::fw::GmcApiHeader`] (two slices because the circular buffer may wrap). It returns
+    /// `None` for an event it does not handle.
+    ///
+    /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this keys on the GMC command id,
+    /// which is the form the r000 firmware uses for boot events.
+    ///
+    /// Returns `Ok(None)` when nothing claimed the element, either because it is not a GMC
+    /// element or because the handler declined it. The read pointer is advanced on every path.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
+    /// - `EIO` if the queue is poisoned or the element fails framing validation (see
+    ///   [`Self::wait_for_gmc_msg`]).
+    fn receive_gmc_and_dispatch<R>(
+        &mut self,
+        timeout: Delta,
+        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+    ) -> Result<Option<R>> {
+        let message = self.wait_for_gmc_msg(timeout)?;
+        let header = message.header;
+        let length = header.length();
+
+        // The RPC and GMC elements share every field through `nvdm_header`, so `gmc` holds an
+        // RPC header rather than a GMC one unless the NVDM type says otherwise.
+        let result = if header.is_gmc_api() {
+            let command_id = header.gmc.command_id();
+
+            dev_dbg!(
+                &self.dev,
+                "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                header.gmc.sequence,
+                command_id,
+                length,
+            );
+
+            handler(command_id, message.contents.0, message.contents.1)
+        } else {
+            dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue element\n");
+            None
+        };
+
+        self.gsp_mem
+            .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
+
+        Ok(result)
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 9e6b5ec6aadb..83f7d2042aa1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -975,8 +975,19 @@ pub(crate) struct GmcApiHeader {
     reserved: [u32; 5],
 }
 
+/// Command identifier bits of [`GmcApiHeader::command`], matching Open RM's
+/// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
+const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
+
 static_assert!(size_of::<GmcApiHeader>() == 40);
 
+impl GmcApiHeader {
+    /// Returns the command identifier, without the flag byte.
+    pub(crate) fn command_id(&self) -> u32 {
+        self.command & GMCAPI_COMMAND_ID_MASK
+    }
+}
+
 // SAFETY: All fields are integer types with no uninitialized padding bytes.
 unsafe impl AsBytes for GmcApiHeader {}
 
@@ -1070,6 +1081,15 @@ pub(crate) fn has_valid_magic(&self) -> bool {
         self.mctp_magic == MCTP_MAGIC
     }
 
+    /// Returns `true` if the NVDM header routes this element to the GSP's GMC dispatch.
+    ///
+    /// A [`GspMsgElement`] and a [`GspGmcMsgElement`] share every field through `nvdm_header`,
+    /// so the NVDM type is what distinguishes the two on the queue, and `gmc` holds an RPC
+    /// header rather than a GMC one when this returns `false`.
+    pub(crate) fn is_gmc_api(&self) -> bool {
+        self.nvdm_header.validate(NvdmType::GmcApi)
+    }
+
     /// Returns the number of elements (i.e. memory pages) used by this message.
     pub(crate) fn element_count(&self) -> u32 {
         self.mctp_payload_size
-- 
2.55.0

