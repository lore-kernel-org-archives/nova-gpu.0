Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2363F12F9
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372348; cv=fail; b=PUzRQP3yCydFhebvlyB2kyhbvt3kfmHRW6XahV3I/vZCKitGk/kICoe2eAvt5pkfGya/pIfnRxCiUK4xj8QrLvMqTdaYI2Wwouf31wvnI+iAV3PODPWgRTFRFgwp27ieteAtYljW0JRSXMYXjJZ0ONDC6rUMBgQGPedYSSmrrEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372348; c=relaxed/simple;
	bh=uKRs5/8vFwqQBRJxQ7xU11r/fttzcR//d2bycDdYwVg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgHATVYGtxKSs7VHU/zKWFhXZ+tCSjEFB4rxzf+9/hYdUxf+utLRlL2VXsmI5NALzc7BJhaGppsiuxPR2zrWVBMMq2uEqAZ1Icu8DAisdQpO+BF5qQG/mCTaUC1+vGN8CCAp7Rh1iJxD+oH++5LaPHk+r/4Pz3Pflrh8AmI0NTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rh5SAWMP; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rh5SAWMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMG6B2i/bgm/7IBv7/xH3gtDAVIOtzC8ovlBeRbGPEsJFKMC4c12UXmCbsAtgdAAOa8xUllT7XJmAXUYkJjmUhNBXpYibBQko3+d5Kbg0vLXwNc70lvMngvzF6umv0ar4b3mQvR/N90U/B8qkwq+OpLtX5jyGRBcvKQUtc4dpy/cN3OnYKQR9kNmJBwDrUEK+5H5B2WSHJokMPGjRtyUafQ5ZDkV3yeih9tthOLBRh8lXfx/L9tRJ1RCP+NbofLKK6c+j2hT6v/xg4JsPvOgJ9oU9IO/WJ7uFdJRkceChig/xuwtdaMPjwn9N7TgDOyez4IyCrS0OoNiDncT9kud2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRoWMlFkfabcZ4MStzMT10yvrw/fHhJgwEcFNe8HWm8=;
 b=UVDq4aWHrNT4qE8h7v83u/F44hZjLSrobfaxve6T+3ih23IzpeXsZva+rR++3J4+tEwAxdTqtwVZJDl3nTT2FmeyCh8RnWj/59NQ+n3FipgM30DL1ik3riLA9pR6ueF7z3Y1WtuZnhkhlB/xZSWlf047HZRA0rJDtHzXhcKDJqa0TAdP2RUnO3oWkFlZrqDXG/t6kip2X4b3ZX7pfKRwTHfTuMMxrSnBTjW50mROUA/TNPR3hJhSXFxxbS1yFyTJqCSHvENsP4R3IqINeG/4Ji+Iz0kUfC0KDTKNB6wKQp73wYmYgjinw341Q4+l8DE33WnRPIPFkenLzhgsSFcvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRoWMlFkfabcZ4MStzMT10yvrw/fHhJgwEcFNe8HWm8=;
 b=Rh5SAWMPjWf8reFu2EJ6yPn0u3N9czymO8yIPhW/96+yVgyuEoC38WZJVBZmHIjM5+Iz2dK/mNPwnoNOhfM/CmtTL+tKnaTrl/e/hQubQIcJcAMBeSqxtgywO/4MFWpuX4KUKtrwEVEufiQIjQO4JpBWym34KLR6OzLbwuUmEOvnCYAx1jMliQRR9bYnYk+YqG1SjqmJeoGLsNSqQmFnX02R7AX00wtvIQZQi3TokzQXCUIwD5hMRRPOI3oRIxuB0sg9soQ0339Hn8YvzDnuHVTYmcrr9fkUa3M4glkQIyzIpBn/9/HrCRPiWkOj178y2qEa1PVEFO6QOgjZtkHvvA==
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:52:19 +0000
Received: from BN1PEPF0001854B.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::62) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0001854B.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:52:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:58 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:58 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:50 -0700
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
Subject: [PATCH v2 19/32] gpu: nova-core: gsp: factor out NVKV payload conversion
Date: Mon, 14 Sep 2026 10:48:54 +0300
Message-ID: <20260914074907.1399629-20-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854B:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1296d3d8-5e8b-4903-64b3-08df12351a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/b8EOLFci6R6QbKKJW6R4X8czuKCI/b5Kd0DzwXrdWn9y128lkWdwYm22+h42WSBzhmWnvA702fKpBg1F0L3/jmriyg7c8OyoAB3numt5nsPizyXQS4xbyryi5NlodaEN0cY0a9rRpo8X4JZr3RbDUS9S5X5S/rE/2qaxKMxEatNDS3Lqo56gNq3f5aBkXPiXc6rqW9VdOfDlYIer5mp3/qvIXybypPf8BWZbwnprrDnG23llrKzoSq6hXHm/zmM4PoV56HRXkwfCcmWc6CS3gzOvJVYA1fLADCyX258mPu3s4iVtJ3GJKnn1sceNtULWZAJpKc0fHHcmQDXYpYtJ2BvEWRn2/8V/l+YZJQ+ZbA9fF1tHEzmxPwQ5EkNpr5HpqZoZKZjpTz+p8XvK3FKLaf/YPDZAJJnp3R3v1BWQiGFJFzaoQDmyEDDRtuw72G9Tv7skUJ3dm2QQK/IB3bypvAXC6fgZCMImFPAxMMfkgfK7B8FqJD0mF53ZfXogu+d6LV5fWsCp79mMSBRqJmPiFC/CZNxvk/9q8DUmoN5bV9gkbBwkBtu66RDrSEdTOP2yFM48F877skDBN5Fxt2BKWksaySKN+mBeXUHxUk8W7SMQlRPq+MI+VliBuCmeS963WpYtEZdlZ83HRQomQunIHf4CdEoRckM2KnjfMzB5Wwj+K36SYu9+8o7NGT/ex1L3eIfve0AVA4EEcgnFlkSAQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ahPT0MZzGCSPV37qCBmOeG4w+Sm9eO/asDyf+xmxopsStTjMilJ+qEnfQq7UJrQO+k3CcD/GU67OUnWBB9xMER+9zmrYKjAeNRowkKRuMS2W1cn7SI9PZnoL+veEDbfYMSBD/CvUagaFfslND0FCq5AH2s4PCWQmzrRAMVyX3EmKXUL3IVSAegabe2BuaG4+CCADglh1RtXzu8RGKauKCHviXtEqNIkB+l8tgXHPoYxVrHJntszbeec/wQnR5diwc6oMwC7HvKZGnt1rQM2RVXEnqwYKaRD9Jc4OBmi7mmOWaMbkBKXL+vrevwhC60DGWZlUsOKvdavIjinpXB3bAfscVYWixIFhEgbCkMt3CrNqzDHj+g7o0KG53/n4vp0jIZsfRWzXn183KDXL5PLEyHqwkkhBRpXsBSyNS184up3JKVemdFvKfFDv2n5w4Vw7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:52:18.9149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1296d3d8-5e8b-4903-64b3-08df12351a24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074

