Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025563E3D80
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372441; cv=fail; b=ExUjlgFKrmhwd6erHki/iIkNicCrXEeDjhY2lqlZp0+gG3E9rfTKUIGht/D805A1h5PHHEhnM5ZGrWKF4PXzD11zUvCNuaWigRZ+7rvjfQZj2JDLzW/YXYeE1t1DXIOAu11URKPna2eDOML1v+EjFnXmF+4VHwNx+POuTTwnUtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372441; c=relaxed/simple;
	bh=XARDWyeyXLIDO/SIfo3KM73SsJtaRCyDx0rSeSl97FU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgabKqP2sPEzOiVMO6rkH4ypMi+5Isq7fMbGnNvkalTIvVIj4MiKsQLJSX3TyyQdWSSYg2qOEwMVqsiokTfIfYCZQh3NDJdDA7bJmwz1bwCayZSeuR1dFJgCnKFviI1BjDwmP9cQ4enbFmJXh8gA7NPAO94aO87n4h1WU84u6fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S6Nkha5O; arc=fail smtp.client-ip=40.107.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S6Nkha5O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zB/E5CkZtC//aPBnB4S6vRvLbimo68l7DaCYWsQGLs+H7KOnP2Fnpj46RIxGc3gOWxAt9aiyVYZd5LHp4zPD5rgLrfWP+tRJfovb3bNKrrLKxgAwOv+lro0IlLjZRb4o6LyyLmNyeIBIakdbQKkNy6KSSw+6Cs1cGR3I9vAIPi4lueBvRU6c9wKgOg0WE7FF2B6E2sJRyyekr3uRON6lOCkrRZKYCyjeUmG3FPgggBFcGyn9go44W2dhXDMx6x7mH80sOmajEELohh02dusxFNVZLaa0yLPv4D89JiQgaNE0/8QP14qusvrA99HZBnf5tAojKT/QHhvpAtUVTQDU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoB6QZ+5hsCPq5OxN5PUH3kZcm2aPrYLayxVw8JycCM=;
 b=omHilIRlkU4Wo19gSIBHYCH/ff+FoUCe6WawpOknXdIW7TSR5NBovII57hWOPfmq1jFzCwzkrPIiwhbGVY4D751fQr8EcmpzTVvSFTOInPc/VOc4KGGZa96LTXFtb3AdrhQm0HEXLi5IpFeCU1YSpkBCClsmAbAqVZaB/XaV7CcE47MBWztgVKN/kwegcJ/VEUYqET3lfDb3fZQycYWpckzovibE+W+ZRaHWmiVeWgjDngsugRWjK9yAKVaNPXmyCIqorEdJHgt2RqUtwOX/n0lrSOdnolXAXnwP3BM3z1GdMCFvrGMBVwHqpN7wXBDUQ39AdHR606Sy8ej1JT8yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoB6QZ+5hsCPq5OxN5PUH3kZcm2aPrYLayxVw8JycCM=;
 b=S6Nkha5OFVJ9Naq9L5e50zj7Jg2BDq0UawQsFTcXAltjM1orJ8CdaR2bNLWea6C0//RbdF9N44BJj457IHTgwABVAcLEZOceSDuB9LRw+oQeyhjqv1ZVHDX9tK/+uFcU3UdqUSQ7blZnsf45dMsxWaBfVEBOJMJVCSDHyw+eK/M0+db57+gxkl0Hb6uuBTCkKgzhrST9SGn25jkVrSa7y4Rspq2YqFiVvJZZvdgvgGUeZeFpCuG2NFw+BWVb9Suia2n09wpGqRTNzrnmNGkmGL8SXvrCX0fOsy2HatYrPD8kPvNu46GtGp2ID57ib/OvXgNcZjZvKILhToJ/0gUkXg==
