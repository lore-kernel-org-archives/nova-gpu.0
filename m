Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAE49B5CE
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591496; cv=fail; b=nhoT6tTBqMlmiL7CPR4SfBXCs54Nm2rihOSKlH1pYz2UVTxMEyqDf4z0vBNGie7kuVYvuOOJJ1UXFDMvbyZ0PjxdfwQdq6Mss8+FbRM4e3DCzR8cBGFy6uD5RafDDmfOoGrocinus8FJwDNlFeBn5PH2CV43s4N1nNkpp1Sx8Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591496; c=relaxed/simple;
	bh=YAeDcWon1IPu6WaON6BV6trHFsoudl2CWB12skgiopE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAioqxezCkFjoraXVn/SZVHlxHpoeaUgUxm+lGepPYfQpXqT5doYIIPhxcCbIeAxn+f2WSkTNz0QYCju6Z/2aswIx0siv534o9Fa0y4Q1EatZaU9PVGtOZsJtEICePaf6t3kwdHI3ZL2Bo4fd7v4wKvTn543GuJEiPw9c8HY5Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e1zt9slw; arc=fail smtp.client-ip=52.101.53.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e1zt9slw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkh0JnlM5uRTrUPaA8t2KodcEq3MJYmvPGFiHtV7DY/floCv8ahC/WLRIIWcH6FkMdF55Z7so3HoLXO9xGFEi8dB/Kn2Lt7Cauf79+1edjIRezEVZfi2xB/JY/pyQIART8uhgbiRMUusDhg4+Aa8K0KSlQAVYmuJPfwB18P1hiXKFoCmQy9OKH6GXy6P5m/HNB63qXT55B1iTsFWM6RLQ6BAtZoxKxD0q1zDSFKS/5mjaGANpqvFb1vYOyp69Yl2hZRoL/R+Az8R+h5JQ2Fg6SxH2rS+WoRvqMf1a5JGRYq2mQf84Mi8fm/GqbGxO6GZvk8kCHFY4wTkLL97hAPf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsmmI5/2PiyovuBdkf2MnIJfL8WP4LVL+pTwK2Ryh/U=;
 b=KSE6T3es8XxgviK08HQgqTyQ+2LUVUARzhjaL+vXY0TQA910I2VTXTcuxKAx9S734ltv90AtyPsKWhTN9+MdfxjBKTmbZM3eQNu8b1iZ7vxhRyvQu3VYRVlBB6n+c9sm+mIRPgwInWQPg4M3OFzCOAE1DucswFfrPPKUgmraBv+OUAJ0iHuD3ANiizz+lZsIycpAgyV41U+PRW29t9FuVm5j9zRC4oFUVV7pglkpT4zBuoNyfTUnHL+h8rfgHfAFLnIw/e+sMBafCobg/I0Suo9oSAlCEfYZnnNduTOo6neRjNatKpH5aRvz/NYm4Ya9LPYhK4yL9h1SYuyqTi3VAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsmmI5/2PiyovuBdkf2MnIJfL8WP4LVL+pTwK2Ryh/U=;
 b=e1zt9slwG8Lag7+iK2uZnUl1FS2k5UwdkB0J2/DuI0BBw6JRNJxZGnbpNIWLJabOffhqcVpwdW0L/4HWZX9kBJNb8DAgdpbV4Ykavwaruy25P6M3JdL8J54McvrSFvP2hP3wDu1hOKzCe6hUxJnzyZxieA7q8G8AVsCQ3yfYDL5+4IsjBzFvVDoyN5VtJg7iKfsp1TQY44VtnAKwzgVFed5EeVUE4TrFzot8ZSnLZEf5gL6uwjLyg9rmFxySjTnlOFyb/jUW7N5OHqv5GAxY8IB+lu5Xtil7fjWBGmb+iw1J+6HlXPs32mat9orBzlOStIFZ0T89tZTO/7Pv/cGrEw==
