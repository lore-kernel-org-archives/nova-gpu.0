Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762D0443E54
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595972; cv=fail; b=gvF6lAq54TfdeNTEAASfDov1Ba9Qq2Ld6j1/XORtDRNWjhxbMIxAWt+eA+/xdb209vHMPZJaCHajJ14e2MvIza5hGHthKcXfjN7Vwm2ur96g9uQ/8U3IJ17F9zbOkpYsqeDqREwz9rIDWCvivLWg7EoiRmz1UlAsCq6jQCNFKuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595972; c=relaxed/simple;
	bh=rmUgnf7uaNybBsS6sV87chUURAKHQSxn8xidFWy/jRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2sKYWHSVFzX09t7yPTqQ0kUeDSdq0dY9BZvAM5pPZSOb/H783mXLVLJ1YwexQRLt8vqhfZIHGtftbFDkXSL9EoX8X0r51UXlECdWfZkWReFS5vZsa91lo48lQoK+y9kjQo4dERGO+iVULheNZJvyFvt2yssXSUxt90Ty0P0pHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RJZQ2/S/; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RJZQ2/S/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9SyZvHDRjeBUtFJ/INWf1hlm3xNXuGWAYHwuLQVijD1QEMzI17+iadnGEUZt5SDyb1Ium9jjFwcH2XLI4GTc58eH1B23lr5vfqKPGRQK3Y7z+dhM4LMTK9/lYsdFVoZsXDvPWkU24vJDRpGlyvAUhW/Ul7sNAQ1uUqzoH0sXZDt4U86YwlKYSsv08xNd6D2KLK9MTxAPLxtwXI9O2oubCZNxIMsXY1WVu019mgOO6VTHrL0Q+Xu4yPj0Bon9NXffzz//wwUyqEyqHHyqyg9utFP8TKRehGMkvtCsxDF+B5VohFZ5CixldJVylIulYX9zz+X4zNYxBhl9Ye8uip4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLjCfmbbDUKa8FfliU2fu1lYmTZwrwMZwr2dc63Sm/o=;
 b=HDnm5cxVn0CCQR1XwVagaB97M7ssqelVgE1myor+hOuGhBH8IZc0a2NHJ8vFBSQCB0IOSnuYwLjbjl2A+XAJoY6vHC9dwmynFlEazAk+eP2V42v2gEFKZgVBbzdLwo4jkUL5Lus2+7O+23qlLjHZ49MifX5mdLRPRMvY7DPm8uUBY11yIpLPkTMIh0M+n60jAF8o6Yo3uuB0w+2JHj9eov5XfAHnRnhv4mbwN0RyiWRBXj2dxANHT2evP4++ZZH/fggJ6HE89eDiKiLCMLyH6ny2Pa6C7gBEJPEhTpsyhqfaRVZfshu1dFdd+4RL5RoOiSblBBBiuAWLertUTvGx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLjCfmbbDUKa8FfliU2fu1lYmTZwrwMZwr2dc63Sm/o=;
 b=RJZQ2/S/pxrYNH6oU2byBpOBUFBwylyyd163UGdsUZ6BXIzeM8RxnBeJDAh150g20eugANHsVvdiqNEiQkaZ5nHXCHYEdHXNGJ6nFow8qMHwJM/j9mH5xwj/rXcsaZEIG3HumpW44WrHhxNxuiwuGth/uk5Z7hUVDxrASWMlMIEwrRh0De+XshsvYzdYZHMI1dZpbUEc6l7u4U4WN8sD0UzL4KDiuo7YUicNoxli6okkvrDPbgJbUS4uU9YTRGAKVW490akbRSwfvERJbNaSXqBsBiz4nee+g4OeWkj73nj2nsZhooh7UMA/WGW+GEMOQf1phna6fmJ30ikgAF/4uA==
Received: from BN9PR03CA0123.namprd03.prod.outlook.com (2603:10b6:408:fe::8)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Sat, 5 Sep
 2026 08:12:32 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::5c) by BN9PR03CA0123.outlook.office365.com
 (2603:10b6:408:fe::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:12:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:12:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:20 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:12:19 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:12:11 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 06/13] gpu: nova-core: gsp: add GMC transaction helpers
