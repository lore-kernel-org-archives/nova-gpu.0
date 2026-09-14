Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D353B8949
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372298; cv=fail; b=JdVhlMX+ht/SfzYIdOqGFdCOk0b+PLNJfbGGDrMiFhrWQQgyWRbOGQyuG3gIu2r5i/IlqRaFk/YUGBU+2CVU3DcZDZ/f5TUeEoW/KNfhROKNktEpQMrw1E3qpwzkRIUfxkmv2oW5BSfPa8k3GHvz3sjVRJkge57mbXCDM0Zrems=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372298; c=relaxed/simple;
	bh=TkH1O1xSq/rC5I0bVc2oacU3s69Bi0DhwPxoF29PUOg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeNFpFarbQNHoiCSWzimBwxBIx78cKRzz7Z4xTPHEipNP6POTBpFL0RSkYEtc//jVexAW/IYj328nRaZ7IY9+500agQKCQ6LnBvg24VCvQ2sXR5Brx4VLY6WHTY7OGRJl/IiPF1AtCK9j74flwBMSWBD6wRwIcaA+0TzDIZRzMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H4TlyTJ7; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H4TlyTJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcjSNYoCxsnlcOoDnn7o44NDRq+XgHIGR3fgWRdJr30Oec6Ai6NeHgiwhIb06QXZhAsoOsAZzA4wM8JhhQNm1FRUKUS0/k5vdk+ciOK3+yC3H2aKNeyBGr6KgGgh77M0r26XSCpqZ7Djz7znSa0KbaFzsgoIzzirBVGXxbeBE1AswA/er9bLN0EXYwaatn8STu88Wjd9argo8IkaF8LLl035ETNDCxvkHtx+Yur42Y/Qe/3jF4o2MxUotXx8vasy/HWgFjXRaKX//xzACV2MkvwSmsNA+rlpunNmhVAlSyIAEKeD9rF0a10VWEFesWscxnkdC/QnalRDcVuQux5UJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+33W/L/YIi66jzMvjqmCl5v+1G1uvM/ZsatH3YuCn14=;
 b=WxS1npUTApmB9TAyAIYqMJslnnb8mh+/nZts380Q29fLYK/m/kQ3rjFdQwy+2XmQVIVIXRr7jSklXKpgi8r9YhSRcSTYkMivAgVupi7AAedH/lvZytBoeXf6/ZLNuKJFsZbwhHMDNOxCbYfb8U8+OyyZJ71cLY6QNKzmzMTMeQbLohklKdKb52Pv7+cLiQ783tNTudF+goAoe1QZKVx7NprT1utdJdlNNgwCIR19GHXW9M9juWnv3EYuKst5zBVJ8tysnvMLZtnsAYUuboyRdc35BtesUae3V8x8tnuV0J9ElbKA0cLR2kBftr75MBIrVF7sGph9VuVC0WQwP39qhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+33W/L/YIi66jzMvjqmCl5v+1G1uvM/ZsatH3YuCn14=;
 b=H4TlyTJ7dFZAMrInn48v4uX7z/tfxjA7EcsU3Hd56VrOjIW1GECwTLcGt0iIHusFxDQdasrpy1uN9sMByekH9zYE0Z0xFNUpAE+QTDQkDOn0zQDcadZ1dhXMauWVKbofs0gM0EqZnBgix20DSMRPKXWgfZRat8CaulxiouAYT7rKdwbKhuGht/kfEnap9zNFRpesPOPz7en/7u5azkmuvLGcczhS1MZyFu/0hz+6gaKBCIURomRQIVdph7SKLfxIYEIk+8RoBBge8z1kRFN4kIvbvVc2tkPGxguxbineYbz0YvpOzXBFBoaD0hADguPGyGAbu/Ni7KgzhRiODEbQLA==
