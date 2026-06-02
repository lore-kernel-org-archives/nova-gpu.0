Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E536A379
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370512; cv=fail; b=f5gIJ/6FVzKwTV7gY4wx6euhC8bVjeLR6x5NDqchzFvYdErOVYbqKixhkMMDY/Z1MDFN0RBp8N4Kpfueit4oP3FNu+dh8+/2BmtjFbwFOteDvVlVDmDafLIKtRKlB37niv2+9yMpYYKL3rSD8/V8F0fHt9/uWxp/SG0WJxBS2c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370512; c=relaxed/simple;
	bh=5CRro4xwe9+xNm/fX9ky10CDEyynE/FLJYd4CIAr91k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OJbjjb+7595MWbsLWLCayny9cGPYIyhNqwsQldX8+A6Y83XXj/ALwJfC0G/cSfiy3zCDBRSkQNsMIgIq/0NS4l5I7pqkYHduyILnqwdvD5/jKl9kFe3pk/Vq5HD9sNl+TwgX9bB5T7Jdvx3ImIQuVFO9FhhI8x9b291g4tr8YdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p8AaQXlp; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p8AaQXlp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJkxnheWhxxD7hSO02P7bJzvgMa1+Ljp03YgAxzsAmzHNxqXDXVkId6GS/UaO30cqXZLIm+yoI0ubMn6WNO82ngBepjfVA4U3IoN7GBFAOooQDpzSndxYQLem95gf+RtzsjwD8nkWGswH35d3Qa1vH0Vb/nAe9FRKSEh3NX2+QXn27cJC/ysi6hOLNdwj1x9uo9mt9HORUgqEuZsbFwc5tGMMjKbS5GNYfZ8LKqx+Jye83xod9VhwmfVCVn7u7NSPDUB9m3crjkCh/5mD/zebrCS46Yt6Qk+d9H8x6uFnEeJpeJcVx4HaxO+T8FJUFhqlU/eIGNCPe2EgoYhALCkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCwInahm/1odVSCz3lSwkbMNqk/gXRaFVKl/c3vM3iI=;
 b=lpb+O2zD5IW+vsIZjARf0mztNvJc5Cy0MZy0rjK+kxWjB33+jmE4mzkWDT2kPsHGjaiRGhnJWjF4L71g26xtjQT1wNN+YLSGMy0XJp6/lgruvH3JdHDDwRD1tHMH9tW3b8Y+lpZCJ6C2xwtPrmSD004i72YfkU5cog9wuUlV1rnrpu6dC3I+tDfX68cHg4/zxpYf4L/xOhWaPxl4h0v7VRzuEwSp8i41pbll6wWq/YD36Z2/XXK9Y7EeQj9AF2kmBqr5YKZeMAxftzJDp9UBeWupL9F44hdM+Fe++qDIAJlsS1Ikp18Ii6zEKEuXAhSv3vk9VxFA9eLD5wZ5NED3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCwInahm/1odVSCz3lSwkbMNqk/gXRaFVKl/c3vM3iI=;
 b=p8AaQXlpdWgqNMm0fuVgZQFBMUt/Lv3IyF80Rdomkl+9Nkf76LNYWQDFF4+6lDYU7EDTx1CqJuHpz86bJ/Obg391sXORe1e5y3k/v9blbVOxeu4J2/XSs4pv4m3P5A+CAXnvAZgGYi60j6HMI1drvo3t6QVMf3E9wB+9nM9PHxhZldqKpq9KWaKJd6UfRphY3jccfP+AI/ZxbK7+JW5Y0A8BD414HAaG0n35gs15+p4J2r9iWygPZL8V+5SGY3SymhVcvaIZ+UU0SjN9LJGy3227MMWhMPkgrrzvHo6qMDyArVy1Y+cXrtSxnKUs11uOvieKx/0kgU4lVJ/3FeujLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:27 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 11/22] gpu: nova-core: Hopper/Blackwell: add FMC firmware image
