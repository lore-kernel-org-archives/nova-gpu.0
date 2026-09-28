Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC949B21A
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591489; cv=fail; b=a/hFdw95qRa0LTUzc/7WNroAut4HVJxn+/zVLwZDxESBYWRJNmRM+Cxq9WdFJfZ6kU65qJnxC7GM5pkI2Gs+4kljQGbE9hCN4x9lLpkWy+dAUEsfnIjmTGCjBEBJb1rIkIRE4VeuzsK9E2zmiP8enxPP0ac/R3xbNAGmaqaW+t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591489; c=relaxed/simple;
	bh=iqglLZaV31JjSDroYuKpr+cK7tUETwS+L/7nWvrKobo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTzkV9oReD0WlSETgv0t86pI97DwQDFv+svgyWtbDig+2G6otORyW9ofXPYOTz3GfcFy7nxS6XLZxcbZhNBs4V9E4eaNREBPiqfguYAZP1O9Dc2tgJ08sG0mar0xPz9wqnJDXnyKF0JJipxO3zCQtL8NeOnvu8Uh0DlxWcY/mts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xm2L6Z7o; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xm2L6Z7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSqNsxPfcdeTkA8oCyKN3b3WzZeeLz98YtST8vLTdwNC8dxNsOGKa72I6xdutU1evmZKTLpS2JHMiI6z42Id68PpbAfMUKq5BLex0zpFiGoq87IX8suDk36uiASOFx9lTMsxXIycM9G6WnLbo1mKCggYiXnglmyXi5HIM+G9Z/VkJefr4IINXfuKwozynC5aIEfQeeaemIPvKjbX1W9jwgyLVea1ZzoThA3BULi8F18ep0teoq3JuPsE74n+I/mSb7QGCe91mgvwvUUhWQ9ZoDND/QXUrdkE0zF33Q44emysVtaAKNGe7pPLoanT3PI8uoVz9jfbnlHOFj5ScKOpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHCxX0dn44GV5FZg3WHO33TmdX1AE1ka1zOeELEyZRE=;
 b=XFzKFymN8h1kN8zWRc+3yrKraZ3VfvVwkK9OYIvYfJpN8rXqCvPjBdsqYGqhh3tQdyPgSUAkKMKhIXrbcnqBWifr+fxxzn51JpitzszZ27ASZbAJVy4slRpe83Vkasb+NJV7F8k6DEjxraEIRpKxp/r3sD3cI4TW3b7+xjvzjnS053DQXvFD5gkbSwxHEOma2wIrKJRYneKyVELQ+EXiAqRIZm/yo1CjCqYPAU0jNLjOvYyqaEt/GUT7zTaALynTJoQHJCq3MKKp8cYq4UfvYFmWPCjOdEqlThZcFn76mVNiu7oORz47we9n5zvGkr41bukIUFDq+Z8L6FkL6gdzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHCxX0dn44GV5FZg3WHO33TmdX1AE1ka1zOeELEyZRE=;
 b=Xm2L6Z7oAy5tZSIRt5m4f5zZ47sbozx/aSv5dLrSK3MRtD+3Ihz1/uyOeIaKXneHTRqk9rWBm7ekOMI11m49r64TQFOsEqWFDo+TF2VfB36m7GAzP39xlv10hFw0Ym/I6cO6TSk+M4IIPpmtE1qlDgxeo5vgpi0VJLwon4PocCMrcpAutcvmWETXYAqzN2pobG7o5SIfh3h80EOLIObVugCj8ClQzyionGwHH6GtN9dFuoTkBOFJIQ+XvzrAMrfYIZTPAnkXAd7QVceuHKPV5xFhKU7jMlX+DgNVHVCJtPBk5OOCnMRb7qv4HFW1DQ68D11YOPrzNKsasCqWeIuW8A==
