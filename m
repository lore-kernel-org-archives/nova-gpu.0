Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E94973AF
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591389; cv=fail; b=q0CnJEw/PoKSyuyoiD9Xc202Cqu8+syfqBlG2vDHeefZjpBCmY9W3LobicUhcn9Ufuh/6nMS+lb6ecZQblqOCUkBQGkoCGNr3wUkpD8iPGasUjoqTB9bwFwSF4xkaqvMI2KYpUDdJV4Wa9AUThO88O8c6740W+rR3IhtzQtukf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591389; c=relaxed/simple;
	bh=wG0dJIJ7ZfsRZ9867Ra3w7yTFDu5Faj81oWQ6F2pd5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ht/AQGAO+7xhXMAvqNNyBDptboaAtgAzFrFai3sIAT9tA+Wx15nUGkTO2wZ1iMLno5TB93AzkNN5zVNw3fjZfpchY0Ux5eM+z8CB6sv3Z4jSc73q/+f0TG7JkjpzeVny8NiZC28rC44zh/6kktrXz6GsojHHT/8nCfThQz5qJEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IxAfTPDM; arc=fail smtp.client-ip=40.107.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IxAfTPDM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHkO4xowokUTSRvkKeZIkK7+ykMch9NoBuI7fiXGmGcCEJ82uchpOGiIo9vLIW0MwqPp1nmTfR3L97dTaZOJwFkjtU9AZsQcK612VJkwc/90mH8b5naPTXnwOiQLsR7AERdIpgIB3yzgUY/t1Q+1OS27WYqBSTBWpZIAs6WX4ueYUplggAeAQleUaI7MtAA+0fRuTSkW7iwvbqRQtk+xvGIS1cTfEiOfj9joVYXiF92MEj+xWhsREuCUrrt5aoTmDiOwQDhmN0EcHQALA7aR4y/x/nGElQwGO0Q7Kjl+62h9ys1QWIRETa/Y9I7DhT5JwarZMl+kKSsR1i9ztPbfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7FZQVKNTQiDDVBYHy0qy/Zf+4cyGQ4jo5mBgEnymY0=;
 b=ApJTFhb/aQiv4Qsx1RPj8EQm8HgkILFUurtfWgIzjeF0904U0Pk0MhDphS7d3R6rnXCSRvI8fmuDHCCYy9WKfIHFjOMbF7Eu/N0783ZDhMdhi6+D5O1+/NfUYw26RCvrqH+q+t9KeIdzpjkp4HwPIRB5K7LXP91+7wYgn3KZFNQWA+xANdNMaPfu2F356jDhuqjTKEO6G+M4GKwh7Gk1U+5w1+0Mzo5vMATVwGaGfTR9Iv80UPxvBA/uXcGPQ59JobFT1xWGMnBewD0jgt2pVa7T7oHGiMBw1DpnBUcI15Z+tF0W+/0AV5yQPN7TyIkIHRzIsV2TwNKcdHhr3ToYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7FZQVKNTQiDDVBYHy0qy/Zf+4cyGQ4jo5mBgEnymY0=;
 b=IxAfTPDMPC3RwC2sK/tseZQUr+Ru47TNiYkun1S/uOXP5c8+e2QJClxHZBHii6sJ7AAT1yHMNV4XOcitP6Ic0+nSBvZVL7KIHYvU9lSDBtp/gvBTlD3KEiz6XD4hhks6ECWA2Nv47LFns/oRRcKWd578jiAmb7MQa4DsPo7PofAVB6HiXqHr9VHhRWIt1CMFBq7eaHAAO0EskcYqM5iXvdUrswbr9g0iB3+Wwh3zOZTBj587HyxKlsdXRnAwczgD6R3hZlN8D5BQSfO06Y+YJZJ38VwQYtP/Wf7g6RjaBwYBrntAVauix8BnoQevX2J/uoDSFTsNmerqu5bjGYeZdw==