Received: from CH0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::20)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:53:47 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::5c) by CH0P223CA0010.outlook.office365.com
 (2603:10b6:610:116::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:53:47 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:53:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:53:29 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:53:21 -0700
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
Subject: [PATCH v2 30/32] gpu: nova-core: vgpu: scrub guest VRAM with CeUtils
Date: Mon, 14 Sep 2026 10:49:05 +0300
Message-ID: <20260914074907.1399629-31-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 2762ea86-18e9-49f6-dcff-08df12354f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|6133799003|22082099003|18002099003|3023799007|11063799006|5023799004|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	obpTU3dhnFj7bFMa5ufLl6LBA1KGt084LeI/Fl+kAmqVCzsvVwNqvWi40+VQ8jrZ9A3320FsbQEp7aa1cxwhQM9UCZ+1n5rv9n0jXG9lHkfaR7iM+M/e6c+MD8uPiTBG/F/2sf5rWzQ/aPyGNkHEHnivo1YZYZkksUWt5VyYq9Q6QT75FBIK8iKRb0ef+MdWsJK+gCsyF+Xksy8ReY9T72cf9faGlLW0dtUq8hde3pk8xisPh3cLh6Ac2TPD/cy1rq9j2dbBMcVKzFk+EC6c2J37LI4ymIN1qmhzN9+DleZWADPJtWBfzyhrWd6C9gezwHi//Tz5OmMBRVaIuCbG60rua9Ezx+cBUUwnkl4PTmYBd7Wah/hREQza6yvGxbhEwv8LJXrV9JmIqon8WZTUMO17VC26hKWJXZmMkme0VXNcTLUEhYSXJmxaz0U8B9q2k5eNgEYnNz3p0O8YeeJjZyoWvsdXkbFIHMIkgwVKGkGxSE+07Lv0oee7+GFOWtbTTPO6MjPkr0t6aFqqLLvyG+IBFryorcKSTh8K6GEFTm9uUy6Z0A2gSu9z+IoQE/gjPaBygnFVybm/dZoBS5k9ItYX9/ZO+TAORbMu2Ur0UNTRTrjujvu2ElaDclyBTv9GXxPUVDxUuo8eT9uRRwEMXS4E+8af8PTlXxxaHH7o4js/HChj9SEUf3ZFvkQ33+RxMUq1x8mNtJieXSzZqYoWxg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wMyoim5Gi+9L2nz1SflxWhueOElEywDl89w/FSO1dud6khhfahgSTcrM3CIARiR5XjRP0bfXDfAtiFmbc950/dwMM9N2OL/7oMye+S44KkMh987sdyfBqsdS4u5ObfsIQrBAqp2XPcdrA2UFppBA0qvt7y47mVW8Z2awrukiflV8oGemSVjTS6HtP5u7cBGdnYMFQjPjmyytUrZSCq+E72fjVuLPAWPwSnA67LcZeJgsfqPrWNb4r4A5V32cx3H8SzztD72eKaQRfHHZ3vjURi+KVKvwu4bMPyfRBS4HteQWeHM3W6IwKfKzdcDME3Iku2V35Nocyvp9cQq1Dhq++X/goQYGetQvgxhmuOOU9LUsPZPJfP2pnlr4z2U2eYdFKXHXKgnD6q6uUCQnE+TkAe4tP9cnXBnyDEsviicC3KAzO1jyAckDydbrxKAUrldC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:53:47.6626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2762ea86-18e9-49f6-dcff-08df12354f02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618

Guest VRAM can retain guest data when an instance is reused.
Add a per-instance Copy Engine utility, CeUtils, that asks GSP-RM to
scrub guest VRAM and verifies completion through a hardware
semaphore page.

The vGPU manager scrubs guest VRAM immediately after allocating it and
after shutting an instance down, before returning it to the allocator.
Reserve the last channel ID in each instance range for CeUtils and report
the remaining channel count to the plugin.

Keep failed initialization in the instance registry while firmware
ownership or scrub completion is uncertain.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  |   1 +
 drivers/gpu/nova-core/vgpu.rs                 |   1 +
 drivers/gpu/nova-core/vgpu/commands.rs        | 142 ++++++++++++++-
 drivers/gpu/nova-core/vgpu/fw.rs              |  11 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |  48 ++++++
 drivers/gpu/nova-core/vgpu/instance.rs        |  61 ++++++-
 drivers/gpu/nova-core/vgpu/scrubber.rs        | 162 ++++++++++++++++++
 7 files changed, 416 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/nova-core/vgpu/scrubber.rs

diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 3cc718bb2ab8..333256ea8a04 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -851,6 +851,7 @@ fn default() -> Self {
         }
     }
 }