Date: Sat, 5 Sep 2026 11:11:09 +0300
Message-ID: <20260905081116.106613-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905081116.106613-1-zhiw@nvidia.com>
References: <20260905081116.106613-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 46afd7f7-b2fc-4443-497c-08df0b256f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|30052699003|82310400026|7416014|1800799024|18002099003|10067099003|6133799003|11063799006|5023799004|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	pfud8QCho7vR4htD/NPJcjZC1tY+XdCNS/pc+Oirg6gJwr3toq/tSyJHPMYBeexo75sPhVgf6W8b3+r4lkps2z+aLAsjGK6Kxm8SmUuvUyU4ltaylyuz95qQJr2jRcU+ocre0QOm9kDhpBO0FUSo9jhSf4tHjeTzixzDJsFX4FxxcTfY3IMxaegGYRhgubFSdORydiAbDsRsLgJUhcxRsij5nEWGAa+SF+kwOn7skpk+cK3X+P4qFtEQzSmY3oCyrzkb+b8gDx1qckeubZ6QAxTc/meGfdurO8ZUZUOyCHSBx7WWY/6o/odBNEV7I7uGG5ts7zwCXw2cv0rYkXQTbGCD+8ZMwfkfGMDEw+EipWoDJdsSY3etnEAYuRMfYhe7tkZe4JCru1OzD8g0+YKnG3/DkX5RwjAFd/e0nzDqZIcGhBRv3+EdMKiosVcSiMcPew0z3a5Bvk8tng3WnSL5w7FQptstFcI3/fTKmA25F1jQXIOaoHYm84CLp3J90hOlDOWelyhYic8y0JkImm+NB5TP7f5h72Tg/tUrk+e+Q1YKz7p643Q60Lpp4RmCRVX9CfCdsb1dLY3BN5aejScoV5CN1aEq8rOJXmlfvj9CZUUGCCECvYR02bLpPJ7jWGmviiJuzBazbwSDdPzuzMdyK3h5Ji+bGFfd93RJZT5yrUrVOwXUiX6VH0Nmrdi7ad03baajjP92yB8MF62EJrkojQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(30052699003)(82310400026)(7416014)(1800799024)(18002099003)(10067099003)(6133799003)(11063799006)(5023799004)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xj8oO3kLFoee3AxjLzNfQslx6asPDgoPAkqxL+cQfPG6yWtyfkxhWq+pYtJbyV/ajprEjGbRjQd2xkeo19n55UqyoJmw7zJQovArVwch0TL3R+K5Dq6CkOyD1Lkj7MVYB/4NfjmPwuNM5GhwUwPpXppPtBUJ8jbNuNRJm497CB1u6cXi8wiMM7DO+lpq9V31wg2WUcw2xG40VzEhWLpY7sHM5+NYb+5IXQU1MQFyroDbVMO0XoH5ehEdwoxA0uUsJgBQZ2VyUTB83CrkQEikPUsO1wQzH59F0rGesSGc/Itnp7RWil8nY27CcnieCKPzGFyTo+BDQuF9T9QGC3dHoBJ/Dpw8c8REpUElRWHEOiIUXwrQ451NHNamPhCSsaU9mOmQLSGunzW5UC1Jdohz0tDMnH/YB/ROiTNOAxhs1OGHUHhCXOxSRg3uN2u4vHHN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:12:32.0405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46afd7f7-b2fc-4443-497c-08df0b256f7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

Match GMC replies to requests by both the masked command identifier and
sequence number instead of accepting the next GMC message as the reply.
Use one deadline while stale responses and interleaved messages are
consumed.

Pass the GMC sequence through event dispatch, and add helpers for
status-only replies and commands completed by asynchronous events.

A GMC transaction holds the shared command queue lock while waiting.
Consume and dispatch a valid interleaved RM RPC frame instead of treating
it as malformed GMC framing, then continue waiting for the GMC message.

The GSP-to-CPU queue carries both RM RPC and GMC messages. The threaded
drain predates GMC support and parses every pending entry as RM RPC.
Consequently, an asynchronous GMC message fails RPC framing validation,
poisons the queue, and leaves the CPU read pointer stuck on that entry.

Use the common classifier for both wire formats. It consumes and
dispatches valid RM RPC messages while returning GMC messages to the
caller. Advance the read pointer for returned GMC messages so the drain
can continue.