Both GSP initialization and vGPU property queries decode their replies as
NVKV streams.

Move the byte-to-word conversion helper into the NVKV module and make
that module accessible to the vGPU firmware interface.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs          |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 24 +-----------------------
 drivers/gpu/nova-core/gsp/nvkv.rs     | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 93291c67d6de..5b1e4eb7cad8 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -24,7 +24,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
-mod nvkv;
+pub(crate) mod nvkv;
 mod regs;
 
 pub(crate) use fw::{
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 7ca5ec2a58d9..7945a191bd08 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -33,6 +33,7 @@
             GMCAPI_CMD_GSP_SUSPEND, //
         },
         nvkv::{
+            nvkv_words,
             Decoder,
             Encodable,
             EncodedStream,
@@ -41,7 +42,6 @@
         },
         GspBootContext,
     },
-    sbuffer::SBufferIter,
     vgpu::VgpuState, //
 };
 
@@ -256,28 +256,6 @@ fn decode_gsp_init_reply(
     decode_gsp_info(&nvkv_words(payload_0, payload_1)?)
 }
 
-/// Joins the two halves of a wrapped payload into the `u64` words an NVKV stream is made of.
-///
-/// # Errors
-///
-/// - `EIO` if the combined length is not a whole number of words.
-/// - `ENOMEM` if the buffer cannot be allocated.
-fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
-    let bytes = SBufferIter::new_reader([payload_0, payload_1]).flush_into_kvec(GFP_KERNEL)?;
-    let words = bytes.chunks_exact(size_of::<u64>());
-    if !words.remainder().is_empty() {
-        return Err(EIO);
-    }
-
-    let mut out = KVVec::with_capacity(bytes.len() / size_of::<u64>(), GFP_KERNEL)?;
-    for word in words {
-        let word: [u8; size_of::<u64>()] = word.try_into().map_err(|_| EIO)?;
-        out.push(u64::from_le_bytes(word), GFP_KERNEL)?;
-    }
-
-    Ok(out)
-}
-
 /// Decodes the static GPU configuration from an NVKV stream.
 ///
 /// # Errors
diff --git a/drivers/gpu/nova-core/gsp/nvkv.rs b/drivers/gpu/nova-core/gsp/nvkv.rs
index e7a9549919fb..9f2119b98b26 100644
--- a/drivers/gpu/nova-core/gsp/nvkv.rs
+++ b/drivers/gpu/nova-core/gsp/nvkv.rs
@@ -27,6 +27,30 @@
 };
 use zerocopy::Immutable;
 
+use crate::sbuffer::SBufferIter;
+
+/// Joins the two halves of a wrapped payload into the `u64` words an NVKV stream is made of.
+///
+/// # Errors
+///
+/// - `EIO` if the combined length is not a whole number of words.
+/// - `ENOMEM` if the buffer cannot be allocated.
+pub(crate) fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
+    let bytes = SBufferIter::new_reader([payload_0, payload_1]).flush_into_kvec(GFP_KERNEL)?;
+    let words = bytes.chunks_exact(size_of::<u64>());
+    if !words.remainder().is_empty() {
+        return Err(EIO);
+    }
+
+    let mut out = KVVec::with_capacity(bytes.len() / size_of::<u64>(), GFP_KERNEL)?;
+    for word in words {
+        let word: [u8; size_of::<u64>()] = word.try_into().map_err(|_| EIO)?;
+        out.push(u64::from_le_bytes(word), GFP_KERNEL)?;
+    }
+
+    Ok(out)
+}
+
 mod encode;
 pub(crate) use encode::*;
 