+pub const NV_ADDR_FBMEM: u32 = 2;
 pub const GSP_PLUGIN_BOOTLOADED: u32 = 1315261039;
 pub const VGPU_CPU_GSP_CTRL_BUFF_VERSION: u32 = 2;
 pub const VGPU_CPU_GSP_CTRL_BUFF_REGION_SIZE: u32 = 4096;
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 221a2804f5da..407accc05139 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -28,6 +28,7 @@
 mod gsp_plugin_rpc;
 mod hal;
 mod instance;
+mod scrubber;
 mod vram;
 
 /// vGPU state detected during GPU construction.
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index 7bfde85ad35a..63b6f0e3d862 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -8,6 +8,7 @@
 
 use kernel::{
     device,
+    num::casts::usize_into_u32,
     prelude::*,
     time::Delta,
     transmute::AsBytes, //
@@ -22,7 +23,10 @@
     },
 };
 
-use crate::driver::Bar0;
+use crate::{
+    driver::Bar0,
+    mm::PAGE_SIZE, //
+};
 
 use super::{
     fw::RpcMessage,
@@ -48,6 +52,20 @@
     GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE, //
 };
 
+use super::fw::{
+    commands::{
+        AllocCeutilsRequest,
+        AllocCeutilsResponse,
+        FreeCeutilsRequest,
+        ScrubGuestFbRequest,
+        ScrubGuestFbResponse, //
+    },
+    GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS,
+    GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS,
+    GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB,
+    NV_ADDR_FBMEM, //
+};
+
 /// Query the vGPU type assigned to a VF by its DBDF.
 #[expect(dead_code)]
 pub(super) fn query_assigned_vf_type(cmdq: &Cmdq<'_>, dbdf: Dbdf) -> Result<u32> {
@@ -191,3 +209,125 @@ pub(super) fn set_plugin_bme(
     let bme = encode_plugin_set_bme(enable)?;
     rpc.rpc_call_nvkv(dev, bar0, gfid, RpcMessage::UpdateBmeState, &bme)
 }
+
+/// Whether a failed allocation may still have transferred CHID ownership to firmware.
+pub(super) enum CeUtilsAllocError {
+    /// A matching firmware response explicitly rejected the allocation.
+    NotOwned(Error),
+    /// The request may have completed despite a transport or response-validation error.
+    MayOwn(Error),
+}
+
+/// Allocate a CeUtils channel and validate its semaphore description.
+pub(super) fn alloc_ceutils(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+    chid: u32,
+) -> core::result::Result<u64, CeUtilsAllocError> {
+    let request = AllocCeutilsRequest {
+        gfid: gfid.0.to_le(),
+        fixed_chid: chid.to_le(),
+        force_ceid: u32::MAX.to_le(),
+        swizz_id: 0,
+    };
+
+    dev_dbg!(dev, "alloc CeUtils: gfid={} chid={}\n", gfid.0, chid,);
+
+    let response = cmdq
+        .send_gmc_and_receive(
+            GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS,
+            <AllocCeutilsRequest as IntoBytes>::as_bytes(&request),
+            usize_into_u32::<{ size_of::<AllocCeutilsResponse>() }>(),
+        )
+        .map_err(CeUtilsAllocError::MayOwn)?;
+    if response.status != 0 {
+        return Err(CeUtilsAllocError::NotOwned(EIO));
+    }
+
+    (|| {
+        let bytes = response
+            .payload
+            .get(..size_of::<AllocCeutilsResponse>())
+            .ok_or(EMSGSIZE)?;
+        let response = AllocCeutilsResponse::read_from_bytes(bytes).map_err(|_| EINVAL)?;
+        let semaphore_address = u64::from_le(response.semaphore_address);
+        let semaphore_aperture = u32::from_le(response.semaphore_aperture);
+        let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
+
+        if semaphore_address == 0
+            || !semaphore_address.is_multiple_of(page_size)
+            || semaphore_aperture != NV_ADDR_FBMEM
+        {
+            return Err(EINVAL);
+        }
+
+        dev_dbg!(
+            dev,
+            "alloc CeUtils: gfid={} semaphore={:#x}\n",
+            gfid.0,
+            semaphore_address,
+        );
+        Ok(semaphore_address)
+    })()
+    .map_err(CeUtilsAllocError::MayOwn)
+}
+
+/// Release a CeUtils allocation, including one whose allocation reply was lost.
+pub(super) fn free_ceutils(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    let request = FreeCeutilsRequest {
+        gfid: gfid.0.to_le(),
+    };
+
+    dev_dbg!(dev, "free CeUtils: gfid={}\n", gfid.0);
+    cmdq.send_gmc_and_check_status(
+        GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS,
+        <FreeCeutilsRequest as IntoBytes>::as_bytes(&request),
+    )
+}
+
+/// Submit an asynchronous guest FB scrub and return its work identifier.
+pub(super) fn submit_ceutils_scrub(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+    fb_offset: u64,
+    fb_size: u64,
+) -> Result<u32> {
+    let request = ScrubGuestFbRequest {
+        gfid: gfid.0.to_le(),
+        reserved: 0,
+        fb_offset: fb_offset.to_le(),
+        fb_size: fb_size.to_le(),
+    };
+
+    dev_dbg!(
+        dev,
+        "submit scrub: gfid={} offset={:#x} size={:#x}\n",
+        gfid.0,
+        fb_offset,
+        fb_size,
+    );
+
+    let response = cmdq.send_gmc_and_receive(
+        GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB,
+        <ScrubGuestFbRequest as IntoBytes>::as_bytes(&request),
+        usize_into_u32::<{ size_of::<ScrubGuestFbResponse>() }>(),
+    )?;
+    if response.status != 0 {
+        return Err(EIO);
+    }
+
+    let bytes = response
+        .payload
+        .get(..size_of::<ScrubGuestFbResponse>())
+        .ok_or(EMSGSIZE)?;
+    let response = ScrubGuestFbResponse::read_from_bytes(bytes).map_err(|_| EINVAL)?;
+    let work_id = u32::try_from(u64::from_le(response.work_id)).map_err(|_| EOVERFLOW)?;
+
+    Ok(work_id)
+}
diff --git a/drivers/gpu/nova-core/vgpu/fw.rs b/drivers/gpu/nova-core/vgpu/fw.rs
index 6cec92c9b505..795ce4855586 100644
--- a/drivers/gpu/nova-core/vgpu/fw.rs
+++ b/drivers/gpu/nova-core/vgpu/fw.rs
@@ -27,6 +27,8 @@
     VGPU_CPU_GSP_VGPU_TASK_LOG_BUFF_REGION_SIZE, //
 };
 