Date: Mon,  1 Jun 2026 20:20:59 -0700
Message-ID: <20260602032111.224790-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea76a14-8614-4831-f408-08dec0560833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oLUA1twlbaZJkb9sBcDTHmNXsvL5OR4kZFtfxBCiGCWiZ1/SohfhC+e8SrK9FoTcNsncrtr/CKmjYqG9+KR+gs2gWzDRyik4CeHeN5uOXIu+EBR/Exr9Xiq7bBEEE4tGz0IWKT1xeX1k1SyGOATMuOrO2Pv4qBkP2akkWbH35mdE6oARbmOj/9jIjcwYMSMsfOwqdlJ3xiwawqhpc0o5rRKdVycACauCZu+52V4gF9eoPO3wv7vTzq5m9saeANPIBfyDW0i7qPSLwc0cGWY/mp0hcTolmXnJ61FiDBXuWLrUZ2DsmvUsor79HoYIWNBP+XlfOk1QiSv6c0wZfdwn3T6mkFW/UA90zXt7/mAjwwNBEFi5Hlq3yvqVFNrs3NYLr7+r0/NWk3H3cdVwuBtFeOk6TQsg36uTQot7+GeBROt9B80TkLzG3qbp6cSCai7dqewNgt+lHT2RF3Y4AET9gX/38WSO08NdSI7Kum2sWg/DUyjvZMEX/YvBA/fgPVzhaYUoikguW2SYqrw+f0ns42ERMpzbiVfqg4nUwvuIRyxS2yXrlqBk35KafqmwCru9XztU6nTVDLszmZ4qK4Y/Wc2zewALEFvRRPXTqsRIz2FZzG7LiYLvELw4C4XhWJg++SWqxLHnZx663gaEDSmZc8aiyGGRLl+R9SKSNadGKdq44fS9RPQpsV4FD0FWK9Ne
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NptINTWJuj5rrkRYGfsLnW//RNKqxFAC9LuhCE+lndg/JVOmma/2S2S9sHkk?=
 =?us-ascii?Q?7+dC9AcEe1JzoTdpRd/h3rNKNYzFkuk5zKhZTFwFDiin+njEvLtUyglMZhYn?=
 =?us-ascii?Q?CALX1tOIMPRp25sU6L57ARibIzAC8AwJRhnbi/U0Fiix2s6qu+wK0pBUuS4n?=
 =?us-ascii?Q?iamNZxTx+AdIldZ9qfFo6e8DeTdKTg0ZZ+VILajZ8ZmYhRC0YXeXOhYRqps3?=
 =?us-ascii?Q?llZPrkaS0fbbG9drkaVwT+kAAU7k1zVzidkva6IA0Coj8rZ91Nw1gF8PvhTa?=
 =?us-ascii?Q?HqocGWMjNCxJ9Q69xUYPVhcqaMkKwhQG32FC1UBhu28gl7LroGk/8+Yp8W+D?=
 =?us-ascii?Q?ThcCdO2QQVDNjKf/vxRJIv1Hw1A7nsr9oUMpumXHjoT0A94qBSxIOZrHiuDC?=
 =?us-ascii?Q?0lzaJiLFzDQJOoN+at3CO5F4f0qGn8iIoevhQ9t8zNYazQ5hUNGmTGkHGSPD?=
 =?us-ascii?Q?hH0M7uJmb6YZiZiQBCbFrn/+x3rcHLI2NXVeTt6iWv2Fw281P8zCGVn3t35g?=
 =?us-ascii?Q?Jxrixj4nos5ny7BjAl+z+QZ3EFjNoVRcs4ehAFVXWlPV+O6Kbzqah7/d4zYj?=
 =?us-ascii?Q?d0yB1YvRJ+tsMEMoF//jeL7fG3pLbnScRJ02ILXVgAhqBkgFhGhVSzgdDUTq?=
 =?us-ascii?Q?oF0Vm/v07wpu+UMAczXG3tSf1+SQ8eaEcGJknAAkrp8IymHAYhFNJqNLYHFq?=
 =?us-ascii?Q?/ZfEd2VLmPTg30+msQH7VW7dkKE5+MmJCa/J+V3le4tM6jCg/w/YWUFoluBG?=
 =?us-ascii?Q?MqbHlTxo8eRhT8B4ZR5WaqVWRAk9LuIbUW1P4dOaqSSTvmgBHa2+suoMksE7?=
 =?us-ascii?Q?FVYyyOPjjpg3S4bo7v659+G2B2Fhgd5VEpBaS2pwKG8z1rr3eSh4qnYeZ7Oa?=
 =?us-ascii?Q?O7/uDft1RWaMqv7z31wNuXJ+oGASxKuIlIaOsCTqNlh6m/dUC3HmM3accXcC?=
 =?us-ascii?Q?RutHxFwgEB/9oHw+uIgbf6nbkw5VPCQ0j5O5GEpNooVl/oXe+ExwfsaCTdjx?=
 =?us-ascii?Q?aL3tu86q3c77hh99tEc0R4bhzggwmb9kaQPYgZaWtyZh8FP5LbPySSZzfoV8?=
 =?us-ascii?Q?NgVcuuNIcZmHFB2lo1tWk33IGpke/WQKkLqxEqiG1ks8p2xY/yWs1O/QJ+VK?=
 =?us-ascii?Q?V/ys81b83NNk/n8EJomt2nAyHn2mYvaRKti2HpCNSKt6jqHjQrLFs2sYtCbC?=
 =?us-ascii?Q?ao4i/GKV/xOCo4OJRDn/b6AqHzWqVV6tjzzrnMZShWSXSdkEG97SqmMzV8Tb?=
 =?us-ascii?Q?hurEBFXTyKEKfVUVXe3BkdTqLHBBcfTmqKIJ+hmRhu5F3VIJRPgFiDOZQodR?=
 =?us-ascii?Q?O2Wkd+rtQE9yeAAFyLoAhkwTBZv6RBEU7p2BjqhEnG+B1Z9DWwwQaK05onus?=
 =?us-ascii?Q?htVfj05ajiuXbePJzi4HeEBKfduSshf66ZKHNJA4Z8xO9UuxvyJ0l2//bZIU?=
 =?us-ascii?Q?L4ul13t6V/XiGY8iwUMfO0YuD9/1rANb2pLGXnaB3pwxha9hzFR80z9pwK7M?=
 =?us-ascii?Q?+4tt/nkPlxMMKxJLWiGekYIT6LdOeOnbNDOsSUhQOgeCqQe1zubdcqDOPCyr?=
 =?us-ascii?Q?WBC+xkrjbtU7wl/mLNlOePvI6fnjRViaHXCL2oNgv8TvPkNOvundNFx1LZ3b?=
 =?us-ascii?Q?2w65uvZt1rXLP1pcduCkC8hhFbR+htoAv6w+/fARjivvEEHdFfAKRsIuVKX2?=
 =?us-ascii?Q?tnpR2LLSfMUKL/yNH5WmKKA6SlixWhsMJwuIoz7bT6b3IRqUnPxrBL1sxLvz?=
 =?us-ascii?Q?K6VYxMSVpA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea76a14-8614-4831-f408-08dec0560833
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:27.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWHOykjQy7DqjI6l+xliN0rN11xks6ZGe5wX7i+Af5aT/bBXm4acIV94rOMdHaT0xvvezI45Ii9HPwZDUrcy4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
Load the FMC ELF in two forms: the image section that FSP boots from,
and the full Firmware object for later signature extraction during
Chain of Trust verification. Declare the FMC image in the module's
firmware table so it is bundled for FSP-based chipsets.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs      |  9 ++++-
 drivers/gpu/nova-core/firmware/fsp.rs  | 47 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs           |  9 +++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 10 ++++--
 4 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 87588cb24f11..366d3b76360e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -28,6 +28,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
