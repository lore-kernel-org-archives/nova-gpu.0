Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220971;
	b=K+Yl18RgXEjuz+waV316yuaUuLuDYjIjvRAQCnAitZEA89yhQnrS2vtBvVKosU61cH+Q
	 qofNBUx5Gnmprgo2LxBg1hEjpTo+mdbnctvnCBpfSnY5CRt1MKoP8wTBEDzOawoHNEKfk
	 rnFWgQVGWjdx7UGdrpXVhlHopUOHhPY8i9gzUVC+iir0M3MGeNPsp3iKolV+93i881u0v
	 e413F9Xm+kDduj4BKKq7Ud9/MY+6VaCFHY5jG2aHZvYgMzEqChQDOb8hPFzeVxwC5gHfm
	 z/VptLztWjayKeK+2iR+eIwLwGAY5V3JfmgFsQgy3MEN0PgOtadGt+i4ICQDf38tv8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=N+oaT5Yc2qExcpLkdQQQc/+p7KS+BnSG071l58oKHKs=;
	b=ZsKtgCcW9imrMZQPhbZg1sW4hkgT5TghdHZYsMNbF8p/W5GV2O3DV8LtsZHyLLnylT+K
	 31N0VB4yc6q5enWgu32ZiddNxPnR0eH1yH6Jq69Zq3D3ZAC4lsygTs3PysC/EVc3ShPkS
	 jSWsQpfcUfpbEamfleAjWs5o9XPz+68Iex4BjWTOFsYlLvqj4RguM+MMR7Sgx67ckEoBP
	 7Jvx2NehhYVuC/24dAFdNcj7HbL7uDV8xau5Q4Z270G4TtMg8c0jK22eD4Z8gqgVvpyPu
	 mpUoJS31eq8qN3sCypbMU6UJxcQzJQjXOiSVQQSLR+L9PImkBUs89FyH3arMt7r9uUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="L/2+NoSL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.3
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010003.outbound.protection.outlook.com [52.101.193.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC3606A6A3
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FC3606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L/2+NoSL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vjj4F8oy3bM8OhLPBSnGIT1xCFEv+AaPAM4k119A1E8oQ78vGw3ABBmBhuK64tjRSfU92DmFRDzDTvFgAXx0Q9NcY9RajTgSEPQrBXjNzk5BKiWqLGLz++GZiHwzOVwRcyUfxTF39dvQRfXdcfNVBdxKNANMpzcvyCEC0pOSyYSoTWjzSyFQhX08A7tN4tlVucQk7EDFlVxqTWoMTo+eiloO2jwUztwH1faphZQwiiFNfNGxsRLPcMClMk6po5e3vZTtKSpi1q9Iz0BAbP85WTGbGKbV5knDkF78Cbi0VAFjFUD4Hhj3EV9ivRuTWUGlAL9EXBjQ94ZHkRJ/Z9AoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+oaT5Yc2qExcpLkdQQQc/+p7KS+BnSG071l58oKHKs=;
 b=bwfBtKXpdYYbWn+kn7jo/RZ7cv9rTE4HC23MaLeP0oazHMuQRQIPruPSNKLMjwXIy7MW1LpbMfMVYz6J+ulmO2QvKwBsz/QBfcvndeVt0BxLRADLwUq+AxqFAC48zUbPXJjFvEV3QxmSda3gmAGaI542sLkzTnFF7q8DSX252D9qKkGVire4hjptyvinInblaGKpjHWEA9Dv+yJ2oo96mwhSyGgbRVuZIU9r2x8MpQiksnoXQNGdl4CAqQq0bzpDe9WfuF+aKzCVGZd3stmKEibcmsKdlWEkuaHN7EddzsNb0FYx9Y/eZv+EpIDcWFtTt1ZwQP6nHV9KWhYVyf/cWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+oaT5Yc2qExcpLkdQQQc/+p7KS+BnSG071l58oKHKs=;
 b=L/2+NoSLqmss/Zlw8CGOKnIDi8hbE3FaEw2PCAm7TA0fpySrBIQBKbhL9s9yRDUBOtFsi62q4L+o02B5WgU2k9995I6/1D4Wqe3m3i7CSr+0uqCUrLau8SkoqHwUU4nsLeBDN/B8BnQw9XkPilQA0fn2BiHC/P1QivADEjcWHGdImtTMoXe6YniLGir6qITROMChAOGiJZQFCTLOgzhX/RL/X4VyYeb8Ll9uNmw28++a53iS46PDVsVMvJ8ZvFlv6VcaZMAduhkEmheaQ+Em224gwhIJ9+lP49LK4g8Jh83pxiWcJiLcdJ7bU19MfQCo0mTmtLkX2X32SN2O7afVWw==
Received: from PH7P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::33)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 00:29:24 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::2a) by PH7P222CA0021.outlook.office365.com
 (2603:10b6:510:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:06 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 6/7] gpu: nova-core: change wpr2_heap_params to use TLV values
