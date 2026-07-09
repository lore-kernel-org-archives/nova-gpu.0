Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C513BB69E
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609419; cv=fail; b=hzvaPAaGB1IO3gOETHYATbInNy+ESrlsjby0Z3jV9dNKx+2swg1d5br4Kg8BbTdon44epvuaU5vnv+OhM1CcPqUGzKN+O+GOo/EZrKh1TmlGgJY52UAVRRm8gkOoUNwZOvUQ8CCx02RXDBqzH3GvxaeojqySgtjo0NFaE+lLXjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609419; c=relaxed/simple;
	bh=JQ5Mq3sHrzN+lX+/r38ytOSNORM7TFBmmEvcaUmWJHE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hiLIpPJjWAYM0mKF2WiXskRoNPN6Nh+Aqquh9GnOsF03UE4P5zrbMlG4KwkGx6qBWvRqO5m3seGCJVx3Cu3CU2bmjCR7Z157Ot4c+LVT5NTJqrYTmTwoEyXeeubj485KDp3v41WY3epZj6GHFEba9Kvi2Zatfu/AEsCZvqKTkyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s8j/irSJ; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s8j/irSJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXAKOGpriF+CzVB9FhbQgF9+evLtXL+OWh+5fOoy31EbRwFXtZuAio1lLTpTACteEQFfmA65/t23i7dWWog0kj/8hn5Xl+0O9ktVSZTHXnh412mjNHWe+iB6Q8WTVWPNewbohYL2nyYVKfVy0BTLNwrIU0x/jGFTijhyi61lK7YY2gXAwCIxxA5FVJ2Grh2bxABmw90O2ykDfD/LGCYilVQYmKIHWadSn2lT1eO3/b0DqvfOoUzw14AJiVI5YBCvf4iwGijBO1h9tbltR+bcY2nKx81O3S5p/f7G6wZ+Caz48ehV91NQCm37iO1BHHmOSyXFmyiovkE+akJynrHQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r9C2hnXQAenlLe5Y+USURx6rPSCbICTHSZsbv+ycr0=;
 b=QNpov5Z4OSXRw9Eg2DC54p4cKi/DWAfKbWd/o7XJIXQs+AZ2/pJJwKMrguFnxdRiMX9mUq/93E4Q0n4Usc6ZImWTYHU+jfPH/1lLocMBqXEchCznE3k/8Kil3116THEjea5NMMKlY6MfneiP4WqdrpfPc7zZFYzQ97sSIUFYMw8+rYQladpYmVE0clcJlegGG3IKjbrKy71WkMLRGYFF1AWfYQF+Vg9xoO2wJre26p0DMVnlXL6VCqo4dARocMpULd5I04rGSeTvn9OCHoS1VeZXnospAr4P9oy3+J7M9LREk6ADc5TC3Trfz1In2A/OydbqCrGXFKIiTgr/sgpeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r9C2hnXQAenlLe5Y+USURx6rPSCbICTHSZsbv+ycr0=;
 b=s8j/irSJ4aIlh6SfRZzhgadnf7wqhgjuEy5AMKFgp/Gr8IUx0/vbHh+nczuvdTwzpgis9qV9fhPZ+Ms8OVIyiyDpgAf2a7px6qTvXIk0DCqOVRX48pRjDfd6wMjirFuBM+BjHPMgdgjp3WJYrsfu4J2IAWM7LCa2MCi1CltITnlt2c5hsJtfowiMYH2Y0pkdLa3q8Hk/ummB+/oix/ChM8Pq+xUBErjwhh5ld0EyWAgrdJkz7peOCZBURPIoVHcdz4pN4122rU6u1XrUYedo3qpqacjpY7uLdOgmgF53y9zX5Yv+kyeOLtSQkxWkCEtzEGmdtdN61m0mX3qjTIxhrw==