Received: from BN9PR03CA0849.namprd03.prod.outlook.com (2603:10b6:408:13d::14)
 by DS7PR12MB5816.namprd12.prod.outlook.com (2603:10b6:8:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:29:41 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::a6) by BN9PR03CA0849.outlook.office365.com
 (2603:10b6:408:13d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:29:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:22 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:21 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:14 -0700
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
Subject: [PATCH v3 04/31] gpu: nova-core: gpu: add a channel ID pool for vGPU
Date: Mon, 28 Sep 2026 13:28:07 +0300
Message-ID: <ee1d8c303607f9bdcc5a5ddbb329a89222a13c0b.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DS7PR12MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4161a2ef-19f0-411a-7a82-08df1d4b67a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fOnr4k7ldFhHG/TV1aw/Rzu3/28IPMjB8nyPIo1z+LrLMMCJCi6QmaSyE5allk/LA+zcqhZtIc15o7X6oKdFdv7V/5mAb8q+8tsg7Xa3v/E/b0dcJYMDvnf150G39cCK5jAEzNXxrnQQHy4Bw++DBC6AP7cm5uZUw829YD6MB1aF21d/xsaNgxJ/a+NDLKCXTwmh6rygGn3q2hrSrkABDtUvklfD0y4xwsDaoPohY+8yT2ZLJW+oR14xNgRuNAq2InAYL4m7XgPqPnLPeuDQrowzZLqb3mkd/2/aT0Nk6WhdjimfFPv1ma+rYCUULRfowiSMs8eZaS6poQW+AoYfDkpO6iYldKLs2KTfm8kon/qNvOi/cgv1hIuoopo9IGfExot+NXuHr/VrDf+L7XQz7gig6OyS6MsqRNBxnInt2zcMp0NDE2x4SvzLnVUWnKAvOvtRCBgRPlgO7ZymDyQvHpHueqghqmLUBpC/7qzlX1ltkphCyC2niKeJNLwwXQyJ1BtFTOTdyHjznb56nkisml63APMaQ3hef3Bv/u6qkcY1Lzi5u6DX8rskQO9/hGNOH7ZN/cj1tVCXKDWXH+kTKdxZJ3iGIx1TSmLFsfFZMEe2JxYF3Ku9udj73DYJ2CZRmKm9lvH7BsP+Uu1t/AcMvRTZlzynBf1cSAG7AjT5YAYsuVw1+bykxVAXdX26yabTyP/3YReSjlDKgZdwhvSZow==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qrV8RytSK5Lab2p1+G02WzZJxpr5PbRv1gXBTM3kiefZuR7wOI535FsUcCnkWUzmJJ7ZyBajSv2A251lMmrzOnFBZSakFqnRrjV1o5iAM1OkDv8nHq7BzGa84soE9V8WsarRQoQp2C0E3Zrgf2p5axBiy020hcyW4IvvM1t4XikWUtvdRlpXlMX9LPsK1Hzp20N0Iu+FQniRaT4TDdjB8kpPKKN/YfG0trkIBxC+NCrm7mu2gL5nF1llmJxphtFK4rLHPZmFkk5LnNM0z/tgj2e9WJzu/K7nQdmqeRifRGsn4iDJRaKQRSVRK/wYDfF7f+yrGjhegTi6qvBwh5H4I/cKbCmpDB0ZKR+TV+5h3qhQEZebcu30g+jVCdDPV85d6z94xi8c88J9AgSItQfoynVdd0JM8675YKIbuq7dFzv8pJpyO4HQyEQRJ6/xvHJ5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:40.6779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4161a2ef-19f0-411a-7a82-08df1d4b67a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5816

Channel ID reservations need a GPU-owned pool shared by vGPU instances.

The pool must remain at a stable address while its reservations exist.
Its storage also needs to remain available throughout GPU cleanup.

Create a private pinned ChannelIdPool with a single 2048-channel
capacity constant.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         | 9 +++++++++
 drivers/gpu/nova-core/gpu/channel.rs | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 650bef8b5f44..c239b6614d44 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -48,6 +48,7 @@
         GpuMm,
         VramAddress, //
     },
+    num,
     vgpu::VgpuState, //
 };
 
@@ -56,6 +57,10 @@
 mod hal;
 mod regs;
 
+use self::channel::TOTAL_CHANNELS;
+
+pub(crate) use self::channel::ChannelIdPool;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -335,6 +340,8 @@ pub(crate) struct Gpu<'gpu> {
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
+    #[pin]
+    chid_pool: ChannelIdPool,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     ///
@@ -417,6 +424,8 @@ pub(crate) fn new<'a>(
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
+            chid_pool <- ChannelIdPool::new(cv!(num::u32_as_usize(TOTAL_CHANNELS))),
+
             gsp_resources <- try_pin_init!(GspResources {
                 device: pdev,
 
diff --git a/drivers/gpu/nova-core/gpu/channel.rs b/drivers/gpu/nova-core/gpu/channel.rs
index 485efaba059d..75666c6768e6 100644
--- a/drivers/gpu/nova-core/gpu/channel.rs
+++ b/drivers/gpu/nova-core/gpu/channel.rs
@@ -21,6 +21,10 @@
     }, //
 };
 
+// TODO: Query the channel capacity through GMCAPI once an equivalent of
+// NV2080_CTRL_CMD_INTERNAL_FIFO_GET_NUM_CHANNELS is available.
+pub(super) const TOTAL_CHANNELS: u32 = 2048;
+
 /// Pool for tracking reservations of channel IDs.
 #[pin_data]
 pub(crate) struct ChannelIdPool {