Received: from BN9PR03CA0543.namprd03.prod.outlook.com (2603:10b6:408:138::8)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 07:51:29 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::30) by BN9PR03CA0543.outlook.office365.com
 (2603:10b6:408:138::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Mon, 14
 Sep 2026 07:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:28 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:10 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:09 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:02 -0700
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
Subject: [PATCH v2 13/32] gpu: nova-core: gsp: dispatch RM RPC messages during GMC receive
Date: Mon, 14 Sep 2026 10:48:48 +0300
Message-ID: <20260914074907.1399629-14-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9ff126-7090-4a33-df3f-08df1234fc40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|11063799006|5023799004|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UV70rOD3C0Ih2Uacd1JDodd+I8lBtyXPX9JBtayAmH4dXUmor3WWbyNYXV/IrPP4HyzvRUNGhNnIaQiPuKsv3Suy0DZ+G9HlBexO+TkerTbonZxX2YlL+LqOw4ItU2jN7cdOMqQINfGnYKr/RTetpVf5jKZMXLV8HcTHgJIP4gV1B+oyemMw9D5mU/njuF5IJJdI2Hp/0t2jm0MoxN4yrZ8/0DmItzX7uSgDLsIG5qhpMAPvIZKqZzdg01++jEjOB9LxwIRHKonw0YzttWQOVwHKk43iH7mW/elBOFJxynrfYgcN3Y0yIt+ysQu4kpE5ch4ApbBNQE8bf/yFi+WY8AMuyc1Fb8aRlgr5zNad0VibhgJyPworXCQFG+tL1bsxa7ArXckjyhlnOOMTWldb71Dy+YCde0bwJLB8lIsUtE6tJA/O+M9O2zF/HzlJRIJ3H4OTRPR4nSHxXD94bjY9r0V39LHV1YbMmyMSatVM3iQbCynxW9JJxkKQp8jZprecCbrRDiEyFkpshbIpcHZbV3Hr+kGajuftIKLaZQa64brJjenIb7bN9AI5S4V5vouGAsiWuT6tMUhoIdxVRfqCm+M9QUPsRbvp+iXO7gy3lbpjZBmDe5JjqqcwhGV3jUYn/h0WdE/K/yS9+XtTXa1gDJ8iGEBYVipO8oQHdnj6lgL3NiLGkjjk7ITaLEer8070x8aOH1aGN+jEKiHVEpRGPw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(5023799004)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q7cSolHICag/Be2nYGdU4Vqs/qMbhgeB+lP/TwHb5DFvc+DN5UZKO7IAuhwQaDjPEQRK1vjPcV2hhS9fCDkwNGiImAjRU7hMyamns93DCzA0EgpEQdHyvMIqFvCNkdLV5lLgPoZSi4+iZ94MpnGwZbwqnkmqokJ/NuEUiU9i1xx0BTwDW+9wG4/I2T6aTA/3vghLdPaI8Qt0IGp1bGHX4vJ91PG3MdmCYqAmr+lZInoiuitVcGomGr72n3MC1fJwe7HShPghyJBvukWyUHEFQcAvefju0w9wM7lAeVrJOeVjq83w9Y/8A/CwFk6EO7tbxJSoqmIPl7fbQm22GQBn3MQic7q6eSw2Wy6vud48iZVWg/aYsyzSTJdzt6kt4JTpli80VUdwDJ4UwzP4xpwW87O+Rl0itbbp5fZFoIiyWudtRj+iyCkePL7KZm1RhA5p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:28.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9ff126-7090-4a33-df3f-08df1234fc40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045

RM RPC notifications and GMC messages share the GSP-to-CPU queue.
GMC waits and the threaded queue drain need to recognize both formats
while preserving RM RPC notification handling.

Validate the common framing before selecting the message format, dispatch
interleaved RM RPC messages, and use the same receive path when draining
the queue.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 122 ++++++++++++++++----------
 drivers/gpu/nova-core/gsp/commands.rs |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs       |   9 ++
 3 files changed, 89 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 942f41b4d705..b7d8a467d2fe 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -602,8 +602,8 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         self.inner.lock().send_command(command).map(|_| ())
     }
 