Date: Fri, 20 Nov 2026 18:28:46 -0600
Message-ID: <20261121002847.3358679-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121002847.3358679-1-ttabi@nvidia.com>
References: <20261121002847.3358679-1-ttabi@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb91f70-9c79-428d-0009-08df47667e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|22082099003|18002099003|11063799006|56012099006|261022075727099003|261026121527099003|261022115727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jdPaV8ETWbFNiO1mqTtig56Rx9rfc3eu8z1229tUK7y3+mVHED9uAPUVEqc7E9AMwFzKNzW8oFIqEkXJW/uCttKM6SX4z2cStwvpYrhMbz6WIUd9YP7NSVLX+Bl4PLcvJNkpWeWqGDwXcbs6sKyGI6RDAX20Gi6S26kqeh0Avz2tUlvnI/AIrVldLa8UlMDStx36/mlOpwFkcbow7e4D4p7Qz7B1cMXD8Kf4o1QobNNW7viOJD841Ri2MqHJ5qju81DSgiJxmGyK0AmZBPCZx258NBDLpzEUMazi3xjv33wqBLKijzjI7KzD8hJfPAvXH++9grv2bQSzkUw+hUzhAHcuiofBlmK74secBfKxSS10uHcnYWvRQvcsyI+YoB31PZ20RxRuzZ3sQm5Oqo9Kwr5TvEG/X1Zdc2mSRfHPkGPvHHJJGRp/6GzSRv/0A6gooi/2HLzlT79MPAwSmkLnKHqIB8JSmCDGlU2gUpFfbhpknUy9gzjh44P0zuTqAqekoPKi/VNHFwPp2fKbivQbk4cHSzjXa9oZ9X17XH73AgL77LTMQqV7edJ23e2lsPWwuT0R+TTGkIODWlVgREToYeqeSunF9Oq6hGauwMSMG854U3S4xV8EjCo968eZR07WtJ5rj7FMpaY8NOgs+39DErYvf3ZJS4/ECiiLbPVU3B13/WTW5PPL2yg/NvKSxPYV9oYoxJIZ94Lrf4UOK1jYeQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261022115727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LzLJj4CxgWWsAnAWnVjSHjTVhzxw1Qrz9Uz+WAiKsmXSn2hvf2q/oUonRTbtQn1RJaMTYSRjL3qlQn4RQ8037HaV8YcM2NNwKbaWEzLUJc4GwyyDCILu1fGzHLZXjSQ3V4sCh0BuO6cVXrRvcF/gOQKKHnFYl8ZZvPoIypw4n8Rsq/8jhbrfGKWjwl+u/6QyznNoc8c/TbZGUGIyoB3qksKTLA85Fme5WCVEHIHLvU9dxsucaoaeJ3zwfGaupYMGPY7nVPzqHHR/uXvgE+MZFkL0SBaFy5D59gxXWxtxecwGFjCi1BGf8ouPqlYts6gBbBC8DqHBYFxxJ5zqW4AWeJBDa2K/eQbvNU0mvLksyBeaWsuJWXg+Boc7xEuraIrhykf1aLr0MNgEqT7BB6fHhuz7QAQa3svtgGy67kATDbX92q/Ucy7qfq1A6N8CT6LX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:23.9912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb91f70-9c79-428d-0009-08df47667e40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240

Now that GspFwHeapParams has TLV-based implementations of wpr_heap_size()
and vgpu_wpr_heap_size(), change wpr2_heap_params() to use those
functions instead of the LibosParams versions.  This renders LibosParams
unused, and it is marked as such.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 19 +++++++++++--------
 drivers/gpu/nova-core/gsp.rs    |  3 +--
 drivers/gpu/nova-core/gsp/fw.rs |  3 +--
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b6ee4e48d5f6..d6524c71a9cf 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -242,7 +242,8 @@ pub(crate) fn new(
             FbRange(fw_image_addr..fw_image_addr + fw_image_size)
         };
 
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb.end)?;
+        let (vf_partition_count, wpr2_heap_size) =
+            wpr2_heap_params(&gsp_fw.heap_params, vgpu_state, fb.end)?;
 
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
@@ -302,15 +303,16 @@ pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
 }
 
 /// Computes the number of VF partitions and the WPR2 heap size from the vGPU state.
-fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Result<(u8, u64)> {
+fn wpr2_heap_params(
+    heap_params: &gsp::GspFwHeapParams,
+    vgpu_state: VgpuState,
+    fb_size: u64,
+) -> Result<(u8, u64)> {
     Ok(match vgpu_state {
-        VgpuState::Disabled => (
-            0,
-            gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb_size)?,
-        ),
+        VgpuState::Disabled => (0, heap_params.wpr_heap_size(fb_size)?),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            gsp::LibosParams::vgpu_wpr_heap_size(),
+            heap_params.vgpu_wpr_heap_size(total_vfs.get())?,
         ),
     })
 }
@@ -340,7 +342,8 @@ pub(crate) fn new(
     ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
         let fb_size = hal.vidmem_size(bar);
-        let (vf_partition_count, wpr2_heap_size) = wpr2_heap_params(chipset, vgpu_state, fb_size)?;
+        let (vf_partition_count, wpr2_heap_size) =
+            wpr2_heap_params(&gsp_fw.heap_params, vgpu_state, fb_size)?;
 
         Ok(Self {
             frts_size: hal.frts_size(),
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e487efd90b22..85ef94a8b5c7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -31,8 +31,7 @@
     GspFmcBootParams,
     GspFwHeapParams,
     GspFwWprMeta,
-    LibosMemoryRegionInitArgument,
-    LibosParams, //
+    LibosMemoryRegionInitArgument, //
 };
 pub(crate) use hal::boot_firmware_files;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 66f5bb1d0a8f..f185f1bb5ce4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -125,7 +125,6 @@ fn management_overhead(fb_size: u64) -> Result<u64> {
     }
 
     /// Returns the WPR heap size to reserve when vGPU is enabled.
-    #[expect(unused)]
     pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
         //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
         let vm_size = self
@@ -139,7 +138,6 @@ pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u64> {
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes).
-    #[expect(unused)]
     pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
         let management_overhead = self
@@ -162,6 +160,7 @@ pub(crate) struct LibosParams {
     allowed_heap_size: Range<u64>,
 }
 
+#[expect(unused)]
 impl LibosParams {
     /// Version 2 of the GSP LIBOS (Turing and GA100)
     const LIBOS2: LibosParams = LibosParams {
-- 
2.54.0

