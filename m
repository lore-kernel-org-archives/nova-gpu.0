Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6049B457
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591598; cv=fail; b=NFtu3TtqsrbOmKs0DX1Ujk4wI+BsyCUWjcu0wfmgQPrfsmX+03TMxdLa2QSo+2yRqQBTCmvtrZzRN7cH0y1xLEBNUrU+szHSClOq/lwg/Ea5VvK2sSYCK+rA++Y9htFQqoJ3/XEnnmd6uSvhBF6cvFliB/sCs/KEBooq8XHmLuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591598; c=relaxed/simple;
	bh=zw3zJ6Z67xCL1TERV2zgd2xCPaefoDYtIyWFfwQKPD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tR0rL18RuMJ+nx6a1xY4cOPU3M/HhVW1RQd/mdBRlthCt3ENlIO+tf65mDmylfxUGWUmIKt6bED8EgXoruJfXxPKFhtvlCdXS248Lc1AnpjEU+xgZbK/+2Hd5qfc26EoR8vnOx8E0Q4o5AiSqKFLxSkGdc0Dev8zSOwaiALHBbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RsV6mbII; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RsV6mbII"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at2z1W8x9unbfwjsXl8Z/hf5iC03FqT98QO4EBkdgk6sXit17hBrJ3N0vltdf3M8f+bp/hslaa9L4CXpiTRDzjWfYdYrjGuS9uoexNVDYtJZGHuMDXxN44mU+7LqMrGFwePsoIpXHa9+ACnFncaE5ubB43j1CxkXBI9HqrlVQ+ffGviJ6FhldI8lnZkj0AG17MMwZNMYPfHTYys9jwyCeaOYmb3YOPtHEbW2weyOVdn/nOeMIIXMvxTp4ODHgSoPs6Cb4uJ+V6o7Ejk3NW2viTECYeo+je2htNMrGaOVDIL7onvt9kNTF82HR9zv0PV1s4t23bgZXij6PzXcI2aN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/wAgIFw8yzjYX6sFF6nX8t4M96vBgO6gIFA3PpOCg0=;
 b=E3ZUYX9mXQbfOB9+JdBmJtpcIxn4HG9a7duhvnlgWAIwNUN623+uPMZE8u+M+WBlM8Eohc4PZQvghSdmpP0HF5iypS9feWYJqyPbpkjN4cC/OpFpCGFE/1PfLkwknZuMASH0TJFam3oBvKW8YEr1iYlalDVw0aQ54dOJrKerH+42ed0cmopzglhQkcSaElLy0j4uSh4FK9tAla38JQxX5RFiicAH0K2+/JbeWtmapgFQ0EE0zM2WcNwy/6CykiQAF2Flf0sSzl+Som81Hb2kK6qwNkwIrdSVQM8R+hubkAZDFN65Iem8zF82a7vzTcNFjs6KedCBJMWa+/V3YbXotw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/wAgIFw8yzjYX6sFF6nX8t4M96vBgO6gIFA3PpOCg0=;
 b=RsV6mbIItoo/dzTwYKQFPERGAlWC3Sy9w2RyRpEZD1+ATcO6zSRPVbtB26UZgNPpoBXH5MUxGFMH9PVLbNRW7PTvA3okZLrmcClRh+oM04BTIHRvn+YxiQ6/L54Xa8H+zV3l1/E5JH1d7cooZpahNfVsskdEstiB5IQKvEJdp7kbxfi1oEcUuL8knFqOZNUyD69j8DwAbr+qqTAnCA2e9urDpfqBciKvdkacSjPcIZWZbdxSnmpqqcrAswEyrv2tMdvbLVGHBRNzrE+YZSSWRsM2EO+rq4H6XfLLi7/fYwVKxyo0fQtMgKSqUEIvtm+czCcmW/tZNVLbY+vqubTgwQ==
