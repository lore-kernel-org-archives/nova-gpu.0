Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013039.outbound.protection.outlook.com [40.93.196.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B549AA56
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591393; cv=fail; b=DCTlcJg0L5xEt1UM9TvpEMxOJPugaC+chlN+Q0F9NGRoz6/B0xRVUADUHNIJ/aOYpfuix9+hYYJA+/IOntliJfi+iGNK0+OLR9QKFiquOL8hokMK7rUF8E818HXwT92rFaXEJh/eTB+PVvGbhurIHt2DWSt20vYHf7vorb8Ae0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591393; c=relaxed/simple;
	bh=n3HykQB+SRsP5tosFczhOvVe4pIDdrkopQhq6UPL5mo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lec4jr7CA96Y4SQ7pjoGmVGtBuk5pZ6j3bwaI0N/MU87+c08Ym1SqyCX3QX8LXcIEY7jZ+LqiO9DNjPQBG3E2HkkBxCzaq08IkA40OH3lIhiMh2oGQixsPHRBr5IbsC7lVFtUtAkTDrRiiB7kh3clzhTlfn5yQT7hsuZpzleDLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f54UyA6k; arc=fail smtp.client-ip=40.93.196.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f54UyA6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0jdYT38LU3Z0AvBlj9DiP70FyXZ/FmcCUcG/f3qrbhTOReHUI56sgQIV828Vrzxg3D2OkUmpcBmaCDgfSNQgIKavkDcs/HH4bi/G4Buf+JVhpjkQMN18PR9FN9LS4ZkAZQhyPO5cWiA82/QSePNSzuz0G4K04TfPHMEqs0Ce9H1PNMOUm+NR4dqNb3oDqtPHsIuQ9X5u3bcpPRvzuRgjiaXXOEzU34UvysGwbb9C/GWdOK1iH34cu77xQbB6G3a2R1cs9e0MKkkLfZ3XNxi9c8JDgoVvRa/UFeXGTC+XVbff5LOf9c8mZr3h4lGhvv1yMm1B7NveewT7yp8FwR+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldbHvQw3bcKRH1coQIQIOUTXfcDyG9tdPEa7liVk2Jk=;
 b=FdEF6ukKkebk49x43abjuR35/tq02XckrxxiCn6UOrY1wCI6elopCQUKFV2qxplwLBfmaBmABhAZezwQ4R+vxgQcyIydceOQBNuU3stFiZFpLus68cunUgD7ivtwCgtVgQy3fv6uKkSaKTH1seq4jrOE/E+zN7Oyi7HEfT4vSGx7FLXFzvQU+qBjXGGSL5AZDlnU3ttZWBHvuLLC11PO+5xH3cz/oD2PYnR78yjlu0LX3GxtURKqtz6RVF7FrJ2OHUqY4WK+L1kj8RPmTPSkfJYp38YJtlZRcNK/f6kb5kOWD8GtRfMzvzlOBzD6KFKCqqD/0A9LXPzE7+uMpT4X8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldbHvQw3bcKRH1coQIQIOUTXfcDyG9tdPEa7liVk2Jk=;
 b=f54UyA6kN7kzB6s7EhWlWZyhbd9vrdOP6jUzV4jISWacxDGxffNBPq5J+m4+vG+eHt1mtuE5cbzkpnDHMiNblRhodMdUe2KvAp11Tw+rAHw43wrV3gaZ6uHL9SC/KrQ7zlHFL0Q4nCEqxsQUzDogPKD4oTIsyYRLuTKheEGQEqxQHqz1zPLrGCTGRSbl+dDVJRcJOvDxiLoz6Mebe7R7pVftYt5JNyBrzW6y+C+qDHpOQSPB707ARNpdKgJ8IkAy5LfeABVue8DBvxavgRy8AUPoCTUsnw3tzAoJQqA7+yUupz8jDfhqxDTucyhsD4KEZfJFXjnEoBbx/LaOwf2jKg==
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:29:46 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::4c) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:29:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:31 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:30 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:22 -0700
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
Subject: [PATCH v3 05/31] gpu: nova-core: gsp: decode the FIFO engine table
Date: Mon, 28 Sep 2026 13:28:08 +0300
Message-ID: <71a9b18dbd2eb324b797300a3b50514708fe5d82.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: a072ea6c-be42-4e74-b044-08df1d4b6b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|82310400026|376014|36860700016|22082099003|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vI1V15q8clEU5OMjq2m5qjBqMMC59wnh+bT4XusyQjZZrjy2nHuPflqKKNeq1Yt5EKE6DlLow7AiSUwiYj94HFRPr4AxigcFh7VrPOQFtxEf3ZMreE/HoYFgLdAw67BLNdbUoMF6hHnznBtiLp8A+p/AAPvAcTQvuCHqdrA05m9T6G4YC67wA6t9s9d/y3/6DbnH4f12lQ2cGkatTS77HXaDj1Tfy/7giZYMrnpltWK6piTGxoS9WTLB6MA7Oey2akMWkqtUizj/dxo+jUyuVlU4O+TV27NdDR8vwwZBa2ZFoIE+80Lskba2BxZR9dPoAN6QICDJUH9PiMeQDeALZbkE2OT3uobvVoyLm6UBEc/pVMt+8QbTxQKndNA7NLSxNVL6s0tEgHEL7fmUaCUISehylOqvIyyljZpXKzvXGdh5cjBDXz0aZkYlRXu1W6fYflIbI6sm8Z3PnB1C1eRB+i1hz7vNSFTiLJoS70xIitlzCe6FkGpEWBkwQ4KX2ra+gmR3GbT1PZi2qNQl5atLCufZdJylEN2BIW2F6upROwAZUP3mAJq7bb4cSwL0YUg2MohhT7A384euNt/oaP80wZwnzqUh6ThO0AqMTXJVTjGoOsBtRy+5h42rAmbStlf4nc5Z+KGOjPs6R9CP0t6GFmRhFx81LAbq9Iys2HroIj5dBWlzvx5aj346rdv0S/B6r93OBVB8h9zOBNkiH0yjeQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(82310400026)(376014)(36860700016)(22082099003)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VWgttrKJRVUd3Avmz6hn3dVQ8iC4SnsVUg4NBmleemJjbJO+vu8KFuQthyhQumR34KA/DI8JNEJCP0eUBQyKYDCGCOFjD5LUeF9iccGxiWj5u8zB9LCAy1tgonUBI6+Dao0dGmwA9ylpGnuwDgTl7FZHsa1pgdIy9IvH4KgTtMTGYLloRRQ+l5ukJ+igUtyil5731qMq3widQzuld6E5g58iOgbRg1Y6cCPAhk9iIoqvpbroFssfay1Ang4wRVBxhgoEKtrCwBZPNkzYsdI9AEk4lcrjVbx+BrRTWpRSWS07t8IMC9zfYuomBtRg7IjP4+JLNIE+0u8uZOQd1tSLwt0UyLOtV9NTDDQVGCqST3LYeEubuSl+ZM017jR4yCKSAN/2lQEkzCjGarMKP0Bj3vlJbDzpj5gAouXTwSH5QBraKeacTc39L6eUJ41hmEth
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:46.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a072ea6c-be42-4e74-b044-08df1d4b6b20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441

