Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7D3EB11C
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372308; cv=fail; b=r9AZjRruZgXFGbCY6M9+9OFFa1I65RSlEUW0w8C5DWxuOGnkgRHdeD56jlgtAeyeD9GTeILDnlXmW4PKalj2oFuwRYffeC7ieJLERqyPBrqQ0WMSakmdd9LUy+1qCR1zjdDjAqPdRxZItGL7udkl6A06B6IFHQRIktMmJfka3D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372308; c=relaxed/simple;
	bh=T8HMaccVWvzfu7FziJTjaf9RL4q7pNTOlAvTXdbOV9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LX0XVWzppgiwO0jll7bD5rd68ftmG1Vc7WNX8Zr7B1oxFQooJ5kIonR2mTMDxgRnnxNRji6RoUR4DWOB+Qcmm5v1rXJEhWqt2G+Ci3PR1ddw69xi3QL2Fkbpu+hYe+KQ9VdvEsH74FVyQVmYtwuKVPnTYMSIjT8JB15jZ4VKgiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HE1G+NSj; arc=fail smtp.client-ip=52.101.85.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HE1G+NSj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZvsrutLC7d2yyR6SGh8svDVhpRq9r/CTPBlFu2u93SMMWP2Wmj+G10ZVXsvSjIBPpX8AO4wEr5vqOM6KgsogxlVPir9I03IoamjEvQ3+GaB8tZ1SOtLxCHLTyHHfAJwAewuPxLQsjyCUT4grotvP06YTTHdDyaePCToV87sD8CkmLBp999ZqTYK8aTFpSptcxRQKrkffoau4eor0Dv/JvdpY8/RyU/HQtM7YdYHqrn3Zcd5V11hKEHH7zI6yvobWUOFZVm2A6I19LXFOSMAiAlM3oqNGyO1O2rx1tcCsOLb9W+lad2FcPY/oESAoPkq+rTwMWOAG6SdxOtdSIko2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ffF4DUt18UWdgbl/Wqpdc3jOO9AczlWBxrVjN7LxAc=;
 b=bthOt1IY0XzLxM5o8CEtl2LMu5lKJZ3x6b4nld5EUBkChu+lI5yH7xIVywGeNPKaRJiY1c9QODKxmAcEd9csb76prFsmzR655UfcF5GxAbTXBuXIEdOUau7RnaeCod/Zyf3BPnVIOeiq02tV61Jsxsx6iH0tUGzWuvadLi7nJM9F+52qQziLII9s6JjUtH6XSfPzV1+EA/8zwtIB/JwEmkhIQJsrJAtke5yv2Pgn84fOcMAgV5UyNVqUvPWszVDKUy4UWhJnJzKQU3/o8SC7mRNSVvFF8wAaF22ouFT2lTIhg/9TB6SzO8lBlJfBW94TiayeTPrhPsMrOzxsTAlVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ffF4DUt18UWdgbl/Wqpdc3jOO9AczlWBxrVjN7LxAc=;
 b=HE1G+NSjf+j6WNXcvcbsffzdBeXr9JoPia+q0sPhRJrwqkfTqpxJ78zkYEWuWWJq2spd5gxdkc9jnNbwJ9EaLsxu3sboxqGf7oOtgbh6FhGqmpXQN5vZ7Ze3qlnfCyiFxKPWskJPtefiRZpL110fxV9moPGO2SCSOxbonqJXKEfzsP6jqViSd545C6EkkBmNdouJ7o/vQiIi5OQ+Jszn0f8RHtoXPR4Vef25HBmi4yvRnfZ5liao7WDJPCTwBfeuvR/SSbnuuLvVhO9QxbWtRj2ljj79ULz3PHO+FYnx80i5Zlk30McOvEJ3MUBH+nFa0eUX3KGYXGIN6SOsCJ18dg==
