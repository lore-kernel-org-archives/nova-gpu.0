Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7476E30DEA6
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113821; cv=fail; b=qz3MsbP6TneFTYm9WFWFGrHUgo7kXJvwCAKt7U1SMBFtFqVx93fkhI/fycRfWuOmqJxcNsWEhqVhfpb+fCIjb0YunEUhCcHAnxYOHd18KFb9fiiMQy5AifJwVyIFwACVqrLr/5B9PlUhXaxCqqBBr1BATO1mJtQleYqb8Q5BxPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113821; c=relaxed/simple;
	bh=/szIzluei1D3K42z7NahtYKRyNxrJc6LCTYAASxcDXk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQ/AKZMpTrRYqt0ySvKtO6wsdHaT08/7t88QG8ILtl9m7U5haFsAgS8RomigSAs6gM4WPXUnRyWO8wOtiAnte5nVk/2Q60lmgmL89HRQKZzmcbT8XK13vMOVu4XOZy623uS+lRleiMENlJmo4JoASYp1CxXxrrdaNyNlJfDra68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jh/0ytSR; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jh/0ytSR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBdt1AhLodLVHXv2kFMjNGdE8LFAgEayXcVJ+5vAt6tu5wXkYxCtYD1r2b6/XK31FZNKQ5AOap1SLYECC9f9lOVsTJkXlIbAE9mLqoJz4qUOyPgsbKQyDZQO3W+VBz9DXtOtoxNvLYJYYnui5/DBNZ/I0a3mxgupXwWlTae3wNB7XX3YpniSDj/3yrpqw40xldwaVpTi9qT1kGQXB1g4+cYSncNizFcf/XHorA6gCSWMHRcINxw99vqZhp6NYQdt1GIYXiLPJrXaSnAvyyfZ9Gd9xIxQ54cj0897CgqUxw5ECVmFbbBuxDITHvZ7FBinM5zIxqy8aAjONYSpBRc/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFgBfBRvkXWJRmrC0adiXRSvPMYJtfQNtuzS8wT3aH0=;
 b=PhAmVuPOUkMT4hUMu0MwKgcA0CdTXhn9o/8kq8qlV4/yt+wGfAv8sEDxFz7wK9ZLa/mJNtbNqbKkhJVr4CA5ccU4t5l/6fnfZMrMv0JfgV207l3fWcdA3DBZyEmSQ2gUJlE/DBbhhYBEXqk2wGPRKds3FxOeTiu0qT4rhoHERuYZT5Y6a9zL+5D2XvYI6wOuWAoLQtfQEiktKRqYUXT8QIlGFyd9U6fPb13PBl+YXPMEnx2aKH6BM/oWa9py5BggeupFaagkDLA4LydUsP4FgPDUTJbUMO6BZX1AQcF59yBbfQU2G6h8l9urMmfZlH/6DPnEVk1JhIELjsvhFkVFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFgBfBRvkXWJRmrC0adiXRSvPMYJtfQNtuzS8wT3aH0=;
 b=jh/0ytSRdb8jfkHCtbgd/+Y57QUmNkbB4e3rQdla/KoyNfp5mZl1GoxsRciFDhoLm/r/JlMf3zBJTirpcBk95KU0Zk7efVx2NYfhXuz+AEMTFopeetYHzfn9tqmMjwmTIbXi/Q+9yw2/7valEIbmxh7JlVfwbRf96cF94L36dzm7IhEJjT30zs6jxoT5H0GNtNKINKOO1Grov458T4kJfqrdpfSw2CXFuEoSPsMM8dzvHghmuPfCqvGtN3B3zpzOJc99pykB1tuHca0Kw+K8OxImlFQf6l6KPB12gWrJJeEl3l86v3Jh++eje0D04eywUBQCPAw4J4o7NU88gugMWQ==
Received: from CH0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:610:b3::35)
 by SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 17:50:10 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::23) by CH0PR03CA0060.outlook.office365.com
 (2603:10b6:610:b3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 17:50:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:47 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:46 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 6/8] gpu: nova-core: transition gen_bootloader to TLV images