Received: from DS1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::8) by
 CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 15:03:28 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:8:455:cafe::69) by DS1P220CA0013.outlook.office365.com
 (2603:10b6:8:455::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 15:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 15:03:27 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:03:00 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:59 -0700
Received: from inno-dell.vdiclient.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 08:02:52 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v4 6/6] gpu: nova-core: reserve vGPU WPR2 heap
Date: Thu, 9 Jul 2026 18:02:06 +0300
Message-ID: <20260709150206.1046839-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260709150206.1046839-1-zhiw@nvidia.com>
References: <20260709150206.1046839-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: ade958ca-dedc-4d74-3e68-08deddcb3b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|18002099003|3023799007|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	75g9JyGCi9eKG0fRDLeqcaV5nw6P2o8Qnlom5zcFkZLQhBsgvbZRAdCxkE1XjzdGeLjaSapcIlq2zktwFjamA4ClQLx9LDQjpQQv48buWBgCjq+aPPRZNkyCkWY96nxdfunrxtqFQyc5elfmjCnzIOd6efEC7yg2P9CNgRASDLK6yMDY+M+bjiGkOBjY/UqW5HLGlIsMXQ/LfL+6GUYD3wqV7ZmJKLYF1Qslx0c73ZKgMk/FcsCjuxkDoSQqfgXWSFGWG0OyuCP/KBmNgBsF1DI1jl2kRjpwwxb302S6fu5BfTg5BXp3L3b/GdME9BMICN4HZO6JEjwZ/7zA6lbs/hidR0YqAVuuH99LNWhXd+jgRMb/BoE5aipdQzfd9+OddHZZFh4QEnfd2RYzpYEUZBI9wqd8hLWRG37M3NA+UdwUQ4SZYpX/AVFMDcNhIkJCtD/tSskL8Y/j1uNx/w/DLGwZmBDTwiJW9fn4tV2NImVO9sbxLC6p4MWmXVuT4jo6SQGnJ25QMDQCNdJZRkmfeMEVLPiyib38EuiZ0hhHWCI1mIHxHUHFSFjz6QzOeUmTBch0aZsW/z84hkM2OzuwnSLwpdYo+XUe87QlZUSXaKcAJ8d195DrZNfG54E26lnDbonDM8Yx9ZNaJc+PgAZPpffYrnSOyQTdftdv3BWRsrPM+6AnOJMKAkYHb09A95beQItRYlo/ghh3a0/dY7H1uA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(18002099003)(3023799007)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fB4Ml3dqkzyovLMkrXa6l6ccIQjvnmSYVDtPQT+m5HzZGjvVqK1eLjAt+GwL9lx1azjmVr8E80vJE/evXQjYqLajs+djZxtSf4auQDfU6i0SKWmUx6TaX4nkUsaRTcCzNaZwZg23pLbmwpG2unbgSRXV7KC3Nl65qP4Ktv9q/dconrdHKQiaRTU/mCq5bGRhQIbvOHTaWAoTvRITAQ0QWX2Lk+t9bRIS0aUzUrFBNjKiZ683bgi01FbhVlXb0iSpLlAuay3efpBpRaiKtr6p8AnOwdRl+KN5/mQiaa4E7gqKxxTlts4t2H1G+E0rb0rK6FoJ/WGVyx0448u5ngngdCm4K/REpU5qVuvxNngmHrvY7I7pWs5JSVfsRkpkWG/1d5TFQiITxH8kC3q3zgviuLCavYq62m8mXAC16+lf273xxj0j61Oqxypy75R8m+cR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:03:27.9962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ade958ca-dedc-4d74-3e68-08deddcb3b97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622

GSP-RM needs a larger WPR2 heap when booting in vGPU mode. The heap size
is firmware-dependent, so it should come from the generated firmware
bindings instead of being open-coded in nova-core.

Pass the detected vGPU state into the framebuffer layout calculation. Keep
baremetal boots on the existing heap sizing path, and use the 570.144
vGPU default heap binding only when vGPU is enabled. The same state match
also sets the VF partition count, so disabled and invalid 0/1-VF states do
not enter the vGPU heap path.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                   | 25 +++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs             |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs               |  5 ++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 273cff752fae..e93ec46a6602 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -23,7 +23,8 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::FromSafeCast, //
+    num::FromSafeCast,
+    vgpu::VgpuState, //
 };
 
 mod hal;
@@ -171,7 +172,12 @@ pub(crate) struct FbLayout {
 
 impl FbLayout {
     /// Computes the FB layout for `chipset` required to run the `gsp_fw` GSP firmware.
-    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Result<Self> {
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: Bar0<'_>,
+        gsp_fw: &GspFirmware,
+        vgpu_state: VgpuState,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             FbRange(elf_addr..elf_addr + elf_size)
         };
 
+        let (vf_partition_count, wpr2_heap_size) = match vgpu_state {
+            VgpuState::Disabled => (
+                0,
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?,
+            ),
+            VgpuState::Enabled { total_vfs } => (
+                u8::try_from(total_vfs).map_err(|_| EINVAL)?,
+                gsp::LibosParams::vgpu_wpr_heap_size(),
+            ),
+        };
+
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
-            let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
@@ -265,7 +280,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmware) -> Resu
             wpr2_heap,
             wpr2,
             heap,
-            vf_partition_count: 0,
+            vf_partition_count,
             pmu_reserved_size: hal.pmu_reserved_size(),
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a2e8342e7760..727b8ae4bcb7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -50,7 +50,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu.state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 2590931262af..3088ad162706 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -178,6 +178,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         }
     }
 
+    /// Returns the WPR heap size to reserve when vGPU is enabled.
+    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+    }
+
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes) for `chipset`.
     pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index ea350f9b2cc4..afe3e007f088 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -40,6 +40,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 = 14680064;
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 = 609222656;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
-- 
2.51.0