From: Alok Kumar <alkumar@nvidia.com>

GSP_INIT reports the FIFO engine topology used to build the channel map
for vGPU instances.

Decode the count, GMC IDs and flags into GspStaticInfo and expose
host-driven engines in firmware FIFO order, retaining repeated IDs.
Reject counts and indexed entries beyond the driver's 64-entry table
capacity rather than silently accepting a prefix. An omitted count
remains zero.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    |  2 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs | 80 ++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 9473004a0921..436ea52689b9 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -126,7 +126,7 @@ pub(crate) fn gsp_init(
 /// # Errors
 ///
 /// - `EINVAL` if the payload is not a whole number of NVKV words, or if the stream is malformed
-///   or omits a required key.
+///   or omits a required key, or the FIFO engine count exceeds the supported table capacity.
 /// - `ENOMEM` if the words or the decoded regions cannot be allocated.
 fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStaticInfo> {
     const WORD_SIZE: usize = size_of::<u64>();
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index d0715dca1be2..17ae4224e214 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -29,6 +29,7 @@
     DecoderValue,
     Encodable,
     Encoder,
+    Indexed,
     Key,
     KeyId,
     Required, //
@@ -317,6 +318,52 @@ pub(crate) fn new(
 
 // Decode:
 
+const MAX_FIFO_ENGINES: usize = 64;
+
+/// Bit mask for `NVGMC_SC_ENGINE_FLAGS_IS_HOST_DRIVEN`.
+const ENGINE_FLAGS_IS_HOST_DRIVEN: u32 = 1 << 0;
+
+/// Host-driven GMC engine IDs in hardware FIFO order, including any repeated IDs.
+///
+/// # Invariants
+///
+/// `count` is at most [`MAX_FIFO_ENGINES`]. The first `count` slots are the retained engine IDs.
+#[derive(Copy, Clone)]
+pub(crate) struct FifoEngineList {
+    gmc_ids: [u32; MAX_FIFO_ENGINES],
+    count: usize,
+}
+
+impl FifoEngineList {
+    #[expect(dead_code)]
+    pub(crate) fn gmc_ids(&self) -> &[u32] {
+        // PANIC: The type invariant bounds `count` by the array capacity.
+        &self.gmc_ids[..self.count]
+    }
+}
+
+/// A FIFO engine count that fits the supported tables.
+///
+/// # Invariants
+///
+/// The count is at most [`MAX_FIFO_ENGINES`].
+#[derive(Default)]
+struct FifoEngineCount(usize);
+
+impl TryFrom<DecoderValue<'_>> for FifoEngineCount {
+    type Error = Error;
+
+    fn try_from(value: DecoderValue<'_>) -> Result<Self> {
+        let count = crate::num::u32_as_usize(u32::try_from(value)?);
+        if count > MAX_FIFO_ENGINES {
+            Err(EINVAL)
+        } else {
+            // INVARIANT: The count was checked against the table capacity above.
+            Ok(Self(count))
+        }
+    }
+}
+
 // Should decode with UnknownKeyPolicy::Ignore.
 nvkv_decode! {
     /// Schema for the `GSP_INIT` response.
@@ -326,6 +373,9 @@ pub(crate) struct GspInitResponseSchema => GspStaticInfo {
         fb_regions: Accumulated<FbRegionSchema>,
         bar1_pde_base: Required<u64, { Self::BAR1_PDE_BASE_KEY }>,
         vmmu_segment_size: Key<u64, { Self::VMMU_SEGMENT_SIZE_KEY }>,
+        fifo_engine_count: Key<FifoEngineCount, { Self::FIFO_ENGINE_COUNT_KEY }>,
+        fifo_engine_gmc_ids: Indexed<u32, MAX_FIFO_ENGINES, { Self::FIFO_ENGINE_GMC_ID_KEY }>,
+        fifo_engine_flags: Indexed<u32, MAX_FIFO_ENGINES, { Self::FIFO_ENGINE_FLAGS_KEY }>,
     }
 }
 
@@ -334,6 +384,9 @@ impl GspInitResponseSchema {
     const GPU_NAME_STRING_KEY: KeyId = 0x2000;
     const BAR1_PDE_BASE_KEY: KeyId = 0x1020;
     const VMMU_SEGMENT_SIZE_KEY: KeyId = 0x1050;
+    const FIFO_ENGINE_COUNT_KEY: KeyId = 0x0500;
+    const FIFO_ENGINE_GMC_ID_KEY: KeyId = 0x0501;
+    const FIFO_ENGINE_FLAGS_KEY: KeyId = 0x0502;
 }
 
 /// The static GPU configuration, as decoded from the `GSP_INIT` reply.
@@ -343,6 +396,9 @@ pub(crate) struct GspStaticInfo {
     bar1_pde_base: u64,
     #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
     vmmu_segment_size: u64,
+    fifo_engine_count: FifoEngineCount,
+    fifo_engine_gmc_ids: [u32; MAX_FIFO_ENGINES],
+    fifo_engine_flags: [u32; MAX_FIFO_ENGINES],
 }
 
 /// Error type for [`GspStaticInfo::gpu_name`].
@@ -407,6 +463,30 @@ pub(crate) fn total_fb_end(&self) -> Option<u64> {
             .checked_add(1)
     }
 
+    /// Returns the host-driven engines in their firmware FIFO order.
+    #[expect(dead_code)]
+    pub(crate) fn fifo_engine_list(&self) -> FifoEngineList {
+        // INVARIANT: The list starts empty and appends at most one ID per supported input slot.
+        let mut fifo_engine_list = FifoEngineList {
+            gmc_ids: [0; MAX_FIFO_ENGINES],
+            count: 0,
+        };
+        for (&gmc_id, &flags) in self
+            .fifo_engine_gmc_ids
+            .iter()
+            .zip(&self.fifo_engine_flags)
+            .take(self.fifo_engine_count.0)
+        {
+            if flags & ENGINE_FLAGS_IS_HOST_DRIVEN != 0 {
+                // PANIC: At most one slot is filled per input, and the input has at most
+                // MAX_FIFO_ENGINES entries, so the next retained ID always fits.
+                fifo_engine_list.gmc_ids[fifo_engine_list.count] = gmc_id;
+                fifo_engine_list.count += 1;
+            }
+        }
+        fifo_engine_list
+    }
+
     /// Returns the BAR1 page directory entry base address.
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.bar1_pde_base