Received: from YT4PR01CA0407.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:108::21)
 by SA3PR12MB196577.namprd12.prod.outlook.com (2603:10b6:806:533::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:51:41 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:b01:108:cafe::97) by YT4PR01CA0407.outlook.office365.com
 (2603:10b6:b01:108::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:18 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:17 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:10 -0700
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
Subject: [PATCH v2 14/32] gpu: nova-core: gsp: add synchronous GMC transactions
Date: Mon, 14 Sep 2026 10:48:49 +0300
Message-ID: <20260914074907.1399629-15-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|SA3PR12MB196577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbced1a-8138-4426-4f08-08df12350324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|30052699003|7416014|376014|10067099003|3023799007|22082099003|18002099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	WYmjBZn03207IB0FcY3gS5KuVpBMtkkFHxeDouUGw00iakBJJcNk9vCurx74ZKc18qztfJT+c1XcH3FlJCB9ivpEAGQbo7PZp6hbsCIWP0CKQZLB2XXqtCqw/UcwO2M2YKNpbNS7eWNFqAbYKoSW49+0TwQVwVQ6hRWbOevPPjZG2u2NVqfCAdf3kbbweocMkrDWyVLtfE6L09yEgL90+1tLrw7laHz09G+oPFBgz+GGtgcYbS9xBZr7wJ7QIephvmqiImdLJ962K9yMnzzz352d820WpJDNxl6kpqxjyGtxvPhVbZk8NEkhKjZoIQt7R+NwquIfVotmxTAkAqZyQONPl/wLvv1ekkqV/Xpfc5nZ104cjo+mva9CUhkzyJTl2Ake/W1rGBx9aCFMfACZNIVS0AltN4X2mNuUrfziDDUz4JbVi2IRkAVp0+1AY316zgBFNsc9blSyOTgmsRZvPXEypN3k/pSvcPJtHPIa2iybuN+ygmGwCwJ1S4F0chrsoy5K3A4lhhE9IztogCAj625x09XAX38/VuBboMhFPx7SuBo1shlTbby/PJyHQfcyhuJDkXBmaiqmbd9WbLvqj/dt29fUEcJxmt5v4v9OQJcFfJN/wFf+UUVLvqZ6oDUIOj6mO/KylHQVVEMyrCA/cj1Nb6Nm7Lsof2D1nfgJ8J54OHZPTuTATV5RfrpsLd/whoVttYlwMQFCqou6g1ZZOw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(30052699003)(7416014)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dXcQ+Hfy370d6gZ/dX5xehtnqHARCkp6atz6UDO6ISBttulCinobHu4KPOufoPC6Bz2w5s2xEn1OGCEgDxHTejYU/JtlVSsx1ICbxvSeoDyQQMILrr36l7MwHi2jKpgikYDpd/xGbXPw/9brN6D0/DGDXGBvTvHrUe2QYccEp+vjflODFGLMXggIMdG1NHBAEphV+Y8dmo5glHKc249lLfCWr9KZRk5SYGiQAhIKhzjpbdD9c6jJvzsOCjY1Kbj0zNk1iKPm6K+kDI8FZBTQkx4r3Z/8/J5lt35O3htsLeSL/GG9MWKupJnjJE0sQqRv0kwo8fov7CPd/O1RqDUt5e+xsbdYNdp696kJtr3QGtDLg1B+V2GKbfEO8kQfF6mKyxxlhOsh9Zk7K5vflgFecn1U0UiE9pEw+oPz99ZW/WWLhjehPeIsxkdDcKbeIll3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:40.3401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbced1a-8138-4426-4f08-08df12350324
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB196577

vGPU management queries return data that callers decode after the receive
queue slot is released. The request and response must also remain within
one transaction so another receiver cannot consume the reply.

Hold the queue lock across send and receive, match the response flag,
command ID and sequence, and return the status with an owned payload.
Support default and caller-selected response timeouts.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 98 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  8 ++-
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b7d8a467d2fe..9fb17e576eb8 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -500,6 +500,16 @@ pub(crate) enum QueuePointers {
     Reset,
 }
 
+/// Response from a GMC API command.
+pub(crate) struct GmcResponse {
+    /// Response status (`NV_STATUS` code). Zero means success.
+    #[expect(dead_code)]
+    pub(crate) status: u32,
+    /// Response payload copied out of the message queue.
+    #[expect(dead_code)]
+    pub(crate) payload: KVec<u8>,
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -638,6 +648,94 @@ pub(crate) fn send_gmc_no_wait(
             .send_gmc(command_id, payload, max_response_size)
     }
 
+    /// Sends a GMC API command and waits for its matching response.
+    ///
+    /// The queue stays locked for the complete transaction. A single deadline bounds all queue
+    /// elements observed while waiting.
+    #[expect(dead_code)]
+    pub(crate) fn send_gmc_and_receive(
+        &self,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result<GmcResponse> {
+        self.send_gmc_and_receive_timeout(
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
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+        timeout: Delta,
+    ) -> Result<GmcResponse> {
+        let mut inner = self.inner.lock();
+        let expected_sequence = inner.send_gmc(command_id, payload, max_response_size)?;
+        let dev = inner.dev;
+
+        let deadline = Instant::<Monotonic>::now() + timeout;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                return Err(ETIMEDOUT);
+            }
+
+            let response =
+                match inner.receive_gmc_and_dispatch(remaining, |header, payload_0, payload_1| {
+                    let header = &header.gmc;
+                    if !header.is_response_to(command_id, expected_sequence) {
+                        let kind = if header.is_response() {
+                            "response"
+                        } else {
+                            "event"
+                        };
+                        dev_dbg!(
+                            dev,
+                            "GSP GMC: skip {} seq {} cmd {:#x}; want response seq {} cmd {:#x}\n",
+                            kind,
+                            header.sequence,
+                            header.command_id(),
+                            expected_sequence,
+                            command_id,
+                        );
+                        return (None, QueuePointers::Unchanged);
+                    }
+
+                    let response: Result<GmcResponse> = (|| {
+                        let mut payload = KVec::with_capacity(
+                            payload_0
+                                .len()
+                                .checked_add(payload_1.len())
+                                .ok_or(EOVERFLOW)?,
+                            GFP_KERNEL,
+                        )?;
+                        payload.extend_from_slice(payload_0, GFP_KERNEL)?;
+                        payload.extend_from_slice(payload_1, GFP_KERNEL)?;
+                        Ok(GmcResponse {
+                            status: header.max_resp_or_status,
+                            payload,
+                        })
+                    })();
+
+                    (Some(response), QueuePointers::Unchanged)
+                }) {
+                    Ok(response) => response,
+                    Err(ERANGE) => continue,
+                    Err(error) => return Err(error),
+                };
+
+            if let Some(response) = response {
+                return response;
+            }
+        }
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, consuming any other event that arrives
     /// first.
     ///
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0fccf16f6a1c..ac94fb564bfd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -739,13 +739,15 @@ pub(crate) fn command_id(&self) -> u32 {
     }
 
     /// Returns `true` if GSP-RM sent this header as a response rather than an event.
-    fn is_response(&self) -> bool {
+    pub(super) fn is_response(&self) -> bool {
         self.command & GMCAPI_COMMAND_FLAGS_RESPONSE != 0
     }
 
     /// Returns `true` if this header answers the request that sent `command_id` under `sequence`.
-    fn is_response_to(&self, command_id: u32, sequence: u64) -> bool {
-        self.is_response() && self.command_id() == command_id && self.sequence == sequence
+    pub(super) fn is_response_to(&self, command_id: u32, sequence: u64) -> bool {
+        self.is_response()
+            && self.command_id() == (command_id & GMCAPI_COMMAND_ID_MASK)
+            && self.sequence == sequence
     }
 }
 