Received: from BN9PR03CA0128.namprd03.prod.outlook.com (2603:10b6:408:fe::13)
 by MW4PR12MB6732.namprd12.prod.outlook.com (2603:10b6:303:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:31:21 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::b) by BN9PR03CA0128.outlook.office365.com
 (2603:10b6:408:fe::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:31:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:21 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:31:05 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:57 -0700
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
Subject: [PATCH v3 16/31] gpu: nova-core: gsp: factor out NVKV payload conversion
Date: Mon, 28 Sep 2026 13:28:19 +0300
Message-ID: <a35b63a24653a753c16efee63e3e762645e43ef0.1790580105.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790580105.git.zhiw@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MW4PR12MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1cd068-91b9-41bb-d2fb-08df1d4ba385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	g4CnBeoff+/+XCV+ZbjJBUEdqhSl8BxgJh74VIWGzFNK/W4Ai5wo36xNVinM/fRIUTHjsDr4y2Ft/7yiHbIZNcRyN2d7ShJqvR98inkVe7qfIEyv+xCGGYvx8UQ8MU0WN89SffPiYGyZ01EtOmHYEiz5qky5OXtOUxn9JF+OVT44MO4JfMD0YpJ4S3tG1fpJVQG8cGqHzTqXQyBT0lSZRhvWxC1/hDQ4jsr3gPjhS7kLLsirNONsgGG8MBeoGcLxTOiglTgWc8+xdgchuUW+q20Dfbp51JDTWXISrTJAma2Y+woAyaNahymdWXH3Rbuf4rI3rmpqbi+UZVTD1N2dLAOPu0oKH9MdXUVSCodGaf5M9UO+bwIVnArDVkaX9mnBJ/jWW/l1pts1q0IPp7SC/AhoHt73KbAv1SC/op8a4n5DwbS2YzyuoEF+kOW7w8BbUKGFKhEej4z8wIYntyhqAKeDIzo1zuLcvc4I1wwW3eeRxudDntQVvovyfBQN6rT3/YMJbYz5uw19llz/KXDscrUQjtpUM6epFm1MYV0XwUTrkkjcE9iYF8P9m/FWZTvVugY1N2MZUihOyqSrUbBCbxr0I/CmmzC5T2TgzWTkAyxuEBxSz37Vg5/v28x6vcxrW8QpvlzIGO8ncxCFgY8B0ZCx1/B4y5qoP6kbLG4/LEO0a7Y6PvcL+S+gLDs0aOISTD9op/Kp/PjeCp7U5vrKyA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RUyxmP1SoiqWzkjSZ7Chn2ghHAcJssNSV1HF7HpAMuRG4iPZizStMiVkUyP3l0gnTKkenPZUw0jLSa1+6wNAC2o/q9tSK+okrcISCddobSpS36ZfXRhMw1job/WzqXxfJ2UGimP0P5keQ3trhsBguSXjRKp3TPmBOBFgWs/7n/5LTcDtCzBN6BqccOYbdZh9+Fjvbql8fTU+JXVkbkW9cOp8ptYsv6A3dSVBgZcsbaudH6MoHjPeh5i328Ssp/nWc4wFQldlDtWNlZSIoLqhmL9Pi1v8wCM+bbflR6EKENwxTE5OczgPNODcsLLrd0vf3jQstUjl3ia99eSEt7Onj9U+jX3Ea/o0F5NMtgkuXWWPz0JJZdDzPO/lGBNC/tG/YzanFto1LpEuD3bPrnIKxYY2TDMZfu+HQ10cca4mcf/1vomq89nmjIx8ghYLv28M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:21.1309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1cd068-91b9-41bb-d2fb-08df1d4ba385
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6732

Both GSP initialization and vGPU property queries decode their replies as
NVKV streams.

Move the byte-to-word conversion helper into the NVKV module and make
that module accessible to the vGPU firmware interface.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs          |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 17 ++--------------
 drivers/gpu/nova-core/gsp/nvkv.rs     | 28 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 3dbc37a3b35b..25b4bf6eb848 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -28,7 +28,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
-mod nvkv;
+pub(crate) mod nvkv;
 mod regs;
 
 pub(crate) use fw::{
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 97e32f81a39b..742e46efd413 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -22,6 +22,7 @@
             GMCAPI_CMD_GSP_SUSPEND, //
         },
         nvkv::{
+            nvkv_words,
             Decoder,
             Encodable,
             EncodedStream,
@@ -30,7 +31,6 @@
         },
         GspBootContext, //
     },
-    sbuffer::SBufferIter,
     vgpu::VgpuState, //
 };
 
@@ -132,20 +132,7 @@ pub(crate) fn gsp_init(
 ///   or omits a required key, or the FIFO engine count exceeds the supported table capacity.
 /// - `ENOMEM` if the words or the decoded regions cannot be allocated.
 fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStaticInfo> {
-    const WORD_SIZE: usize = size_of::<u64>();
-
-    let len = payload_0.len() + payload_1.len();
-    if len % WORD_SIZE != 0 {
-        return Err(EINVAL);
-    }
-
-    let mut words = KVVec::with_capacity(len / WORD_SIZE, GFP_KERNEL)?;
-    let mut bytes = SBufferIter::new_reader([payload_0, payload_1]);
-    for _ in 0..len / WORD_SIZE {
-        let mut word = [0u8; WORD_SIZE];
-        bytes.read_exact(&mut word)?;
-        words.push(u64::from_le_bytes(word), GFP_KERNEL)?;
-    }
+    let words = nvkv_words(payload_0, payload_1)?;
 
     let decoder = Decoder::new(&words, UnknownKeyPolicy::Ignore);
     let mut schema = GspInitResponseSchema::default();
diff --git a/drivers/gpu/nova-core/gsp/nvkv.rs b/drivers/gpu/nova-core/gsp/nvkv.rs
index e7a9549919fb..05b1ba5a4f39 100644
--- a/drivers/gpu/nova-core/gsp/nvkv.rs
+++ b/drivers/gpu/nova-core/gsp/nvkv.rs
@@ -27,6 +27,34 @@
 };
 use zerocopy::Immutable;
 
+use crate::sbuffer::SBufferIter;
+
+/// Joins the two halves of a wrapped payload into the `u64` words an NVKV stream is made of.
+///
+/// # Errors
+///
+/// - `EINVAL` if the combined length is not a whole number of words.
+/// - `ENOMEM` if the buffer cannot be allocated.
+pub(crate) fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
+    const WORD_SIZE: usize = size_of::<u64>();
+
+    // Each byte slice is at most `isize::MAX` bytes, so their sum fits in `usize`.
+    let len = payload_0.len() + payload_1.len();
+    if len % WORD_SIZE != 0 {
+        return Err(EINVAL);
+    }
+
+    let mut words = KVVec::with_capacity(len / WORD_SIZE, GFP_KERNEL)?;
+    let mut bytes = SBufferIter::new_reader([payload_0, payload_1]);
+    for _ in 0..len / WORD_SIZE {
+        let mut word = [0u8; WORD_SIZE];
+        bytes.read_exact(&mut word)?;
+        words.push(u64::from_le_bytes(word), GFP_KERNEL)?;
+    }
+
+    Ok(words)
+}
+
 mod encode;
 pub(crate) use encode::*;
 
