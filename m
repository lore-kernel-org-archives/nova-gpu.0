Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4734A796
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370492; cv=fail; b=R9JZyKhgk5j3Fix2yueOyeyaM2GhaBeYUtYiTnRbwvGAhgJKOfS40CBmyc3I8+y/Zr/1/lD7STzqV8Xd38pDLzJ5XT9juYAiymkrhV281/fc6wmUMc9lUh1EixGNkjLHonUUAN5ez3/FxTuDXq/EX4+o4tG5TUqLAsua6/Ckvxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370492; c=relaxed/simple;
	bh=PsN9jpI14XH07AzAXGLYlSXt+RSQk1qp5lyk+/MFYCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R9I0SbodDGh9ufeMLAw2+cL37XgmqEYEP1LXKqxW71GKOTVNgUZ0LCsSOKgwQf2ghdKRTS6GeD5kru/Fb+4bRq9MTBs6sWZmDnWvVDP5+Wfm1I/qRZ44UKlLO/YwhsQ0nJrKZX3B5zVxECpmrrHiwiB6Bw3aUBPIibmXAFTWrvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PebQNVpS; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PebQNVpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj6tBPQwQUoJhI9vK+wvR/QaZ4xrBnC7o7kLnvTxfuIdK7/mVQvjwBznPoAWxrp4V9JLk/ciFfg+Do5te3GpdO8/cKUXvzBVATE4XuRtauExC+79JIVmNRkS4qo6XR/6MftD80fVzwbi1StmOEYCyiFobD6JdcwI6089j9DopC02/VCOd1vhK1BVRTweCi1s52m4sTIP4v2NA0dMtwkKbCq0NWnaWO57q0oPJKXLJoIqTG4UUbKhISZ9E/dcWBxCEqhfUTCK2w3gV0lmGxQC968gXD9pQEtZOadpV/RYNor1CHKSRi3+cMQkvWDOqr5ZwAYOqH7QJ9WNzZdBUIglwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3VTFiJYueEM0PSQ/kv+rYkBFrsDuu7u+Xs/wnp+syI=;
 b=EusUZCqvOpbAaykBxPNvyA/DqxZtayQKP3z1oAOhfojNy+5SMpzf7t0bs2cDUCjg1/rr4wb42fHu4Rbjk09Bi3QaSlj+DK/mGYfwr4gWRzLrQD5DI4WxaXBSt1lN8DzSrKoCIW5A3oafVP9TqZhlLfxrswqJ39T5TU1DlpRzMBpq7fzuqndPExzHFI4S1ATTF9hVtabk/wNctl5xtXt9M/1RHAQwolgz023sE93Z7F9z8uvKvC0At36wQiA3kODU/87Wm3E3vu5dLN0g+gUIUfAw10We+wYTjrigG7ZbRVuxd3ug5jtfMYt/eEX/LgBaR6hl+yfdOW3+w7Rh1tCiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3VTFiJYueEM0PSQ/kv+rYkBFrsDuu7u+Xs/wnp+syI=;
 b=PebQNVpSN0Ice+W/J5ahFwDA/urdGU1DBmEKI8Jivc6hiDdu5BomK2OkUzPOnUPAxmrcUCybJjJopcZqZc/HN/tBB1i5W8l88G9vta15ly/VKcIHhfNsc9NJBCpjRa7y1SaaQKvLc67DwYgfFZfyNKp02PXROXB38KFRMF+RG7ZIYcb+LsVAPemSUxBlPD7UlOrwT1HHhCkWDmbmIoyu41NvqfwZ/qbZpvbGQI9rugij9vOBujt5sJVL7mMBFoIBU2NihSmDmA365nW0yRkhCpgkLb2ACAH1V0u2R7Ed75u6bdXTEX29IypUHADJrqENTMfjjFxZ35GUdXGQ+dFFAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:16 +0000
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
Subject: [PATCH v12 02/22] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Mon,  1 Jun 2026 20:20:50 -0700
Message-ID: <20260602032111.224790-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 088cffc4-6b34-486e-2e87-08dec0560191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Gg/giZNaazdcVzmoh6cQZZiBDg0QlEwcAC73GiikWHr0wNRFXLOnelkWovxTOd5DhdVWCCdQcujmgEqipZ55gHtQWWxxtPMKRjvGJc/C/9XVVuzYxgmjWnh7ZWNRf6sD2rL0x3ECG+nhGNJ8ubz/6H2+lovaTjNps62iv/PNooqdPGdGJUeR1b6eLP86xaLSvjkrZkhWy1ne25B6iRN44O84oQYuliZ1wWPbf/yXDPQZEmz3dQK6XbtkrAQT+ZYT7VvQ2qGtTgCd9nXnp0j6xCDQefQMiSqrnvAyMS8hD5oZ4TF4ran8Lt9tD+D6yB2dCHbRSo2jHdb/JjXDWH6i5L0P9yKYVICUUUyILozO0jCiUlZ/HSiuNSoynfQsTqhyQ5SWpwT7oaAipqjFdv62128lDf2G0KQdjIsLDOUGA3r7tGKYsCo4NaZoBq/zUIxCCOhafVOFZyTREhKuBWejOTacs698+uULcm9e+QN346ncVaGiy/L6YDxiJyeLXVf5/hCtEbEHgtSoe5Wdv4rRS8jCJawpAK8mhY3FY5eFWOGwc19y9PU0tEsmDz1I5ljj3Ky2Yq08WoxvM/c4n+AL2oiDB248xyDvOTvhGkMbN/V6pz4a4ph+8/3y2tz4nQppzfiCSBYbnP+P8NPU1rUxwOUUp7Rkykti+ReWIM7+xhjvq8OX9wGnHpCaE0HMz86C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zA0rCusJwJ5bqqhs2kxHJFSsU759FeHjmu9kYIkw1VVoX2ZKyN4d8F1I+x9F?=
 =?us-ascii?Q?XTir6NpRo0hCDb6B4sA1MhSh9m7FRJUuwecBA/vdlpvrUnJI6rgxyBC8mPbu?=
 =?us-ascii?Q?vNxHtHKhYYQjrvdd/BswYXmOz8JjPm/8j1sSaL/E50y8zSHHBK/wFaQ4ysDB?=
 =?us-ascii?Q?Niuv67bnpRq4lIuRJ0GIAHSku4pFx5zuy05Mlr7C2Cx8K87JsncViSQYRl/7?=
 =?us-ascii?Q?bCGlk4ZWARQY1sUv/iHMPMbquUPtS+MpzknTe3/JDTh48upk4kPulR30AJQL?=
 =?us-ascii?Q?Ypo/DKeJC+EccAuyQVBO0LHQG8KT1ASuxgD349WnlpLdQAMubsqmKKeu29mm?=
 =?us-ascii?Q?rFr3sczOJAvyNxY4/lNmU2QQ8rL9QopPcU2nhFD1Jiu8NA+0s9NSRLcNF5WH?=
 =?us-ascii?Q?/ZVaryezXsc85lgy4yfEgrMD6/2HUExxCMSFzx4Q4jyYq7PTtrxRcoBIGzS/?=
 =?us-ascii?Q?i7yEcbJLbKeEDcuEIo+dq5UnElfrkmVAuyVwz9ey1KCT0FN+XlEgC3108Eop?=
 =?us-ascii?Q?AlSzeRPHf3B4BBOnGYK+/wysdSXChFEu4qLMVaPqSlJG1kLeZzLTLnw63mMv?=
 =?us-ascii?Q?z+vInwat8458NvE4wygj5A2L9K48LA/MAWV/R2kcZ+tKogHyrUBUXLFdnz53?=
 =?us-ascii?Q?9Kg3+7vAfxxHyc6l21PjEiaUQMVVDwgEB+ws3UQKcAAqWEOBjyn7HwwC9x7Y?=
 =?us-ascii?Q?CPyWEYAPuNJCVZhLSWU9Q4Y5zFMkr7MRkkQGCRa7aFrrJhLoJgHM+2ytH11k?=
 =?us-ascii?Q?mV+p0ElO/aAu1OG/lEZXP1S5cF54nSVXlJPB8qMToz7r8basQK9A+VrzEpzW?=
 =?us-ascii?Q?ZOtru/OeUfXSMtRSXtDsdEYw5fghFGM/3V7pxWWZKkAWk6V2z4UUFBWo6P+F?=
 =?us-ascii?Q?FhvMg/4ntjSu04SmXBh7tqYz/lglaFQ2AtAT9MW7Tq9SDDWq4PS9hYR/FSAH?=
 =?us-ascii?Q?vZJShE2py5VoIOWC+JnrIhz15ZIhQgAAwGhvei+PFac1a63eacrNxz51wH6D?=
 =?us-ascii?Q?yokukR4dLP2uryesRP5yq8GhNvv+GyXFJDyynDnQPBAY0nGM0+dZE8j9i9YM?=
 =?us-ascii?Q?WplSWu3HvgbFM3avK5vYOeSMHf8dN55nXgikvliQsPK4fJpjh7TMzuzuPK9w?=
 =?us-ascii?Q?S3nMaJH0rPY6BRUcXQ35CS5k1pkMRkvkgfExRyDAtmBfkkighghOSUmV2Lfl?=
 =?us-ascii?Q?a3YsEgy0edRYef5N7m4lxOwP10XQmPbl94JP/R4yGwhLn/WcqfhezR1qUblh?=
 =?us-ascii?Q?d4EcPbGYfxjHDPpEdmRkSxB2/JMUA3zmRtmDJtgGNJokKOnGg8bspweH1aKJ?=
 =?us-ascii?Q?CXxllI1VmymlfI8gqvA/idL20l98R0J6K2snq6oVvKT0xmsBFfFyRnJuzo1o?=
 =?us-ascii?Q?RywzEt8VoHSHl07l4mb27OXnCb7eabP/rsE4vvYmZDhG/WAUBpLe+kAe32IC?=
 =?us-ascii?Q?J9VVqVs3DI01gGH/zHnWQ4mDDfda9Kq4pPcZfxEbZq+q1rXi+CKWAfHDKUMg?=
 =?us-ascii?Q?u2d9RBaMq6EhHyl7dVbREcjvLWukK5lVepMFwc1MjuRsfZiqSMlMkWkBYbzP?=
 =?us-ascii?Q?n8urq3GK3YsENpNS/CS/xaWqCJsGHTFUBuF46qKvl5wtbx9S3Pwb4SIAEPv/?=
 =?us-ascii?Q?0YnNnk8Gnt4WnJS/rabEm1jUDKpkXRoP6kW/hTCg7Du6hMOPOrr1T4PRjSmv?=
 =?us-ascii?Q?vKNhRzdSDXf6bc/FIXGYQru7dQQ5dbd8hIjDZ18Ya1bjoAwq3aQ0mkoj8vD7?=
 =?us-ascii?Q?l+Hrm7s+fA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088cffc4-6b34-486e-2e87-08dec0560191
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:16.0395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GydUqtdkJuls1PaUmrWY9w2JW26MBX0N3QRIE+iolXiAtsUL0YcPpZzAPthXlF93GEAxqRIQaSvv/LZcVFUHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Hopper and Blackwell GPUs moved the PCI config space mirror from
0x088000 to 0x092000. Select the correct address per architecture
when building the GSP system info command.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs             |  7 +++++++
 drivers/gpu/nova-core/gpu/hal.rs         |  5 +++++
 drivers/gpu/nova-core/gpu/hal/gh100.rs   |  9 +++++++++
 drivers/gpu/nova-core/gpu/hal/tu102.rs   |  9 +++++++++
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 15 +++++++++++----
 7 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 38c75df77e16..7dd736e5b190 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     device,
     dma::Device,