Date: Wed, 10 Jun 2026 12:49:27 -0500
Message-ID: <20260610174929.744477-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2e12e2-21a1-4fb9-bd3b-08dec718b707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	q3eFI82ECgEeGRNF7q+rPgptQGz02EK8nTkh9kAaZLK57iCy3DJCkjxsMgXVuozBT5Y2+d8tju+fAgIpRWyc/2n3fh3GJ+XVPUWTaWaDxrXZgUR5cI6ifoTtdhMcUwZMkyiErDrwkUduaI4ZEIwHkw5+ZWlWyG5ENEU8gkgPhyz0RO+LIWbZuTKuQF6nrhvcjdEpYTXID6mjjdYTnKtFzL58bVELN3CG9WvaqaWpfEih3JJTYoeiiku3N9cXMF5GC2x4UcXp338vuwKtMjjdvc97Oya6kQMXVPqPMW4kAK7HXn0fvHHivKa50IFlZ/SkLCdsRCeH1l9KPW3eDLEIffeKfxyVeAqQblh8ojyn4FTyTFDGHQ//JygWCDJV8xNzyBy54vBZ2z2HwDJFksj29wSmiB9Uwu2DaYhiANJ2MXljzyfodcWEfc4TxdqXeJpq89jg3R+2hcPlMkX+mJVFyx6ZV8NndMCIcgp342sILzRMzI3gneiU3px0HYBMHwakHST5ZJRRrR05NxjuGiRem8uAmmC/lTUlMskDpIIrYmY0rKD6KiZPj6iQTk7r9znh6rpRIYq2TIQuG4ylmidzrOQw3fUeteWHayZFYLHs3cmKzj+BJHFdbvVJT5aREy735jIy60RckgiHAdZyPwL2HqpQhQg/0lfA3UPmDuQYgQWDViUR9sPUJX4OXNOAhlW+F2P3YXSaAPiidBQVIHhB6/PEnSUyCVp8pK168r6eDZ4=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	48dO92acktwp08MScvj7p2uZk0u5vav/7LBgxL3TMW43P+SQCHtgC9WmvOZTBW+tLlcXjmkPqsiiJ+MKG8r8L50TtAGUIYAg4sdRzi8k+cyGIZE20/qj1NW+4wflC0A643DKB1mMtazdzixC79Q3J8epJ3S8E9fTnYe8nWPt/ynESLQnUZBZUaxUZvBNWqkA9RD/GKA7F3jXb1fz5tfkpIiwOHQ3EsG3G+6h6xGAMo5acDVvjuhWigFGsf8XM3/tUGV7Ju34SH1sF23SyrqO2M/sDkFg2HbVbyIQmERPG2O0Adb1m2nmXAuxnx4yVDzoiibMbuL3NED5DL1QlDUgc2H98HUDLjZOdt0rYGJ+01F+ecj+XU4T2Yw39d7M20b2R9lWprk9WgEaxXUS7dtdVVBKxFEBowfNgsJ0pxqn3Tpibtl5F/zJunlZalM14Jds
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:09.5522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e12e2-21a1-4fb9-bd3b-08dec718b707
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181

Switch the generic bootloader firmware loader from the legacy binary
format to the TLV format.  This change requires the new TLV versions
of the r570.144 firmware images.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs             | 22 ------
 .../nova-core/firmware/fwsec/bootloader.rs    | 72 +++++--------------
 2 files changed, 16 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 8ef7f084f834..fbc9e0cd0021 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -366,28 +366,6 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
     }
 }
 
-/// Header common to most firmware files.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct BinHdr {
-    /// Magic number, must be `0x10de`.
-    bin_magic: u32,
-    /// Version of the header.
-    bin_ver: u32,
-    /// Size in bytes of the binary (to be ignored).
-    bin_size: u32,
-    /// Offset of the start of the application-specific header.
-    header_offset: u32,
-    /// Offset of the start of the data payload.
-    data_offset: u32,
-    /// Size in bytes of the data payload.
-    data_size: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
-
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 039920dc340b..ef80ff19127e 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -23,10 +23,7 @@
         Alignment, //
     },
     sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    transmute::AsBytes,
 };
 
 use crate::{
@@ -46,38 +43,14 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        request_firmware,
-        BinHdr,
-        FIRMWARE_VERSION, //
+        request_tlv,
+        Tlv, //
     },
     gpu::Chipset,
     num::FromSafeCast,
     regs,
 };
 
-/// Descriptor used by RM to figure out the requirements of the boot loader.
-///
-/// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct BootloaderDesc {
-    /// Starting tag of bootloader.
-    start_tag: u32,
-    /// DMEM load offset - unused here as we always load at offset `0`.
-    _dmem_load_off: u32,
-    /// Offset of code section in the image. Unused as there is only one section in the bootloader
-    /// binary.
-    _code_off: u32,
-    /// Size of code section in the image.
-    code_size: u32,
-    /// Offset of data section in the image. Unused as we build the data section ourselves.
-    _data_off: u32,
-    /// Size of data section in the image. Unused as we build the data section ourselves.
-    _data_size: u32,
-}
-// SAFETY: any byte sequence is valid for this struct.
-unsafe impl FromBytes for BootloaderDesc {}
-
 /// Structure used by the boot-loader to load the rest of the code.
 ///
 /// This has to be filled by the GPU driver and copied into DMEM at offset
@@ -150,38 +123,23 @@ pub(crate) fn new(
         dev: &Device<device::Bound>,
         chipset: Chipset,
     ) -> Result<Self> {
-        let fw = request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?;
-        let hdr = fw
-            .data()
-            .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
-            .ok_or(EINVAL)?;
-
-        let desc = {
-            let desc_offset = usize::from_safe_cast(hdr.header_offset);
-
-            fw.data()
-                .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
-                .ok_or(EINVAL)?
-                .0
-        };
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_info!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string("VERS")?
+        );
 
         let ucode = {
-            let ucode_start = usize::from_safe_cast(hdr.data_offset);
-            let code_size = usize::from_safe_cast(desc.code_size);
-            // Align to falcon block size (256 bytes).
+            let blob = tlv.get_bytes("BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32("CDSZ")?);
             let aligned_code_size = code_size
                 .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
                 .ok_or(EINVAL)?;
 
             let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(
-                fw.data()
-                    .get(ucode_start..ucode_start + code_size)
-                    .ok_or(EINVAL)?,
-                GFP_KERNEL,
-            )?;
+            ucode.extend_from_slice(blob.get(..code_size).ok_or(EINVAL)?, GFP_KERNEL)?;
             ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
 
             ucode
@@ -262,13 +220,15 @@ pub(crate) fn new(
             .checked_sub(ucode.len())
             .ok_or(EOVERFLOW)?;
 
+        let start_tag = u16::try_from(tlv.get_u32("STRT")?)?;
+
         Ok(Self {
             _firmware_dma: firmware_dma,
             ucode,
             dmem_desc,
             brom_params: firmware.brom_params(),
             imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag: u16::try_from(desc.start_tag)?,
+            start_tag,
         })
     }
 
-- 
2.54.0