+pub(super) use bindings::NV_ADDR_FBMEM;
+
 pub(super) use commands::RpcMessage;
 
 pub(super) const GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: u32 =
@@ -47,6 +49,15 @@
 pub(super) const GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: u32 =
     bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES;
 
+pub(super) const GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS;
+
+pub(super) const GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS;
+
+pub(super) const GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB: u32 =
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB;
+
 /// State observed in the response buffer for an expected RPC sequence.
 pub(super) enum RpcResponse {
     Pending {
diff --git a/drivers/gpu/nova-core/vgpu/fw/commands.rs b/drivers/gpu/nova-core/vgpu/fw/commands.rs
index 7030479441e8..aabbf0987daa 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -407,3 +407,51 @@ pub(in crate::vgpu) fn encode_plugin_set_bme(enable: bool) -> Result<EncodedStre
     request.encode(&mut encoder)?;
     Ok(encoder.finish())
 }
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(in crate::vgpu) struct AllocCeutilsRequest {
+    pub(in crate::vgpu) gfid: u32,
+    pub(in crate::vgpu) fixed_chid: u32,
+    pub(in crate::vgpu) force_ceid: u32,
+    pub(in crate::vgpu) swizz_id: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsRequest>() == 16);
+
+#[repr(C)]
+#[derive(FromBytes)]
+pub(in crate::vgpu) struct AllocCeutilsResponse {
+    pub(in crate::vgpu) semaphore_address: u64,
+    pub(in crate::vgpu) semaphore_aperture: u32,
+    _reserved: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsResponse>() == 16);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(in crate::vgpu) struct FreeCeutilsRequest {
+    pub(in crate::vgpu) gfid: u32,
+}
+
+static_assert!(size_of::<FreeCeutilsRequest>() == 4);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(in crate::vgpu) struct ScrubGuestFbRequest {
+    pub(in crate::vgpu) gfid: u32,
+    pub(in crate::vgpu) reserved: u32,
+    pub(in crate::vgpu) fb_offset: u64,
+    pub(in crate::vgpu) fb_size: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbRequest>() == 24);
+
+#[repr(C)]
+#[derive(FromBytes)]
+pub(in crate::vgpu) struct ScrubGuestFbResponse {
+    pub(in crate::vgpu) work_id: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbResponse>() == 8);
diff --git a/drivers/gpu/nova-core/vgpu/instance.rs b/drivers/gpu/nova-core/vgpu/instance.rs
index 5d71de0ad108..bb01d4088b5e 100644
--- a/drivers/gpu/nova-core/vgpu/instance.rs
+++ b/drivers/gpu/nova-core/vgpu/instance.rs
@@ -33,6 +33,7 @@
 use super::{
     gsp_plugin_comm::CommBufferRegion,
     gsp_plugin_rpc::PluginRpc,
+    scrubber::CeUtils,
     vram::{
         VgpuVramLayout,
         VgpuVramSlot,
@@ -42,6 +43,7 @@
 };
 
 use super::commands::{
+    free_ceutils,
     negotiate_plugin_version,
     query_vgpu_properties,
     send_bootload,
@@ -49,6 +51,7 @@
     send_plugin_config,
     send_shutdown,
     set_plugin_bme,
+    CeUtilsAllocError,
     Dbdf,
     VgpuProperties, //
 };
@@ -142,6 +145,8 @@ pub(super) struct VgpuInstance<'gpu> {
     num_plugin_channels: u32,
     vram_slot: VgpuVramSlot,
     pub(super) plugin_rpc: PluginRpc<'gpu, 'gpu>,
+    ceutils: Option<CeUtils>,
+    initialized: bool,
     needs_teardown: bool,
 }
 
@@ -204,7 +209,7 @@ fn configure_plugin(&mut self, dev: &device::Device<device::Bound>, bar0: Bar0<'
             self.dbdf,
             self.vgpu_type.vgpu_type_id(),
             self.vm_pid,
-            u32::try_from(self.chids.len()).map_err(|_| EOVERFLOW)?,
+            u32::try_from(self.chids.len().checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?,
             self.num_plugin_channels,
         )?;
 
@@ -291,9 +296,11 @@ fn release_instance(&mut self, instance: VgpuInstance<'gpu>, mm: &mut GpuMm<'_>)
         result
     }
 
-    /// Allocate resources and register a new inactive vGPU instance.
+    /// Allocate resources, scrub the framebuffer and register an inactive instance.
     pub(super) fn allocate_instance(
         &mut self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
         bar_user: &'gpu BarUser<'gpu>,
         mm: &mut GpuMm<'_>,
         vgpu: &VgpuManager<'gpu>,
@@ -331,12 +338,14 @@ pub(super) fn allocate_instance(
         let num_chid = vgpu
             .total_channels()
             .checked_div(vgpu_type.max_instance)
-            .filter(|count| *count != 0)
+            .filter(|count| *count > 1)
             .ok_or(EINVAL)?;
         let chids = vgpu.chid_pool.reserve_ids(
             NonZeroUsize::new(usize::try_from(num_chid).map_err(|_| EOVERFLOW)?).ok_or(EINVAL)?,
             Alignment::SZ_1,
         )?;
+        let ceutils_chid =
+            u32::try_from(chids.end.checked_sub(1).ok_or(EINVAL)?).map_err(|_| EOVERFLOW)?;
         let layout = VgpuVramLayout {
             type_id: vgpu_type.vgpu_type_id,
             max_slots: vgpu_type.max_instance,
@@ -362,15 +371,39 @@ pub(super) fn allocate_instance(
             num_plugin_channels: 3,
             vram_slot,
             plugin_rpc: PluginRpc::new(comm),
+            ceutils: None,
+            initialized: false,
             needs_teardown: false,
         };
-        match self.instances.push_within_capacity(instance) {
-            Ok(()) => Ok(gfid),
+        // Register ownership before firmware work so an uncertain result leaves
+        // the reservations reachable and unavailable to another instance.
+        let index = self.instances.len();
+        if let Err(error) = self.instances.push_within_capacity(instance) {
+            self.release_instance(error.0, mm)?;
+            return Err(EIO);
+        }
+
+        let ceutils = match CeUtils::allocate(dev, cmdq, gfid, ceutils_chid) {
+            Ok(ceutils) => ceutils,
             Err(error) => {
-                self.release_instance(error.0, mm)?;
-                Err(EIO)
+                let error = match error {
+                    CeUtilsAllocError::NotOwned(error) => error,
+                    CeUtilsAllocError::MayOwn(error) => {
+                        dev_err!(dev, "CeUtils allocation failed: {:?}\n", error);
+                        return Err(error);
+                    }
+                };
+                let instance = self.instances.remove(index).map_err(|_| EIO)?;
+                self.release_instance(instance, mm)?;
+                return Err(error);
             }
-        }
+        };
+        let instance = self.instances.get_mut(index).ok_or(EIO)?;
+        let result = ceutils.scrub_guest_fb(dev, cmdq, bar_user, mm, &instance.vram_slot.fbmem);
+        instance.ceutils = Some(ceutils);
+        result?;
+        instance.initialized = true;
+        Ok(gfid)
     }
 
     /// Boot and configure the GSP plugin for a registered instance.
@@ -387,6 +420,9 @@ pub(super) fn activate_instance(
             .iter_mut()
             .find(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
+        if !instance.initialized {
+            return Err(EINVAL);
+        }
         instance.bootload(dev, cmdq, fifo_engine_list)?;
 
         instance.plugin_rpc.init_rpc()?;
@@ -400,6 +436,7 @@ pub(super) fn destroy_instance(
         &mut self,
         dev: &device::Device<device::Bound>,
         cmdq: &Cmdq<'_>,
+        bar_user: &BarUser<'_>,
         mm: &mut GpuMm<'_>,
         gfid: Gfid,
     ) -> Result {
@@ -408,8 +445,14 @@ pub(super) fn destroy_instance(
             .iter()
             .position(|instance| instance.gfid == gfid)
             .ok_or(ENOENT)?;
-        let instance = &mut self.instances[index];
+        let instance = self.instances.get_mut(index).ok_or(EIO)?;
+        instance.initialized = false;
         instance.shutdown(dev, cmdq)?;
+        if let Some(ceutils) = instance.ceutils.as_ref() {
+            ceutils.scrub_guest_fb(dev, cmdq, bar_user, mm, &instance.vram_slot.fbmem)?;
+        }
+        instance.ceutils = None;
+        free_ceutils(dev, cmdq, gfid)?;
         if instance.needs_teardown {
             send_cleanup(dev, cmdq, gfid)?;
         }
diff --git a/drivers/gpu/nova-core/vgpu/scrubber.rs b/drivers/gpu/nova-core/vgpu/scrubber.rs
new file mode 100644
index 000000000000..72c76fd6bbd5
--- /dev/null
+++ b/drivers/gpu/nova-core/vgpu/scrubber.rs
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Per-VM CeUtils guest framebuffer scrubbing.
+
+use kernel::{
+    device,
+    prelude::*,
+    time::{
+        delay::fsleep,
+        Delta,
+        Instant,
+        Monotonic, //
+    },
+};
+
+use crate::{
+    gsp::cmdq::Cmdq,
+    mm::{
+        bar_user::BarUser,
+        vram::VramRegion,
+        GpuMm,
+        Pfn,
+        VramAddress, //
+    },
+    vgpu::instance::Gfid, //
+};
+
+use super::commands::{
+    self,
+    CeUtilsAllocError, //
+};
+
+// Semaphore layout from OpenRM `channel_utils.h`.
+const NV_CEUTILS_SEMA_PAGE_MAGIC: u32 = 0xce5e_5ea0;
+
+#[repr(C)]
+struct CeUtilsSemaphoreHeader {
+    magic: u32,
+    payload: u32,
+}
+
+static_assert!(size_of::<CeUtilsSemaphoreHeader>() == 8);
+
+const SEMA_PAGE_MAGIC_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, magic);
+const SEMA_PAGE_PAYLOAD_OFFSET: usize = core::mem::offset_of!(CeUtilsSemaphoreHeader, payload);
+
+const SCRUB_REQUEST_SIZE: u64 = 4 * 1024 * 1024 * 1024;
+
+// Host timeout policy; not a firmware ABI value.
+const SCRUB_TIMEOUT: Delta = Delta::from_secs(5);
+
+/// A firmware-owned per-VM CeUtils allocation.
+///
+/// Submitted scrubs must complete before releasing this allocation or its framebuffer.
+pub(super) struct CeUtils {
+    gfid: Gfid,
+    semaphore_address: u64,
+}
+
+impl CeUtils {
+    pub(super) fn allocate(
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        gfid: Gfid,
+        chid: u32,
+    ) -> core::result::Result<Self, CeUtilsAllocError> {
+        let semaphore_address = commands::alloc_ceutils(dev, cmdq, gfid, chid)?;
+        Ok(Self {
+            gfid,
+            semaphore_address,
+        })
+    }
+
+    /// Scrub the complete guest framebuffer and wait for semaphore completion.
+    pub(super) fn scrub_guest_fb(
+        &self,
+        dev: &device::Device<device::Bound>,
+        cmdq: &Cmdq<'_>,
+        bar_user: &BarUser<'_>,
+        mm: &mut GpuMm<'_>,
+        fb: &VramRegion,
+    ) -> Result {
+        let mut offset = fb.address();
+        let end = offset.checked_add(fb.size()).ok_or(EOVERFLOW)?;
+        while offset < end {
+            let size = core::cmp::min(SCRUB_REQUEST_SIZE, end - offset);
+            let work_id = commands::submit_ceutils_scrub(dev, cmdq, self.gfid, offset, size)?;
+            wait_scrub_complete(bar_user, mm, dev, self.semaphore_address, work_id)?;
+            offset = offset.checked_add(size).ok_or(EOVERFLOW)?;
+        }
+
+        Ok(())
+    }
+}
+
+/// Poll the GSP-owned CeUtils semaphore page through a temporary BAR1 map.
+fn wait_scrub_complete(
+    bar_user: &BarUser<'_>,
+    mm: &mut GpuMm<'_>,
+    dev: &device::Device<device::Bound>,
+    semaphore_address: u64,
+    work_id: u32,
+) -> Result {
+    let pfn = Pfn::from(VramAddress::from_raw(semaphore_address));
+    let semaphore_map = bar_user.map(mm, &[pfn], false)?;
+
+    let result = (|| {
+        let magic = semaphore_map.try_read32(SEMA_PAGE_MAGIC_OFFSET)?;
+        if magic != NV_CEUTILS_SEMA_PAGE_MAGIC {
+            dev_warn!(
+                dev,
+                "bad CeUtils semaphore magic {:#x}, expected {:#x}\n",
+                magic,
+                NV_CEUTILS_SEMA_PAGE_MAGIC,
+            );
+            return Err(EIO);
+        }
+
+        let start = Instant::<Monotonic>::now();
+        loop {
+            let value = semaphore_map.try_read32(SEMA_PAGE_PAYLOAD_OFFSET)?;
+            if value.wrapping_sub(work_id) < 0x8000_0000 {
+                dev_dbg!(
+                    dev,
+                    "scrub completed after {:?}: semaphore={:#x}, target={:#x}\n",
+                    start.elapsed(),
+                    value,
+                    work_id,
+                );
+                return Ok(());
+            }
+
+            if start.elapsed() >= SCRUB_TIMEOUT {
+                dev_warn!(
+                    dev,
+                    "scrub timed out: semaphore={:#x}, target={:#x}\n",
+                    value,
+                    work_id,
+                );
+                return Err(ETIMEDOUT);
+            }
+            fsleep(Delta::from_millis(1));
+        }
+    })();
+
+    let cleanup = semaphore_map.release(mm);
+    match result {
+        Ok(()) => cleanup,
+        Err(error) => {
+            if let Err(cleanup_error) = cleanup {
+                dev_err!(
+                    dev,
+                    "failed to release semaphore BAR1 mapping after error {:?}: {:?}\n",
+                    error,
+                    cleanup_error,
+                );
+            }
+            Err(error)
+        }
+    }
+}