Received: from BN0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:141::13)
 by DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:33:08 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::4b) by BN0PR07CA0030.outlook.office365.com
 (2603:10b6:408:141::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:33:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:33:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:32:50 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:32:42 -0700
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
Subject: [PATCH v3 28/31] gpu: nova-core: vgpu: add CeUtils commands
Date: Mon, 28 Sep 2026 13:28:31 +0300
Message-ID: <6fbf38e3622a135c662443155513976898b1ab68.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DSSPR12MB999212:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b09eed-ce9c-41e5-474e-08df1d4be344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|10067099003|11063799006|260925021911599003|260925022911599003|260925021311599003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6/eCe0jZXYCrx2Swtvdu2WINH7hOIBU5YlAxcLaDgA/3mhiHKdv5MuzzDOyn33hcMVcqWVkSTpTF/1HKhP8gH0H02zIRn+A/G1+dKzjLfZF2kYuXvgxjjXOnr9uGGtYSWg1SIf8kecL8K0RqABY0RxDx+KcD7BMN9Iyz3yUwqYp4pcuqj3xl+slqw1GMWyzWzCAWYSfzrJ/JfqWyx0j/4xX9u9x+yHPhjzFn1KBQbCrSeX15Wszk9k4ODQqfDFsEEu16649Ko3dLjwcs7uQPZZG6s8N0kknoHZI4d1Ckv2lwm+NzsM9T4bNC1EW8/R2hl2eJssLOPuh7aNS7FctjAFLs0uE7NboaBxXDlcRYjuaqz8L8FJ1ZPtK99Kjh8dkRvhYur1SK6Q8nUutVLYJw+YoFBwvEPK9ZOgGAPzhAHIyl4LbLgIS/YnnxZ7kD2VMgez4bt7Euz7UNj9KYGbfXvrrfVWJdDJb/8SBflwvKgnTxYKrqXImiBDHaww37c9Ncg6mswcQl/uYqirXnIAsNxRghXu8kO5F0UjQclnjcgI98KN06BxP1S5rit7HrSJPOJrlAkslQsUJ1zXstU7xRABJA4Ca4qb3NPYb2j6icy5TBUzY1+zEaVSpU7ym9/VoVn/ebpRQzYBKypPncqXqG0FtLaFjc054M1DJmOlM3KtyKjMeKrEetDwEpSKip6dx8ngInxmUNPsbmM96odZ7wAA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FIiWc4QFuomVP7pcP1zQ6bRSDLi5BLQZdwOISvW1XQ0aNmYRyJbZuS44xwBx/gyMDDcbXBktCLSgBocoOUen7ILKN0qxpwgNQjqdFtMjKZxqYz6DO9RIIc7q6LghRsQKr2OSOKZa8qO5DpugdNdeKMXr1iJSNVTLAQX/tlc4qTbCOz+YtqRz3Qd+/9s3TWCUgMGQyXzsgj70wkpUGzfyc9N3VF6j1YgXRggpbWMkbWr37XtDi12qBldoWS3xHsCl5yMdyUohR1wfsCzVLfWOd3SVUhGEDlVSARt19yUft+aX8U1cEvMN8z4C30kLLGSGby5WdnTnzwL0mhCinZhXppVpZs+lRJnQUQs8FPRCbIKgWiXY2j1je7e0vXpTeUfSxy6SqlH12RF2totOg3CwZnN823O7g+yV3m3oHZkFSFHkQupZEiNuZAYFXjZQHrWd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:33:08.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b09eed-ce9c-41e5-474e-08df1d4be344
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999212

Add Cmdq operations to allocate and free a CeUtils channel and submit
guest VRAM scrub requests. Decode the allocation and scrub replies, and
validate the returned semaphore address and aperture.

Distinguish an explicit allocation rejection from failures that may leave
firmware owning the channel, so callers can decide whether to retain its
host resources.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  |   1 +
 drivers/gpu/nova-core/vgpu/commands.rs        | 143 +++++++++++++++++-
 drivers/gpu/nova-core/vgpu/fw.rs              |  11 ++
 drivers/gpu/nova-core/vgpu/fw/commands.rs     |  52 ++++++-
 4 files changed, 197 insertions(+), 10 deletions(-)

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
diff --git a/drivers/gpu/nova-core/vgpu/commands.rs b/drivers/gpu/nova-core/vgpu/commands.rs
index bfb033e5eb37..704d13259cf3 100644
--- a/drivers/gpu/nova-core/vgpu/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/commands.rs
@@ -8,33 +8,49 @@
 
 use kernel::{
     device,
+    num::casts::{
+        usize_as_u64,
+        usize_into_u32, //
+    },
     prelude::*,
     time::Delta,
     transmute::AsBytes, //
 };
 
-use crate::gsp::{
-    cmdq::Cmdq,
-    nvkv::{
-        nvkv_words,
-        Decoder,
-        UnknownKeyPolicy, //
-    }, //
+use crate::{
+    gsp::{
+        cmdq::Cmdq,
+        nvkv::{
+            nvkv_words,
+            Decoder,
+            UnknownKeyPolicy, //
+        }, //
+    },
+    mm::PAGE_SIZE, //
 };
 
 use super::{
     fw::{
         commands::{
             encode_plugin_set_bme,
+            AllocCeutilsRequest,
+            AllocCeutilsResponse,
+            FreeCeutilsRequest,
+            ScrubGuestFbRequest,
+            ScrubGuestFbResponse,
             VgpuPropertiesSchema, //
         },
-        RpcMessage, //
+        RpcMessage,
         GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES,
         GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE,
         GMCAPI_CMD_QUERY_VGPU_PROPERTIES,
         GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK,
         GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE,
+        GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS,
+        GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS,
+        GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB,
+        NV_ADDR_FBMEM, //
     },
     gsp_plugin_rpc::PluginRpc,
     instance::Gfid, //
@@ -189,3 +205,114 @@ pub(super) fn set_plugin_bme(
     let bme = encode_plugin_set_bme(enable)?;
     rpc.rpc_call_nvkv(dev, RpcMessage::UpdateBmeState, &bme)
 }
+
+/// Whether a failed allocation may still have transferred CHID ownership to firmware.
+#[expect(dead_code)]
+pub(super) enum CeUtilsAllocError {
+    /// A matching firmware response explicitly rejected the allocation.
+    NotOwned(Error),
+    /// The request may have completed despite a transport or response-validation error.
+    MayOwn(Error),
+}
+
+/// Allocate a CeUtils channel and validate its semaphore description.
+#[expect(dead_code)]
+pub(super) fn alloc_ceutils(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+    chid: u32,
+) -> core::result::Result<u64, CeUtilsAllocError> {
+    let request = AllocCeutilsRequest {
+        gfid: u32::from(gfid.get()).to_le(),
+        fixed_chid: chid.to_le(),
+        force_ceid: u32::MAX.to_le(),
+        swizz_id: 0,
+    };
+
+    dev_dbg!(dev, "alloc CeUtils: gfid={} chid={}\n", gfid.get(), chid,);
+
+    let command_id = GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS;
+    let response = cmdq
+        .send_gmc_and_receive(
+            command_id,
+            IntoBytes::as_bytes(&request),
+            usize_into_u32::<{ size_of::<AllocCeutilsResponse>() }>(),
+        )
+        .map_err(CeUtilsAllocError::MayOwn)?;
+    check_status(dev, command_id, response.status).map_err(CeUtilsAllocError::NotOwned)?;
+    let (response, _) = AllocCeutilsResponse::read_from_prefix(&response.payload)
+        .map_err(|_| CeUtilsAllocError::MayOwn(EMSGSIZE))?;
+
+    let semaphore_address = u64::from_le(response.semaphore_address);
+    let semaphore_aperture = u32::from_le(response.semaphore_aperture);
+    let page_size = usize_as_u64(PAGE_SIZE);
+
+    if semaphore_address == 0
+        || !semaphore_address.is_multiple_of(page_size)
+        || semaphore_aperture != NV_ADDR_FBMEM
+    {
+        return Err(CeUtilsAllocError::MayOwn(EINVAL));
+    }
+
+    dev_dbg!(
+        dev,
+        "alloc CeUtils: gfid={} semaphore={:#x}\n",
+        gfid.get(),
+        semaphore_address,
+    );
+    Ok(semaphore_address)
+}
+
+/// Release a CeUtils allocation, including one whose allocation reply was lost.
+#[expect(dead_code)]
+pub(super) fn free_ceutils(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+) -> Result {
+    let request = FreeCeutilsRequest {
+        gfid: u32::from(gfid.get()).to_le(),
+    };
+
+    dev_dbg!(dev, "free CeUtils: gfid={}\n", gfid.get());
+    let command_id = GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS;
+    let response = cmdq.send_gmc_and_receive(command_id, IntoBytes::as_bytes(&request), 0)?;
+    check_status(dev, command_id, response.status)
+}
+
+/// Submit an asynchronous guest FB scrub and return its work identifier.
+#[expect(dead_code)]
+pub(super) fn submit_ceutils_scrub(
+    dev: &device::Device<device::Bound>,
+    cmdq: &Cmdq<'_>,
+    gfid: Gfid,
+    fb_offset: u64,
+    fb_size: u64,
+) -> Result<u32> {
+    let request = ScrubGuestFbRequest {
+        gfid: u32::from(gfid.get()).to_le(),
+        reserved: 0,
+        fb_offset: fb_offset.to_le(),
+        fb_size: fb_size.to_le(),
+    };
+
+    dev_dbg!(
+        dev,
+        "submit scrub: gfid={} offset={:#x} size={:#x}\n",
+        gfid.get(),
+        fb_offset,
+        fb_size,
+    );
+
+    let command_id = GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB;
+    let response = cmdq.send_gmc_and_receive(
+        command_id,
+        IntoBytes::as_bytes(&request),
+        usize_into_u32::<{ size_of::<ScrubGuestFbResponse>() }>(),
+    )?;
+    check_status(dev, command_id, response.status)?;
+    let (response, _) =
+        ScrubGuestFbResponse::read_from_prefix(&response.payload).map_err(|_| EMSGSIZE)?;
+    u32::try_from(u64::from_le(response.work_id)).map_err(|_| EOVERFLOW)
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
index cc2298c3679c..ad2b29340986 100644
--- a/drivers/gpu/nova-core/vgpu/fw/commands.rs
+++ b/drivers/gpu/nova-core/vgpu/fw/commands.rs
@@ -21,10 +21,10 @@
         Encodable,
         EncodedStream,
         Encoder,
-        Index, //
+        Index,
         Key,
         KeyId,
-        Required,
+        Required, //
     },
     mm::vram::VramRegion, //
 };
@@ -420,3 +420,51 @@ pub(crate) fn encode_plugin_set_bme(enable: bool) -> Result<EncodedStream> {
     request.encode(&mut encoder)?;
     Ok(encoder.finish())
 }
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(crate) struct AllocCeutilsRequest {
+    pub(crate) gfid: u32,
+    pub(crate) fixed_chid: u32,
+    pub(crate) force_ceid: u32,
+    pub(crate) swizz_id: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsRequest>() == 16);
+
+#[repr(C)]
+#[derive(FromBytes)]
+pub(crate) struct AllocCeutilsResponse {
+    pub(crate) semaphore_address: u64,
+    pub(crate) semaphore_aperture: u32,
+    _reserved: u32,
+}
+
+static_assert!(size_of::<AllocCeutilsResponse>() == 16);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(crate) struct FreeCeutilsRequest {
+    pub(crate) gfid: u32,
+}
+
+static_assert!(size_of::<FreeCeutilsRequest>() == 4);
+
+#[repr(C)]
+#[derive(IntoBytes, zerocopy_derive::Immutable)]
+pub(crate) struct ScrubGuestFbRequest {
+    pub(crate) gfid: u32,
+    pub(crate) reserved: u32,
+    pub(crate) fb_offset: u64,
+    pub(crate) fb_size: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbRequest>() == 24);
+
+#[repr(C)]
+#[derive(FromBytes)]
+pub(crate) struct ScrubGuestFbResponse {
+    pub(crate) work_id: u64,
+}
+
+static_assert!(size_of::<ScrubGuestFbResponse>() == 8);