-    /// Receives one GMC element from the GSP and passes its command id, the `max_resp_or_status`
-    /// field, and the raw payload slices to `handler`.
+    /// Receives one GMC element from the GSP and passes its header and raw payload slices to
+    /// `handler`.
     ///
     /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
     /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
@@ -900,6 +900,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             )));
         }
 
+        if !header.is_rm_rpc() {
+            return Err(self.poison(fmt!("invalid RM RPC NVDM type")));
+        }
+
         dev_dbg!(
             &self.dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
@@ -938,6 +942,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         })
     }
 
+    /// Consumes and dispatches the RM RPC element currently at the queue head.
+    fn consume_and_dispatch_rpc(&mut self) -> Result {
+        let (function, seq, length) = {
+            let message = self.wait_for_msg(Delta::ZERO)?;
+
+            (
+                message.header.function(),
+                message.header.sequence(),
+                message.header.length(),
+            )
+        };
+
+        let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?;
+        DmaGspMem::advance_cpu_read_ptr_v2(self.bar, pages);
+        self.log_event(function, seq);
+        Ok(())
+    }
+
     /// Receive a message from the GSP.
     ///
     /// The expected message type is specified using the `M` generic parameter. A message whose
@@ -1087,27 +1109,21 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
     /// Drains all messages currently pending in the GSP-to-CPU queue.
     ///
     /// Reads whatever the GSP has already posted and stops once the queue is empty. No caller is
-    /// waiting for a reply during a drain, so every message goes to [`Self::log_event`].
+    /// waiting for a reply during a drain, so RM RPC messages go to [`Self::log_event`] and GMC
+    /// messages are consumed without dispatch.
     ///
     /// # Errors
     ///
     /// Returns the receive error that stopped the drain, in particular the `EIO` of a queue
-    /// poisoned by corrupt framing (see [`Self::wait_for_msg`]).
+    /// poisoned by corrupt framing (see [`Self::receive_gmc_and_dispatch`]).
     fn drain(&mut self) -> Result {
         while !self.gsp_mem.driver_read_area_v2(self.bar).0.is_empty() {
-            // A message is available, so this returns without waiting.
-            let msg = self.wait_for_msg(Delta::ZERO)?;
-
-            let pages =
-                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
-                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
-                    EIO
-                })?;
-            let function = msg.header.function();
-            let seq = msg.header.sequence();
-
-            DmaGspMem::advance_cpu_read_ptr_v2(self.bar, pages);
-            self.log_event(function, seq);
+            match self.receive_gmc_and_dispatch::<()>(Delta::ZERO, |_, _, _| {
+                (None, QueuePointers::Unchanged)
+            }) {
+                Ok(_) | Err(ERANGE) => {}
+                Err(error) => return Err(error),
+            }
         }
 
         Ok(())
@@ -1145,7 +1161,14 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
             return Err(EIO);
         };
 
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
@@ -1182,29 +1205,34 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
         })
     }
 
-    /// Receive the next GMC event from the GSP and dispatch it through a handler.
+    /// Receive the next GMC element from the GSP and dispatch it through a handler.
     ///
-    /// The handler receives the GMC command id, the raw payload slices that follow the
-    /// [`super::fw::GmcApiHeader`] (two because the ring may wrap), and that header's
+    /// The handler receives the message header and the raw payload slices that follow the
+    /// [`super::fw::GmcApiHeader`] (two because the ring may wrap). The header contains the
     /// `max_resp_or_status` field, which only a handler that knows what it asked for can read.
     /// It returns `None` for an element it does not handle, paired with the [`QueuePointers`]
     /// state it left behind.
     ///
