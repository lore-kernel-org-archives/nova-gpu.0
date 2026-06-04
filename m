Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99E42B74A
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573541; cv=fail; b=insu865omHHUsYBa+OwdjHtj1Ozi666rFjVFAd3a5XO7yf5xoOlUZ8riVK98FVWvSCHKs+W9QCezqDxsp5ARzWbx6j+sQ2CnNmqAJ+zUFmmpkIS7ysihqpVrdQXMv9YpwdzLVcHJjxVFCjTFRSSwFz8ASYME+o39KUF3YYJqDyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573541; c=relaxed/simple;
	bh=vkxNoLn1BsHyIMePZ7gHcQrlBPgycj1PndI3QGHaPlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1P1+nL7b37SpkGmmJXL7reFbPw7Oojc6ty9FbB0vK5iyWMBIIu+LMU/pmvTcguhZo7RePX127I2eMOJb0V4T+NoIqK6kdIAYaFy5lpphyswv2UTaiY4QeDF2QQRAxfopN/Rs0kwssH2JcB8kQvDRPrO5qH0HGSJf/GDh03nzEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I485MlZk; arc=fail smtp.client-ip=52.101.46.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I485MlZk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/+ffYJZt0UEq5vrGcLyyWwLbv/qaqIgQOKob4Oi+hJxxmBBX44NLKfsG4wDOvDn3fu7BspPCFE52eC0u9rwIhh22Dq+4AOzqTmyDNe/7KKkUz4RTwG5SQGFg1SUgsqt6bzKuZwUTO5Vouavt+CO2i0S2A6HelVkC4RFes5OJj8sRMPrPXMxb/Ru9OT1vT3NnohwMgH730XfVJNpjVNwMnH6vtTmS9409z6D5L3RtQLT1dR3hcGMZn0oedYHVgfS1NVx0MUjEmget3rxEoeJt5tPsepB20EZzwwmxPN4uSL3xiwVMKzw0qqHzsXCFeevY2dEGVpKTeokD40ni3x6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPkOwT9h0GhsuM/iL84vxSMvtAEcaZBdyrZCrCtwOEc=;
 b=KT66MePBI7Tg2GEAl5mmTTwxI629wlk2sR4/UPCJjq18rI+JMSLZTmVgGq5YKPZyE1bz/Xf7uEtuxBxyPlsKLcJla5y7r375VgA4k7prIIrIpHu+VKFcCzXA+cUJa0qh7crNrRVsGvPBy7x2EnHEi3phblhiwa8Enxs/s6Y9bqDytChTfdzKxsG5sl7avnttXiLJ/2y5/OPHSpJ3ZqZp6hA52+Ihe/rqhu5S78sVJ6VasSBwlcoOCErOfVWcifzgDmdvLE/Y4Mk1WL/TmOnCDOKT0oKUQnTqb09zia5iTBBfdGXOKWIN3KwRPbc6yervdGEBcTvMDa3qUk8KiiEiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPkOwT9h0GhsuM/iL84vxSMvtAEcaZBdyrZCrCtwOEc=;
 b=I485MlZkb203TBS6GcyHKmfIGoWwwi1PYkrPLSPFC27PoOJuL8GZvWlzffnPNOxChD7Eu9HVeH+BlnzLBjvyxnGdtl1HcnowMsvKz6e2WxMRBfy55+4tsNVetehwJ7LkppaFVNv4GnaGS23hqopeZsf6cZXAOVrbLXVmD+dO1hjWc/UpW1AIqU4d89cZUZJ3fA3Cot5gHwO17pZREW2PHgl5Er8zGiJN7JnNpSjSzwptbeMAFAe26L1NYrjs+zIr9Xy4xHs4JSS7M7TIJpDwoobW1c5aUSQl/1P9SnzFSHm7Vr2mwUXwmINDwdivj704SrJnr90TQkn2ixYfEFKH1g==
Received: from CH2PR18CA0043.namprd18.prod.outlook.com (2603:10b6:610:55::23)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.8; Thu, 4 Jun 2026 11:45:29 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::6b) by CH2PR18CA0043.outlook.office365.com
 (2603:10b6:610:55::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:45:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:45:03 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:45:02 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:55 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 8/9] gpu: nova-core: set RMSetSriovMode when NVIDIA vGPU is enabled