@@ -431,10 +432,16 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
             .make_entry_file(name, "bootloader")
             .make_entry_file(name, "gsp");
 
-        if chipset.needs_fwsec_bootloader() {
+        let this = if chipset.needs_fwsec_bootloader() {
             this.make_entry_file(name, "gen_bootloader")
         } else {
             this
+        };
+
+        if chipset.uses_fsp() {
+            this.make_entry_file(name, "fmc")
+        } else {
+            this
         }
     }
 
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..011be1e571c2
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    dma::Coherent,
+    firmware::Firmware,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    #[expect(dead_code)]
+    pub(crate) fmc_image: Coherent<[u8]>,
+    /// Full FMC ELF for signature extraction.
+    #[expect(dead_code)]
+    pub(crate) fmc_elf: Firmware,
+}
+
+impl FspFirmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+        let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
+
+        Ok(Self {
+            fmc_image,
+            fmc_elf: fw,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 7dd736e5b190..b7341bde04be 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -137,6 +137,15 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
 
+    /// Returns `true` if this chipset boots via FSP (Hopper and later), which requires the FMC
+    /// firmware image.
+    pub(crate) const fn uses_fsp(self) -> bool {
+        matches!(
+            self.arch(),
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x
+        )
+    }
+
     /// Returns the address range of the PCI config mirror space.
     pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
         hal::gpu_hal(self).pci_config_mirror_range()
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 9a4bb22578b3..9681f9a73e86 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -16,6 +16,10 @@
         Falcon, //
     },
     fb::FbLayout,
+    firmware::{
+        fsp::FspFirmware,
+        FIRMWARE_VERSION, //
+    },
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -35,14 +39,16 @@ impl GspHal for Gh100 {
     fn boot<'a>(
         &self,
         _gsp: &'a Gsp,
-        _dev: &'a device::Device<device::Bound>,
+        dev: &'a device::Device<device::Bound>,
         _bar: &'a Bar0,
-        _chipset: Chipset,
+        chipset: Chipset,
         _fb_layout: &FbLayout,
         _wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
+        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
         Err(ENOTSUPP)
     }
 }
-- 
2.54.0