Received: from MN2PR06CA0006.namprd06.prod.outlook.com (2603:10b6:208:23d::11)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:29:28 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::9d) by MN2PR06CA0006.outlook.office365.com
 (2603:10b6:208:23d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:29:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:29:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:13 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:29:13 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:29:05 -0700
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
Subject: [PATCH v3 03/31] gpu: nova-core: vgpu: detect boot state independently
Date: Mon, 28 Sep 2026 13:28:06 +0300
Message-ID: <56c25953b865a0f5a1dfdda14793e52f0bcc747b.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: d3445c94-a380-402d-9d29-08df1d4b6070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|7416014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0zHQCQj/Q2h7En1mwmwEKNxEmWwxW/igPUaMjrF9YznoBoXvivlv55xFlpVRBal0oMLK8h+mQvMebWK8sbWFbBtkQRXu/hx8NpTrMsHiH74I5o+8e46MmbIlJTPQiW5+c7zu2uJxhRRKEksphxhHqnkvHxmI96U5Gqdgq+pYQJVNtTkcbq1I4bIirmfLODqXukayJpadlyRyxjhZ/YE3ApSPMDhpaumtUd9j3s6KAdfBDZl8LB7xd0x2d5F1aheFleF+ueBA5SSrcDDzmdiATXfza3OIg4tuQjyg4T3/YVwCnGZkuHl14D3YPiIOAGdTjDu+va5WmVOAvABpzIOoYHQNzFvyxcoH+yXc0Qa97dFFj7eQ0l+JSMqH+806Ck6LdjDPVTaQ7qmyuF0hT8No+y4+YbZFJ1pLOihpQTy1dzx3LU6VnWaY4xsTpPACGjuUUhS1ALex3G2BclFOtIkMGmXFFQQRH6ANJATm9+wckBuSlnKiFoHKOdP0r/5jNy4j0q/u1oXHSjMpp3/NWG15xTfvsGRtDcMJ9ChjLrUgHNq+CjnmUWs6Sv4KQTpbFWhaMdGNQCJjjGiqSlgamCeH3lRl6lpQtsaJK0AEZfp1JLQ/MxEJagJiNSF+7PqzmHUlxG342NmWuiQCF//Bl0fxnwgi/PbQo/FnrgQkOaFQJ/8pnbyfrKYovMqfT7dG1S50FLYyicWz1FWpWObAmOGoMw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IIAOkL9r62YGrrjFy+lOcBLBihvq2LoB55xT8MAMn5La4wBBWZeqLSL1VHunnJMQiwk2S8O7ufKpRkAaPFRF227lvijWJ5hR62MhT5ekP3JhT7KXwIho1uPzJ09EYLEYwUwUzqY7/2d5DRadtmFyQSYuZmEEGcrmetNPWRU6yK6krh+/PsD6xqDyW7vQ3JGLoetJhkgYDgNk3PxU0EyNpKI+/AEEYNwr32TdEBam13IKyRId7z43yY5bsXGQGsEk+p1dwPOpn3voSs1xmrBnVSVZvJ1zYhpAWGeVXl1KWjsDZV12iMTX+DzFqeuE7qDr4SJ6R8cgnrfdTpKJ/tagdiUPHJBaI3k0Cce64OMKuX4UQPXsuzdR08M7i2OgGJmrrcmjDGOHaenihYRDk335X00ufLnWVE2yN3y9sxHB3HHrkb/QzUOqJld1SiD0GAOk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:29:28.5754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3445c94-a380-402d-9d29-08df1d4b6070
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

The vGPU manager currently contains only the detected boot mode. Its
construction couples mode detection to an object with no runtime
management responsibilities.

Firmware setup needs the mode before allocating GSP resources, even
when vGPU is disabled. Keeping that value with GspResources also makes
it available throughout the firmware lifecycle without a manager.

Move detection to VgpuState and store its result in GspResources.
Borrow it directly when constructing the boot and unload contexts, and
remove the state-only manager wrapper. Preserve the FSP query order,
existing diagnostics and disabled fallback.

No functional change is intended.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 11 +++++------
 drivers/gpu/nova-core/vgpu.rs | 25 ++++++++-----------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3272afdb7d1e..650bef8b5f44 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -48,7 +48,7 @@
         GpuMm,
         VramAddress, //
     },
-    vgpu::VgpuManager, //
+    vgpu::VgpuState, //
 };
 
 #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
@@ -299,8 +299,7 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
-    /// vGPU state detected before GSP boot.
-    vgpu: VgpuManager,
+    vgpu_state: VgpuState,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp<'gpu>,
@@ -372,7 +371,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
-                    vgpu_state: this.vgpu.state(),
+                    vgpu_state: this.vgpu_state,
                 },
                 bundle,
             )
@@ -431,7 +430,7 @@ pub(crate) fn new<'a>(
 
                 fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
-                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
+                vgpu_state: VgpuState::detect(pdev, spec.chipset, fsp.as_mut()),
 
                 gsp <- Gsp::new(pdev, *spec, bar),
 
@@ -445,7 +444,7 @@ pub(crate) fn new<'a>(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
-                    vgpu_state: vgpu.state(),
+                    vgpu_state,
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 905b3a7331fd..b405ba49c490 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -30,19 +30,16 @@ pub(crate) enum VgpuState {
     },
 }
 
-/// vGPU state manager.
-pub(crate) struct VgpuManager {
-    state: VgpuState,
-}
-
-impl VgpuManager {
-    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU knob.
-    pub(crate) fn new(
+impl VgpuState {
+    /// Detects the boot mode, falling back to disabled if querying the device fails.
+    ///
+    /// Call after creating the FSP and before allocating GSP firmware resources.
+    pub(crate) fn detect(
         pdev: &pci::Device<device::Core<'_>>,
         chipset: Chipset,
         fsp: Option<&mut Fsp<'_>>,
     ) -> Self {
-        let state = Self::detect_state(pdev, chipset, fsp).unwrap_or_else(|e| {
+        let state = Self::query_state(pdev, chipset, fsp).unwrap_or_else(|e| {
             dev_warn!(
                 pdev,
                 "vGPU state detection failed: {:?}; disabling vGPU\n",
@@ -51,12 +48,11 @@ pub(crate) fn new(
             VgpuState::Disabled
         });
         dev_dbg!(pdev, "vGPU state: {:?}\n", state);
-
-        Self { state }
+        state
     }
 
     /// Detects the vGPU state from the chipset, SR-IOV capability and FSP PRC knob.
-    fn detect_state(
+    fn query_state(
         pdev: &pci::Device<device::Core<'_>>,
         chipset: Chipset,
         fsp: Option<&mut Fsp<'_>>,
@@ -83,9 +79,4 @@ fn detect_state(
             VgpuMode::Disabled => Ok(VgpuState::Disabled),
         }
     }
-
-    /// Returns the detected vGPU state for this boot.
-    pub(crate) fn state(&self) -> &VgpuState {
-        &self.state
-    }
 }