-    /// Returns `Ok(None)` when nothing claimed the element, either because it is not a GMC
-    /// element or because the handler declined it. Either way the element is consumed: the read
-    /// pointer moves past it, or is written back past it when the handler reset the GSP.
+    /// Returns `Ok(None)` when the handler declines a GMC element. A valid interleaved RM RPC
+    /// element is consumed and dispatched before this method returns `ERANGE`. The read
+    /// pointer moves past the element, or is written back past it when the handler reset the GSP.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the queue is poisoned or the element fails framing validation (see
     ///   [`Self::wait_for_gmc_msg`]).
+    /// - `ERANGE` if a valid interleaved RM RPC element was consumed and dispatched.
     fn receive_gmc_and_dispatch<R>(
         &mut self,
         timeout: Delta,
         handler: impl FnOnce(&GspGmcMsgElement, &[u8], &[u8]) -> (Option<R>, QueuePointers),
     ) -> Result<Option<R>> {
         let message = self.wait_for_gmc_msg(timeout)?;
+        if !message.header.is_gmc_api() {
+            self.consume_and_dispatch_rpc()?;
+            return Err(ERANGE);
+        }
         let header = message.header;
         let length = header.length();
 
@@ -1213,32 +1241,30 @@ fn receive_gmc_and_dispatch<R>(
         let cpu_write_ptr = DmaGspMem::cpu_write_ptr_v2(self.bar);
         let cpu_read_ptr = DmaGspMem::cpu_read_ptr_v2(self.bar);
 
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
+            } else {
+                let command_id = header.gmc.command_id();
 
-            dev_dbg!(
-                &self.dev,
-                "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
-                header.gmc.sequence,
-                command_id,
-                length,
-            );
+                dev_dbg!(
+                    &self.dev,
+                    "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                    header.gmc.sequence,
+                    command_id,
+                    length,
+                );
 
-            handler(header, message.contents.0, message.contents.1)
-        };
+                handler(header, message.contents.0, message.contents.1)
+            };
 
         let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c2faa825a849..7ca5ec2a58d9 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -209,7 +209,7 @@ pub(crate) fn gsp_init(
         cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_INIT, payload, GSP_INIT_MAX_RESPONSE_SIZE)?;
 
     loop {
-        let reply = cmdq.receive_gmc_and_dispatch(
+        let reply = match cmdq.receive_gmc_and_dispatch(
             Cmdq::RECEIVE_TIMEOUT,
             |header, payload_0, payload_1| {
                 if header.is_response_to(GMCAPI_CMD_GSP_INIT, sequence) {
@@ -231,7 +231,11 @@ pub(crate) fn gsp_init(
                     }
                 }
             },
-        )?;
+        ) {
+            Ok(reply) => reply,
+            Err(ERANGE) => continue,
+            Err(error) => return Err(error),
+        };
 
         if let Some(reply) = reply {
             return reply;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 309f9296ebc8..0fccf16f6a1c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -527,6 +527,11 @@ pub(crate) fn validate_framing(&self) -> Result {
         self.transport.validate(size_of::<Self>())
     }
 
+    /// Returns `true` if the NVDM header routes this element to the RM RPC dispatcher.
+    pub(super) fn is_rm_rpc(&self) -> bool {
+        self.transport.is_nvdm_type(NvdmType::RmRpc)
+    }
+
     // Returns the sequence number of the message.
     pub(crate) fn sequence(&self) -> u32 {
         self.rpc.sequence
@@ -811,6 +816,10 @@ pub(crate) fn validate_framing(&self) -> Result {
         self.transport.validate(size_of::<Self>())
     }
 
+    pub(super) fn validate_common_framing(&self) -> Result {
+        self.transport.validate(size_of::<QueueElementHeader>())
+    }
+
     /// Returns `true` if the NVDM type says a GMC header follows the transport header.
     ///
     /// When it returns `false`, `gmc` holds whatever header the other element kind puts there.
