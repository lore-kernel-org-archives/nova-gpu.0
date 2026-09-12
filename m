Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3395D344052
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188274; cv=fail; b=mdRAbaebd0SEpf9MhWzjUilpRdVEU1XY8/Rn1OsYHZB9am7PUzfJZQQEEYU4jps/isK5ovH02+JKksQh/6QOTPFn4nUCUJ2VSrPQet+7d3D3Kd4MypCriT6fWi0j9fHuFser1ocrf2Qzc5cM2dPZvT3e3EcECwsIQ0WI/Er/Afg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188274; c=relaxed/simple;
	bh=yAqZQB17NPTN9gw3mLDBwn8KPDgc3pDD3TfXlUQJSjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tI38sLILwqp3rl+nL+XRhI757L4rSCZm6qV3Y2KKaKVWWwSz+ZcK/h1rOf3Qg4YDhr3MmI/xQanpXgZp2J97JCcXICvTaLGICjLFx30nvvU0Q1nvFh+qfrl+OQ6yfhfib64KTihgW3EhQh/KI7aKpvsiO0wzlzYLklWEaM+FPW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I5D7aal6; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I5D7aal6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf+Xtaq5/Xitd5HvwLUwJRAESOavxfsRhd8RrWJENQ9P2Dxhk+AljsAnkSQLPqiDQhVWrpvFW8CSBIStctuLZeTBBCf9+ixXZgi9QbeW0zWYI7+hfX8sSCfNM7Yxyt6Ja9gOs55JDNOJN4XpFo5/E2R6W5i4srg+HygvbJLzpsyzFw3Y7A06p5SLns1N4SNIY0Av/hHySo8DoKoqi3YjQTX1xca4oTpQwehI3Fu6OBdPpMQYWdQo+5lgZJGhvaV9jr/1IsShuOrAcYgkEpMzJPRo9DoGjjJVbV8ili6KI9qk/w139vFBWGrZdK476pPS6EN4tF7r4b0gJ/5sfFFVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9057YJXIHyFmnegK6028OQiCvMEog1zkEo3h74dStk=;
 b=dWmJa28GHSJOYKIrDCzUtEjAWYhgPMdUr2Ga10ysAcmD+Do8sKeBc0FzUf9hYUeGV3H8fhwNRVCuWOmslUi5la1izzyW+RbxggJmU66mjsl8zwKR9s882knC8H8jt05upjSqwXriegoFxyYZJCZt3nEpIR7HBooUW5bZunJQ6dtQCkONAptzBkm9eokG2eXJcavSILG7SadzxjmTwIdtZhRHLxV/r1qmVlX2qsoPDbC6XwwJOQPGUDtfpMZdd0+jAY4ichAYtpgTwToQSM4FVOtgriSR51aBAgn6J3WefosAY00meDxkdguIOsg2lJcv+QfQr785SP1yombS7Ck6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9057YJXIHyFmnegK6028OQiCvMEog1zkEo3h74dStk=;
 b=I5D7aal6j00kEGgek5uZc9j9gzvJinobsy0MqoVZlrI4jChb69ZHmskG+wr5eUhTbPz4UqN6tzk8tPH/sSeIQ/vYn+07Jit7ju2nqFY04OWgcQlZSJH03uzE8vJxyCycaLpSbBtRNy+3ezIyUSJPCeWxAFH1ITR50xzkaCozUHb1MbbINWVzHd6WQlYmaZZwDFOM9DY9Yo8zM3JWgTl2yHPgXczCo4CPd+3ZSuuTAC78f2crGdZIkx0qgxsg+wjzDkoF+ripbI49ng5xXOua1B7SSjZz3irEwrEbXYd5NE2t30pWPI4y+XnY96BnW6IYP7EJQR5cil11mQzawHmiLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:20 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 07/17] gpu: nova-core: wait for GFW boot in probe, not in the Gpu constructor