@@ -134,6 +136,11 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the address range of the PCI config mirror space.
+    pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
+        hal::gpu_hal(self).pci_config_mirror_range()
+    }
 }
 
 // TODO
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
index 0b636b713593..cd833bd49b9b 100644
--- a/drivers/gpu/nova-core/gpu/hal.rs
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     prelude::*, //
@@ -22,6 +24,9 @@ pub(crate) trait GpuHal {
 
     /// Returns the DMA mask for the current architecture.
     fn dma_mask(&self) -> DmaMask;
+
+    /// Returns the address range of the PCI config mirror space.
+    fn pci_config_mirror_range(&self) -> Range<u32>;
 }
 
 pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-core/gpu/hal/gh100.rs
index 41fbabb04ff8..17778a618900 100644
--- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     prelude::*, //
@@ -19,6 +21,13 @@ fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
     fn dma_mask(&self) -> DmaMask {
         DmaMask::new::<52>()
     }
+
+    fn pci_config_mirror_range(&self) -> Range<u32> {
+        const PCI_CONFIG_MIRROR_START: u32 = 0x092000;
+        const PCI_CONFIG_MIRROR_SIZE: u32 = 0x001000;
+
+        PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
+    }
 }
 
 const GH100: Gh100 = Gh100;
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
index 2881ab03dbcd..125478bfe07a 100644
--- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -18,6 +18,8 @@
 //!
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
+use core::ops::Range;
+
 use kernel::{
     dma::DmaMask,
     io::{
@@ -85,6 +87,13 @@ fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
     fn dma_mask(&self) -> DmaMask {
         DmaMask::new::<47>()
     }
+
+    fn pci_config_mirror_range(&self) -> Range<u32> {
+        const PCI_CONFIG_MIRROR_START: u32 = 0x088000;
+        const PCI_CONFIG_MIRROR_SIZE: u32 = 0x001000;
+
+        PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MIRROR_SIZE
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 087ee59da6d9..8c316fa2e585 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -144,7 +144,7 @@ pub(crate) fn boot(
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
             .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 3a365455d10c..f84de9f4f045 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -19,6 +19,7 @@
 };
 
 use crate::{
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -53,7 +55,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev)
+        Self::Command::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 42985d446bae..7bcc41fc7fa0 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -11,7 +11,10 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::Chipset,
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -25,8 +28,12 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let pci_config_mirror_range = chipset.pci_config_mirror_range();
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
             gpuPhysFbAddr: dev.resource_start(1)?,
@@ -36,8 +43,8 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
-            pciConfigMirrorSize: 0x001000,
+            pciConfigMirrorBase: pci_config_mirror_range.start,
+            pciConfigMirrorSize: pci_config_mirror_range.end - pci_config_mirror_range.start,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
             PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
-- 
2.54.0