The drain holds the command queue lock, so no synchronous GMC transaction
can be waiting for a returned message at the same time. Such a message is
therefore unsolicited or stale and can be consumed without dispatch.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 311 ++++++++++++++++++--------
 drivers/gpu/nova-core/gsp/commands.rs |  30 ++-
 drivers/gpu/nova-core/gsp/fw.rs       |  22 ++
 3 files changed, 265 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e472ec94691d..8f204f71a36a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -52,6 +52,7 @@
     driver::Bar0,
     gsp::{
         fw::{
+            GmcApiHeader,
             GmcCommand,
             GspGmcMsgElement,
             GspMsgElement,
@@ -648,8 +649,8 @@ fn receive_msg<M: MessageFromGsp>(&self, bar: Bar0<'_>, timeout: Delta) -> Resul
         self.inner.lock().receive_msg(bar, timeout, None)
     }
 
-    /// Receives one GMC element from the GSP and passes its command id, the `max_resp_or_status`
-    /// field, and the raw payload slices to `handler`.
+    /// Receives one GMC element from the GSP and passes its header and raw payload slices to
+    /// `handler`.
     ///
     /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
     /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
@@ -659,7 +660,7 @@ pub(crate) fn receive_gmc_and_dispatch<R>(
         &self,
         bar: Bar0<'_>,
         timeout: Delta,
-        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> (Option<R>, QueuePointers),
+        handler: impl FnOnce(&GmcApiHeader, &[u8], &[u8]) -> (Option<R>, QueuePointers),
     ) -> Result<Option<R>> {
         self.inner
             .lock()
@@ -686,9 +687,10 @@ pub(crate) fn send_gmc_no_wait(
         self.inner
             .lock()
             .send_gmc(bar, command_id, payload, max_response_size)
+            .map(|_| ())
     }
 
-    /// Sends a GMC API command and waits for its response.
+    /// Sends a GMC API command and waits for its matching response.
     ///
     /// The queue stays locked for the complete transaction. A single deadline bounds all queue
     /// elements observed while waiting.
@@ -698,26 +700,59 @@ pub(crate) fn send_gmc_and_receive(
         command_id: u32,
         payload: &[u8],
         max_response_size: u32,
+    ) -> Result<GmcResponse> {
+        self.send_gmc_and_receive_timeout(
+            bar,
+            command_id,
+            payload,
+            max_response_size,
+            Self::RECEIVE_TIMEOUT,
+        )
+    }
+
+    /// Sends a GMC API command and waits up to `timeout` for its matching response.
+    pub(crate) fn send_gmc_and_receive_timeout(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+        timeout: Delta,
     ) -> Result<GmcResponse> {
         let mut inner = self.inner.lock();
-        inner.send_gmc(bar, command_id, payload, max_response_size)?;
+        let expected_sequence = inner.send_gmc(bar, command_id, payload, max_response_size)?;
+        let dev = inner.dev.clone();
 
-        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
+        let deadline = Instant::<Monotonic>::now() + timeout;
         loop {
             let remaining = deadline - Instant::<Monotonic>::now();
             if remaining.is_negative() {
                 return Err(ETIMEDOUT);
             }
 
-            let response = inner.receive_gmc_and_dispatch(
+            let response = match inner.receive_gmc_and_dispatch(
                 bar,
                 remaining,
-                |received_command, status, payload_0, payload_1| {
-                    if received_command != command_id {
+                |header, payload_0, payload_1| {
+                    if !header.is_response_to(command_id, expected_sequence) {
+                        let kind = if header.is_response() {
+                            "response"
+                        } else {
+                            "event"
+                        };
+                        dev_dbg!(
+                            &dev,
+                            "GSP GMC: skip {} seq {} cmd {:#x}; want response seq {} cmd {:#x}\n",
+                            kind,
+                            header.sequence_number(),
+                            header.command_id(),
+                            expected_sequence,
+                            command_id,
+                        );
                         return (None, QueuePointers::Unchanged);
                     }
 
-                    let response = (|| {
+                    let response: Result<GmcResponse> = (|| {
                         let mut payload = KVec::with_capacity(
                             payload_0
                                 .len()
@@ -728,14 +763,18 @@ pub(crate) fn send_gmc_and_receive(
                         payload.extend_from_slice(payload_0, GFP_KERNEL)?;
                         payload.extend_from_slice(payload_1, GFP_KERNEL)?;
                         Ok(GmcResponse {
-                            status,
+                            status: header.max_resp_or_status,
                             payload,
                         })
                     })();
 
                     (Some(response), QueuePointers::Unchanged)
                 },
-            )?;
+            ) {
+                Ok(response) => response,
+                Err(ERANGE) => continue,
+                Err(error) => return Err(error),
+            };
 
             if let Some(response) = response {
                 return response;
@@ -743,6 +782,81 @@ pub(crate) fn send_gmc_and_receive(
         }
     }
 
+    /// Sends a synchronous GMC command and checks its status-only reply.
+    pub(crate) fn send_gmc_and_check_status(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+    ) -> Result {
+        let response = self.send_gmc_and_receive(bar, command_id, payload, 0)?;
+        if response.status == 0 {
+            Ok(())
+        } else {
+            Err(EIO)
+        }
+    }
+
+    /// Sends an asynchronous GMC command and waits atomically for its event.
+    ///
+    /// The command queue remains locked from the send through the matching
+    /// event, preventing another transaction from consuming its completion.
+    /// Interleaved GMC events are passed to `handler`; responses are consumed
+    /// while waiting. The timeout is shared by the complete operation.
+    pub(crate) fn send_gmc_and_wait_event(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        timeout: Delta,
+        mut predicate: impl FnMut(u32, u32, u64, &[u8], &[u8]) -> Result<bool>,
+        mut handler: impl FnMut(u32, u32, u64, &[u8], &[u8]) -> Result,
+    ) -> Result {
+        let mut inner = self.inner.lock();
+        inner.send_gmc(bar, command_id, payload, 0)?;
+        let deadline = Instant::<Monotonic>::now() + timeout;
+
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                return Err(ETIMEDOUT);
+            }
+
+            let matched = match inner.receive_gmc_and_dispatch(
+                bar,
+                remaining,
+                |header, payload_0, payload_1| {
+                    let result: Result<bool> = (|| {
+                        if header.is_response() {
+                            return Ok(false);
+                        }
+
+                        let command = header.command_id();
+                        let status = header.max_resp_or_status;
+                        let sequence = header.sequence_number();
+                        if predicate(command, status, sequence, payload_0, payload_1)? {
+                            return Ok(true);
+                        }
+
+                        handler(command, status, sequence, payload_0, payload_1)?;
+                        Ok(false)
+                    })();
+                    (Some(result), QueuePointers::Unchanged)
+                },
+            ) {
+                Ok(matched) => matched,
+                Err(ERANGE) => continue,
+                Err(error) => return Err(error),
+            };
+
+            if let Some(matched) = matched {
+                if matched? {
+                    return Ok(());
+                }
+            }
+        }
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
@@ -772,8 +886,8 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self, bar: Bar0<'_>) -> Result<M>
 
     /// Drains and dispatches every message currently pending in the GSP-to-CPU queue.
     ///
-    /// Routes each message the GSP has already posted through [`CmdqInner::dispatch_event`] and
-    /// returns without waiting for more.
+    /// Dispatches pending RM RPC messages as events, consumes pending GMC messages, and returns
+    /// without waiting for more.
     ///
     /// # Errors
     ///
@@ -936,9 +1050,10 @@ fn send_gmc(
         command_id: u32,
         payload: &[u8],
         max_response_size: u32,
-    ) -> Result {
+    ) -> Result<u64> {
         let rpc_seq = self.rpc_seq;
         self.rpc_seq = self.rpc_seq.wrapping_add(1);
+        let sequence = u64::from(rpc_seq);
 
         let dst = self.gsp_mem.allocate_command::<GspGmcMsgElement>(
             bar,
@@ -946,12 +1061,8 @@ fn send_gmc(
             Self::ALLOCATE_TIMEOUT,
         )?;
 
-        let msg_element = GspGmcMsgElement::init(
-            command_id,
-            u64::from(rpc_seq),
-            payload.len(),
-            max_response_size,
-        );
+        let msg_element =
+            GspGmcMsgElement::init(command_id, sequence, payload.len(), max_response_size);
         // SAFETY: `dst.header` points to a valid, writable `GspGmcMsgElement` region.
         unsafe {
             msg_element.__init(core::ptr::from_mut(dst.header))?;
@@ -963,7 +1074,7 @@ fn send_gmc(
         dev_dbg!(
             &self.dev,
             "GSP GMC: send: seq# {}, command={}, length=0x{:x}\n",
-            rpc_seq,
+            sequence,
             GmcCommand(command_id),
             dst.header.length(),
         );
@@ -971,7 +1082,7 @@ fn send_gmc(
         let elem_count = dst.header.element_count();
         DmaGspMem::advance_cpu_write_ptr_v2(bar, elem_count);
 
-        Ok(())
+        Ok(sequence)
     }
 
     /// Wait for a message to become available on the message queue.
@@ -1022,6 +1133,12 @@ fn wait_for_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GspMessage<'_>>
             return Err(e);
         }
 
+        if !header.is_rm_rpc() {
+            dev_err!(&self.dev, "GSP RPC: receive: invalid NVDM type\n");
+            self.poisoned.set(true);
+            return Err(EIO);
+        }
+
         let payload_length = header.payload_length();
 
         // Check that the driver read area is large enough for the message.
@@ -1084,6 +1201,26 @@ fn advance_rx_event_seq(&mut self, function: Result<MsgFunction, u32>) {
         }
     }
 
+    /// Consumes and dispatches the RM RPC element currently at the queue head.
+    fn consume_and_dispatch_rpc(&mut self, bar: Bar0<'_>) -> Result {
+        let (function, seq, length) = {
+            let message = self.wait_for_msg(bar, Delta::ZERO)?;
+
+            (
+                message.header.function(),
+                message.header.sequence(),
+                message.header.length(),
+            )
+        };
+
+        self.log_received(function, seq, length);
+        let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?;
+        DmaGspMem::advance_cpu_read_ptr_v2(bar, pages);
+        self.advance_rx_event_seq(function);
+        self.dispatch_event(function, seq);
+        Ok(())
+    }
+
     /// Receive a message from the GSP.
     ///
     /// The expected message type is given by the `M` generic parameter. With `expected_seq` set,
@@ -1203,32 +1340,22 @@ fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
 
     /// Drains and dispatches all messages currently pending in the GSP-to-CPU queue.
     ///
-    /// Processes whatever the GSP has already posted, dispatching each message as an event, and
-    /// stops once the queue is empty. There is no awaited reply during a drain, so every message
-    /// is routed to [`Self::dispatch_event`].
+    /// RM RPC messages are dispatched as events. GMC messages are unsolicited while the drain owns
+    /// the command queue lock, so they are consumed without dispatch.
     ///
     /// # Errors
     ///
     /// Returns the receive error that stopped the drain, in particular the `EIO` of a queue
-    /// poisoned by corrupt framing (see [`Self::wait_for_msg`]).
+    /// poisoned by framing that is invalid for both GMC and RM RPC (see
+    /// [`Self::receive_gmc_and_dispatch`]).
     fn drain(&mut self, bar: Bar0<'_>) -> Result {
         while !self.gsp_mem.driver_read_area_v2(bar).0.is_empty() {
-            // A message is available, so this returns without waiting.
-            let msg = self.wait_for_msg(bar, Delta::ZERO)?;
-            let function = msg.header.function();
-            let seq = msg.header.sequence();
-            let length = msg.header.length();
-
-            self.log_received(function, seq, length);
-
-            let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
-                dev_err!(&self.dev, "GSP drain: message length overflow\n");
-                EIO
-            })?;
-
-            DmaGspMem::advance_cpu_read_ptr_v2(bar, pages);
-            self.advance_rx_event_seq(function);
-            self.dispatch_event(function, seq);
+            match self.receive_gmc_and_dispatch::<()>(bar, Delta::ZERO, |_, _, _| {
+                (None, QueuePointers::Unchanged)
+            }) {
+                Ok(_) | Err(ERANGE) => {}
+                Err(error) => return Err(error),
+            }
         }
 
         Ok(())
@@ -1269,7 +1396,14 @@ fn wait_for_gmc_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GmcMessage<'
         };
 
         // Checked before any length field is read, since bad framing leaves them untrusted.
-        if let Err(e) = header.validate_framing() {
+        let framing = header.validate_common_framing().and_then(|()| {
+            if header.is_gmc_api() {
+                header.validate_framing()
+            } else {
+                Ok(())
+            }
+        });
+        if let Err(e) = framing {
             dev_err!(
                 &self.dev,
                 "GSP GMC: receive: bad MCTP framing, declared length {}\n",
@@ -1306,12 +1440,11 @@ fn wait_for_gmc_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GmcMessage<'
         })
     }
 
-    /// Receive the next GMC event from the GSP and dispatch it through a handler.
+    /// Receive the next GMC element from the GSP and dispatch it through a handler.
     ///
-    /// The handler receives the GMC command id, the header's `max_resp_or_status` field, and the
-    /// raw payload slices that follow the [`super::fw::GmcApiHeader`] (two slices because the
-    /// circular buffer may wrap). It returns `None` for an element it does not handle, paired
-    /// with the [`QueuePointers`] state it left behind.
+    /// The handler receives the GMC header and the raw payload slices that follow it (two slices
+    /// because the circular buffer may wrap). It returns `None` for an element it does not handle,
+    /// paired with the [`QueuePointers`] state it left behind.
     ///
     /// `max_resp_or_status` is a union: GSP-RM writes an `NV_STATUS` there when the element is a
     /// response, and the maximum response size when it is a request. Only a handler that knows
@@ -1320,23 +1453,29 @@ fn wait_for_gmc_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GmcMessage<'
     /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this keys on the GMC command id,
     /// which is the form the r000 firmware uses for boot events.
     ///
-    /// Returns `Ok(None)` when nothing claimed the element, either because it is not a GMC
-    /// element or because the handler declined it. The read pointer is advanced past the element
-    /// on every path except a handler reporting [`QueuePointers::Reset`], which has already
-    /// returned both pointers to zero.
+    /// Returns `Ok(None)` when the handler declines a GMC element. A valid interleaved RM RPC
+    /// element is consumed and dispatched before this method returns `ERANGE`. The read pointer is
+    /// advanced past the element on every path except a handler reporting [`QueuePointers::Reset`],
+    /// which has already returned both pointers to zero.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the queue is poisoned or the element fails framing validation (see
     ///   [`Self::wait_for_gmc_msg`]).
+    /// - `ERANGE` if a valid interleaved RM RPC element was consumed and dispatched.
     fn receive_gmc_and_dispatch<R>(
         &mut self,
         bar: Bar0<'_>,
         timeout: Delta,
-        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> (Option<R>, QueuePointers),
+        handler: impl FnOnce(&GmcApiHeader, &[u8], &[u8]) -> (Option<R>, QueuePointers),
     ) -> Result<Option<R>> {
         let message = self.wait_for_gmc_msg(bar, timeout)?;
+        if !message.header.is_gmc_api() {
+            self.consume_and_dispatch_rpc(bar)?;
+            return Err(ERANGE);
+        }
+
         let header = message.header;
         let length = header.length();
 
@@ -1345,45 +1484,37 @@ fn receive_gmc_and_dispatch<R>(
         let cpu_write_ptr = DmaGspMem::cpu_write_ptr_v2(bar);
         let cpu_read_ptr = DmaGspMem::cpu_read_ptr_v2(bar);
 
-        // The RPC and GMC elements share every field through `nvdm_header`, so `gmc` holds an
-        // RPC header rather than a GMC one unless the NVDM type says otherwise.
-        let (result, queue_pointers) = if !header.is_gmc_api() {
-            dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue element\n");
-            (None, QueuePointers::Unchanged)
-        } else if num::u32_as_usize(header.gmc.size) != header.payload_length() {
-            // GSP-RM sends the element as the GMC header plus `size` bytes, so the two lengths
-            // describe the same payload and a handler cannot tell which one to believe.
-            dev_err!(
-                &self.dev,
-                "GSP GMC: payload is {} bytes, transport declares {}\n",
-                header.gmc.size,
-                header.payload_length(),
-            );
-            (None, QueuePointers::Unchanged)
-        } else {
-            let command_id = header.gmc.command_id();
-            let kind = if header.gmc.is_response() {
-                "response"
+        let (result, queue_pointers) =
+            if num::u32_as_usize(header.gmc.size) != header.payload_length() {
+                // GSP-RM sends the element as the GMC header plus `size` bytes, so the two lengths
+                // describe the same payload and a handler cannot tell which one to believe.
+                dev_err!(
+                    &self.dev,
+                    "GSP GMC: payload is {} bytes, transport declares {}\n",
+                    header.gmc.size,
+                    header.payload_length(),
+                );
+                (None, QueuePointers::Unchanged)
             } else {
-                "event"
-            };
+                let command_id = header.gmc.command_id();
+                let sequence = header.gmc.sequence_number();
+                let kind = if header.gmc.is_response() {
+                    "response"
+                } else {
+                    "event"
+                };
 
-            dev_dbg!(
-                &self.dev,
-                "GSP GMC: {}: seq# {}, command={}, length=0x{:x}\n",
-                kind,
-                header.gmc.sequence_number(),
-                GmcCommand(command_id),
-                length,
-            );
+                dev_dbg!(
+                    &self.dev,
+                    "GSP GMC: {}: seq# {}, command={}, length=0x{:x}\n",
+                    kind,
+                    sequence,
+                    GmcCommand(command_id),
+                    length,
+                );
 
-            handler(
-                command_id,
-                header.gmc.max_resp_or_status,
-                message.contents.0,
-                message.contents.1,
-            )
-        };
+                handler(&header.gmc, message.contents.0, message.contents.1)
+            };
 
         let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 417df31988c2..bdb358a19738 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -13,6 +13,10 @@
     device,
     pci,
     prelude::*,
+    time::{
+        Instant,
+        Monotonic, //
+    },
     transmute::AsBytes, //
 };
 
@@ -219,20 +223,27 @@ pub(crate) fn gsp_init(
         GSP_INIT_MAX_RESPONSE_SIZE,
     )?;
 
+    let deadline = Instant::<Monotonic>::now() + Cmdq::RECEIVE_TIMEOUT;
     loop {
-        let reply = cmdq.receive_gmc_and_dispatch(
-            bar,
-            Cmdq::RECEIVE_TIMEOUT,
-            |command_id, max_resp_or_status, payload_0, payload_1| {
-                if command_id == GMCAPI_CMD_GSP_INIT {
+        let remaining = deadline - Instant::<Monotonic>::now();
+        if remaining.is_negative() {
+            return Err(ETIMEDOUT);
+        }
+
+        let reply =
+            match cmdq.receive_gmc_and_dispatch(bar, remaining, |header, payload_0, payload_1| {
+                let command_id = header.command_id();
+                if header.is_response() && command_id == GMCAPI_CMD_GSP_INIT {
                     (
                         Some(decode_gsp_init_reply(
-                            max_resp_or_status,
+                            header.max_resp_or_status,
                             payload_0,
                             payload_1,
                         )),
                         QueuePointers::Unchanged,
                     )
+                } else if header.is_response() {
+                    (None, QueuePointers::Unchanged)
                 } else {
                     // A boot event. Keep waiting for the reply unless handling it failed.
                     match on_boot_event(command_id, payload_0) {
@@ -242,8 +253,11 @@ pub(crate) fn gsp_init(
                         Err(e) => (Some(Err(e)), QueuePointers::Reset),
                     }
                 }
-            },
-        )?;
+            }) {
+                Ok(reply) => reply,
+                Err(ERANGE) => continue,
+                Err(error) => return Err(error),
+            };
 
         if let Some(reply) = reply {
             return reply;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f8f7f85d2df0..f8c6fc5ea8a7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -596,6 +596,11 @@ pub(crate) fn validate_framing(&self) -> Result {
         )
     }
 
+    /// Returns `true` if the NVDM header routes this element to the RM RPC dispatcher.
+    pub(crate) fn is_rm_rpc(&self) -> bool {
+        self.nvdm_header.validate(NvdmType::RmRpc)
+    }
+
     // Returns the sequence number of the message.
     pub(crate) fn sequence(&self) -> u32 {
         self.rpc.sequence
@@ -735,6 +740,13 @@ pub(crate) fn is_response(&self) -> bool {
         self.command & GMCAPI_COMMAND_FLAGS_RESPONSE != 0
     }
 
+    /// Returns `true` if this header is the response to `command_id` and `sequence`.
+    pub(crate) fn is_response_to(&self, command_id: u32, sequence: u64) -> bool {
+        self.is_response()
+            && self.command_id() == (command_id & GMCAPI_COMMAND_ID_MASK)
+            && self.sequence == sequence
+    }
+
     /// Returns [`Self::sequence`] with the GSP-initiated-event bit cleared.
     pub(crate) fn sequence_number(&self) -> u64 {
         self.sequence & !GMC_EVENT_SEQUENCE_BASE
@@ -911,6 +923,16 @@ pub(crate) fn validate_framing(&self) -> Result {
         )
     }
 
+    pub(crate) fn validate_common_framing(&self) -> Result {
+        validate_mctp_framing(
+            self.mctp_magic,
+            self.mctp_payload_size,
+            self.mctp_header,
+            self.nvdm_header,
+            core::mem::offset_of!(Self, gmc),
+        )
+    }
+
     /// Returns `true` if the NVDM header routes this element to the GSP's GMC dispatch.
     ///
     /// A [`GspMsgElement`] and a [`GspGmcMsgElement`] share every field through `nvdm_header`,
-- 
2.53.0