Date: Thu, 4 Jun 2026 14:43:38 +0300
Message-ID: <20260604114339.1565660-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604114339.1565660-1-zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: d087ad3a-c173-4e8b-6efe-08dec22ec6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	fW0VBTASQToFOcd5yKoAplbeiKmxLNiR0ACp2Blkghy7ez9MHB32d5WQk/GgH7h5m+YvDOFKewUSPvvXoWbMWNvQQ4NIUF28b/0TNuTvYeyewjgsV0h0HNRLPoDT/HZ3X+gG/xs4OkcJ27uUKkkkje919kScq6ehbtDmtJQT8B1cKjhFiZz6/irwXDdeeGPihl2if9GSyAmwJvqeGnGZPR5iNIihBQ5K+sibkHvK0YHHe4e/dBpm6t9vVT68D2mYocJxOfjApeQznvAzggQueKN1DtwlmLI7nesw5kve00MTTMo2Av25cnltUP/U5i17HLcWTv77iYXfHNkIAL7h277Om9rfZYitHCI59FgCSnQlxWA5n9q7XVt95hDInmXUAESDTMDt7CZc/g3wF9rcBXqtY1RorMgVxic+1nz9OErDJRQMiAoZa2MQg9v0ItqLsSpLZ+PFtaXLA6/bjmchnu6Sx3WFSQoX3CE8t1Gs/jkvStHOSK5wXZqh81bAXPns+HJ8V+v0hAgih7ITvgH5fagWlbsJcw1DHeHsJLcRbrpZg9ORHtUK/d17776RvEez8+YElS4DoJDipouXF3UgiwTdJX48hZJl/wO5PIJsx4M+gr457sZXx3KCQGYav2eFh9Vj1/q1Zhw/Ib6wgg6HzlcjJOn7dBhmXoVM6UyeQyLfDj1KnWWXDw3KGS/LCJVvEEcTYALwvfI7an4Y+E+r4wyDR3baPv6uGxNouB3cp8c=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1G//XljhsWmJZIvdxDj0cYjj24IidGVb3M5c1s4DhPT5mYarbo2lPz0ti0omuy6xx6N/oLKAu1u2Rr6tqBxxSL8+AxdpyPxmddbEUfkFdcaVShwNSRASdn432/5Osr6FfkAF+zwscwED29B+tQlZGcaFnNwmPHl0V9bhNN75SaYuB8OecdOx5MT53VATuW9f/EuqgPNWFrdqx0Ix17HaG7SdLr/FO+sESyiKaKA4oYkZRggCsuGYkfu5wI4KVrC4oNfSaXtEmDD3hj/aZFrykSX3FBmxo+JCphWBp5vh3gtLd+ufnkCofje8nTn1A+l+kaGu1MNBe5kyAeCXrRdBvc6Ak+XF1LshEsyKw/iT4VxUx6UxhmpyW7qFMmbAB2pp79yahyeRgnxHZgdHQ5EwmNFl9P7u5G976xiN8fDZZhI9TMRIMJSe9oAagBR55IlH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:45:28.9662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d087ad3a-c173-4e8b-6efe-08dec22ec6b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

The registry object "RMSetSriovMode" is required to be set when vGPU is
enabled.

Convert SetRegistry to use KVec<RegistryEntry> for dynamic construction,
allowing entries to be added conditionally at runtime.

Set "RMSetSriovMode" to 1 when nova-core is loading the GSP firmware and
initialize the GSP registry objects, if vGPU is enabled.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 93 ++++++++++++++++++---------
 drivers/gpu/nova-core/gsp/fw.rs       |  4 ++
 3 files changed, 67 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6e170401d616..2981d02d15ad 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -139,7 +139,7 @@ pub(crate) fn boot(
         self.cmdq
             .send_command_no_wait(ctx.bar, commands::SetSystemInfo::new(ctx.pdev, ctx.chipset))?;
         self.cmdq
-            .send_command_no_wait(ctx.bar, commands::SetRegistry::new())?;
+            .send_command_no_wait(ctx.bar, commands::SetRegistry::new(ctx.vgpu_requested.get())?)?;
 
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index f84de9f4f045..6171c60f6de0 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -29,6 +29,10 @@
         },
         fw::{
             self,
+            commands::{
+                PackedRegistryEntry,
+                PackedRegistryTable, //
+            },
             MsgFunction, //
         },
     },