Date: Fri, 11 Sep 2026 21:43:50 -0700
Message-ID: <20260912044400.677097-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 9937b1f9-615e-4f09-5016-08df108882cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	30kkApuRhFlg9nuyTP4ZCPW6vQrHsSpKWsoI+1J/sC6gvPV6LpE2qSyxoEYFfAYSquz+IfsTsQ9+xTqG858FviXJvB/Qo1B3Dt9O4LkWa55yue8BM1osp66v60Mh/nl27PEMevo0hvTe2PmAoHtirZTWg4V7U7d0iFxqIvUxweEL8XW+jrNKCfIX+nvxIJ03w4vwFDw9v7K0tbp9RWu6VgCOlWQr0SFpI3fexejTTybWHC79wS7QYC7HqY4AgxmQXeY2oZp3ijz3fSy3Q0ZZwOP7CJdD3+OIsLqfc1KEh1HfC83YxyA6cbMYROv4p862Na1zTgoqfT3N27bHRITIY3AMICRqMePi/D+Qai5LTErkyOB/zeT0o8xmzGkBDHDJxtNRdNl5yrUeVDTb3SRe2xcZO+pQ8XGNBIFxIOKMpXDKyySffESzA8Dc3CQL34UK63gI4E2bQthw5HUSDOc+Sc4Vrv6GSySnHuW9HK04fQLFzOu3OlOrBVJt3w2B6daqILo5mjvbMM7Gn3dFrhAShS0uSncoLXZ50RWexvxKzUL8Vk4sg3nNAE62c9wzdz4H2TkKB7NyEKhB0Ueu93pS4inHHq5EJ1bhoT2iP7BKJEt9C175i5C72lrdxdiGBwi+YUwg5Ci5ATEn7IPR4iZzO4SivjCPFdYd6BIYVanaxs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vChn3mWvtCANb+SMgqGuf7ZjCL9K5WUT3ZuRkH1D6lKseeFsm8pqz8lCBiX9?=
 =?us-ascii?Q?84IxlFsbfKN2vn28WfTfmuTS52mBAHWbgpWw3jjak1bc04AKJ70gXdqG0AMv?=
 =?us-ascii?Q?TLsjx0uU3v4MbKpqNhyii6af1dN+VnPCXzYhsWQY7OYLoGrv8NzKe8sAqYCI?=
 =?us-ascii?Q?4E1ZlR2e9twdIiTlYpTf0ny0jslob2ipNXvMATo9COBOhkLiF9RR/XWn4ZaG?=
 =?us-ascii?Q?Dl78DOekYTdqoRNypJLJXKE0X9w8DUVeThlkDuQkqpEqULo/s6gTQ0Yrlhc1?=
 =?us-ascii?Q?RDzVg6Gitj03tI9KkWz6XPrEbXyuvNIqj9K9prRn1paEf5kLAhyc4B1Qx4vP?=
 =?us-ascii?Q?dM6js7x/z9sFzrvrdT76az44ScApjAkfXnnx62yTeXhRTGhwd8B3raW8lTv6?=
 =?us-ascii?Q?qHNZOdEh2/FcWFbfOWeDZ1DLuMHUV3Pc+uuWmGzCriHFWD6s2epmizaiPhIL?=
 =?us-ascii?Q?EgxMQ9+wX1PcFTyKpoybVeSFrmBoFBrx+/vduxvLf3kLK+wNSpXO3lzkK4rT?=
 =?us-ascii?Q?Bxq3WasZzgQknuOhG0VS2lCj9c93hBaTKFIouYWwOXPMbAszFeLiZa4c/U7O?=
 =?us-ascii?Q?hS1dkRqCpFLHdJDua5oUVi/2hfyp7LN3HQtzPGJ5F3no8p/zvPWvZ2Znfjzw?=
 =?us-ascii?Q?IKl6rvMtJP2VMyFtz1lBGILDOiUZe6CAGg2CoZHJJojt1bEHFney6RiOP8z8?=
 =?us-ascii?Q?x3Xt1QKYcXGDxcQa0bV067XC7pbuAh6K6HTJtqHJ2sxAt/qKdb57+y8dpfDL?=
 =?us-ascii?Q?GepPbJ298BeTo+i2Ay9Q+U2BeUasznekJDT1qaO0n4PMtSFv69dIzopItzyA?=
 =?us-ascii?Q?5B6oyV0kHDH4Zc43fiBzEhptn6mOt25v6Wq7Y+NHSTOdjuFPSGWZhxqR/gwW?=
 =?us-ascii?Q?mWySQdnNI8ujz3BrD4FCxfH7PVzxA8eBP8AKrZRBT2CK2X8+WL9jrW+vjlQp?=
 =?us-ascii?Q?KXmrlk0wrBgkOhHdOrOu52ZDv0FpPzxkjKK9OO1tXF6PfdLwOHTkno4SRvpM?=
 =?us-ascii?Q?M1HeNE5E3TQSOI/xVHYWbZ6fPXm6K6eUvFyFKPFrgOVTZIBUfhLVYnsYlRFZ?=
 =?us-ascii?Q?JhMuzaye2OzA53CblD9Em5eVk11R3ElOaXVDXmpi7zQ2IBhZ1gcp+P1k2MOM?=
 =?us-ascii?Q?6ePPJrZt+OWCbfnDMhoPvml0MsY1Q4ehTbMWjCL+m7xO0Hj7E/oSWk87Pxer?=
 =?us-ascii?Q?wrYr+R4UI/tMAlRsVdr4aiNItTePc76tiYEcsrw7tdUd3nhy5+tPxJRykNvy?=
 =?us-ascii?Q?sejmPZUZZnM1GmRX4EAqc96WrV3/+p7YidrVc3DXpVZ0fH/x6iwCrRvS+soW?=
 =?us-ascii?Q?p4QJbur2MYC06U6iddluLqF9L9UbFodd8R/ukXBcjc3fv31UJYnBWaEBtFzx?=
 =?us-ascii?Q?0tenQ584dQY1urmsD75zJWVSZqxVW8nMHye5NEE37XYp9ZDZ+t0a7OiLzoji?=
 =?us-ascii?Q?YEXoCM6Rl2+ufwO+3nM+iE4m4vQxtguuEZ1A49oX3g33dID0hXmnL1ZSYhhe?=
 =?us-ascii?Q?TA7WlsyoHQp8yQOregT6thMDKEf6AInT+skk+xrUDXSnfm6WtQKRPbNhF9oc?=
 =?us-ascii?Q?ZXKWURHNOUBSsTo057crNUCHKbTF3m4aWkByhz/UOnh4sfevDIJCnB74NaUn?=
 =?us-ascii?Q?PRzhJPIoGBbnL71nouhGUekAMsxXkhICPjeL3iaZaiQEiY8Ym+iQBdVcad4g?=
 =?us-ascii?Q?wXleBqEtKKPhQrvAgdlupUdnBnwNIm5X4YKfmaXYOhnqkHAtkmVfIy3LIMU2?=
 =?us-ascii?Q?DkDXLZmA0w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9937b1f9-615e-4f09-5016-08df108882cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:20.7448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8F6XS8MXZna5M3X8oaofvqnPHKHS0EWXOkcc3NNUUOfv6I+07CgO3GNp5YZTFwYNUf8dXd7CKtne1E40ROmxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The GPU boots its own firmware, GFW, out of reset, and nothing may