@@ -65,38 +69,62 @@ struct RegistryEntry {
 }
 
 /// The `SetRegistry` command.
+///
+/// Registry entries are built dynamically at runtime based on the current
+/// configuration (e.g. whether vGPU is enabled).
 pub(crate) struct SetRegistry {
-    entries: [RegistryEntry; Self::NUM_ENTRIES],
+    entries: KVec<RegistryEntry>,
 }
 
 impl SetRegistry {
-    // For now we hard-code the registry entries. Future work will allow others to
-    // be added as module parameters.
-    const NUM_ENTRIES: usize = 3;
-
-    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new() -> Self {
-        Self {
-            entries: [
-                // RMSecBusResetEnable - enables PCI secondary bus reset
-                RegistryEntry {
-                    key: "RMSecBusResetEnable",
-                    value: 1,
-                },
-                // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
-                // any PCI reset.
-                RegistryEntry {
-                    key: "RMForcePcieConfigSave",
-                    value: 1,
-                },
-                // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
-                // in the internal product name database.
+    /// Creates a new `SetRegistry` command.
+    ///
+    /// The base set of registry entries is always included. Additional entries
+    /// are appended dynamically based on runtime conditions (e.g. vGPU).
+    pub(crate) fn new(vgpu_requested: bool) -> Result<Self> {
+        let mut entries = KVec::new();
+
+        // RMSecBusResetEnable - enables PCI secondary bus reset
+        entries.push(
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
+        // any PCI reset.
+        entries.push(
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
+        // in the internal product name database.
+        entries.push(
+            RegistryEntry {
+                key: "RMDevidCheckIgnore",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMSetSriovMode - required when vGPU is enabled.
+        if vgpu_requested {
+            entries.push(
                 RegistryEntry {
-                    key: "RMDevidCheckIgnore",
+                    key: "RMSetSriovMode",
                     value: 1,
                 },
-            ],
+                GFP_KERNEL,
+            )?;
         }
+
+        Ok(Self { entries })
     }
 }
 
@@ -107,28 +135,31 @@ impl CommandToGsp for SetRegistry {
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(Self::NUM_ENTRIES as u32, self.variable_payload_len() as u32)
+        PackedRegistryTable::init(
+            self.entries.len() as u32,
+            self.variable_payload_len() as u32,
+        )
     }
 
     fn variable_payload_len(&self) -> usize {
         let mut key_size = 0;
-        for i in 0..Self::NUM_ENTRIES {
-            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        for entry in self.entries.iter() {
+            key_size += entry.key.len() + 1; // +1 for NULL terminator
         }
-        Self::NUM_ENTRIES * size_of::<fw::commands::PackedRegistryEntry>() + key_size
+        self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>() + key_size
     }
 
     fn init_variable_payload(
         &self,
         dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
     ) -> Result {
-        let string_data_start_offset = size_of::<Self::Command>()
-            + Self::NUM_ENTRIES * size_of::<fw::commands::PackedRegistryEntry>();
+        let string_data_start_offset = size_of::<PackedRegistryTable>()
+            + self.entries.len() * size_of::<PackedRegistryEntry>();
 
         // Array for string data.
         let mut string_data = KVec::new();
 
-        for entry in self.entries.iter().take(Self::NUM_ENTRIES) {
+        for entry in self.entries.iter() {
             dst.write_all(
                 fw::commands::PackedRegistryEntry::new(
                     (string_data_start_offset + string_data.len()) as u32,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4db0cfa4dc4d..14424a2c2d83 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -299,6 +299,7 @@ pub(crate) enum MsgFunction {
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
     PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
     RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
+    GpuacctPerfmonUtilSamples = bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES,
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
@@ -348,6 +349,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
             bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
             bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
+            bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES => {
+                Ok(MsgFunction::GpuacctPerfmonUtilSamples)
+            }
             bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
             _ => Err(EINVAL),
         }
-- 
2.51.0