program the GPU until GFW reports completion.

nova-core waited for GFW inside the Gpu constructor, which also boots
the GSP. Code that has to run after GFW and before GSP boot, such as a
probe-time hardware self-test, had nowhere to go.

Move the wait into probe, ahead of the Gpu constructor, and read the
chipset there from a Spec that probe builds itself. Leave the DMA mask
in the constructor, since it programs the host rather than the GPU.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 13 ++++++++++++-
 drivers/gpu/nova-core/gpu.rs    | 28 ++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 0672a0707a71..15a44f9a6441 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -22,7 +22,13 @@
     types::CovariantForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::{
+    gpu,
+    gpu::{
+        Gpu,
+        Spec, //
+    }, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
@@ -109,6 +115,11 @@ fn probe<'bound>(
                     let bar1_idx = bar1_resource_index(pdev)?;
                     pdev.iomap_region(bar1_idx, c"nova-core/bar1")?
                 },
+                _: {
+                    let spec = Spec::new(pdev.as_ref(), bar)?;
+
+                    gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;
+                },
                 // TODO: Use self-referential pin-init syntax once available.
                 gpu <- Gpu::new(
                     pdev,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d763bc8d3827..3d796d6c7013 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -212,12 +212,12 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -362,17 +362,12 @@ pub(crate) fn new<'a>(
                 dev_info!(dev,"NVIDIA ({})\n", spec);
             })?,
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
-                let hal = hal::gpu_hal(spec.chipset);
-                let dma_mask = hal.dma_mask();
+                let dma_mask = hal::gpu_hal(spec.chipset).dma_mask();
 
                 // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
-
-                hal.wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
 
             // Initialize this early because `gsp_resources` depends on it.
@@ -495,6 +490,23 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
     }
 }
 
+/// Waits for GFW, the GPU's boot firmware, to report completion.
+///
+/// Nothing may program the GPU before then.
+///
+/// # Errors
+///
+/// `ETIMEDOUT` if GFW does not report completion in time.
+pub(crate) fn wait_gfw_boot_completion(
+    dev: &device::Device<device::Bound>,
+    bar: Bar0<'_>,
+    chipset: Chipset,
+) -> Result {
+    hal::gpu_hal(chipset)
+        .wait_gfw_boot_completion(bar)
+        .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))
+}
+
 /// Reads the boot0 register and returns its raw value.
 pub(crate) fn boot_0_raw(bar: Bar0<'_>) -> u32 {
     bar.read(regs::NV_PMC_BOOT_0).into_raw()
-- 
2.55.0

