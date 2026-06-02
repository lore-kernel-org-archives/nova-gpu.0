Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0536A36E
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370512; cv=fail; b=uDMtJQnoP5r1grFi0UcFHbE5wXvziadiQdYPO4cVX8wqpgVzy5Vp42wvlCDjRVnlZrSDv24eQtULzPtCZ4zn8ux0qHzcr3cooSzhWQDgN69l8236R7TLBxyKbh6nn+NwOOO2YJsC3P043yJVTUln//yved2hBjGkCaJDQeMkJ+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370512; c=relaxed/simple;
	bh=wVYKaUnjTdliTRtjcj7bMqLR8wN8lGgQAEpGIV+I7lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RjOdLXY7M510PrvoS8fvwRyL+jKKETGk/f1YWGcU9rgmZ/BQU+Te4fMGdFEZ5zWG23zrZQU/87AtxeKADGsfllhv9gz0xPib9DZfeEnEeY0uPBZOyptiriHgZhyXVhkj3lNrYTjiH9ZKum+b9IdIG/Dp539Gja7egMBMtSbJqfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I+jTT1E5; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+jTT1E5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdkhSa66g08sY5dKZ1eW8j3NRgJFMzJHzJVQSxO5cwmEEcZYiNZJraZQyxG+ZvST/uGQa34trMp9STZyh3eu6y44NfSUfl7MUDWQXzY0tcZ0TxeJKCKgAo0zZc6vROXhxUPoDwVcUnbkETuK1gAZAQkVgS8B0Osj9Za3cOe+h6ZXKehaFWfgmuZVrEnInUPyiHo/ATSzBhrBR0n9abuUqTGV3sLUvpSqsQy1M2QJpAypFJkZH+080SDH/n74Pv/1oFmU4pvY0QSfllHvjGRn8HMI5rfUOxZ++T3fgwGjt0OLSDEy1cw0mETti903XlV98auqsi3F4vvJLlXetFNgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w3tPw8J7102oSxgpRL1Dh1C5PBDlDmTH6bZWKGFjcQ=;
 b=bQp1LXL9SbsRCtxLEjI/aNxQv7XZi2sD7D2/TgCvwRJPUorHxQoRLJZyesc3Dq8PfWl1sehkePylE22Xg9TAbdsYrHrTAHRui5Ab4kudE4m5H0QRExDnTBNmsvr5ZP54I1ugsNt5XwN4qcLc4iCEmfV8tP9UDXfVXeyFECSJI+3qv0QXQ9ZHcIjsond5V+73rgzrPGeTVRpk2Tlo63dj18f85E75KPF9kLx+1jiJgMKzcJCCSlg23Q2lwUHC3sUgXsJHF+EPprEF4+JTijltddxUgZWyCnNOGdEcvyX9qwvuXpEKRVD4KO0+ZEBAoiSfJVCwmBHqCUI9U0kz8HA80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w3tPw8J7102oSxgpRL1Dh1C5PBDlDmTH6bZWKGFjcQ=;
 b=I+jTT1E56dlVKcCLydSUbFVQ/jyEZbJy8+FZ9VO9jKRNvwaavMiWul2o+KHyuKsDpZPXxP+DDf9CuaMa2f7cn2AJDVmImXMYVcDOgZAhjxPco4PLU0v3V9ZNkKPUcujfaceBPSTmK7CL4YI5iizM3Y06ecKQkvxRoYUdOKVrZ6gFpIA3UGPeUlFyfKNFjuX9qsTb28DcrFKm7l+uokxFLA9HB3hdV+hytiEa6CD757tFcLZODvZrT16uuQvK0JUY07OLGnTnYhCl7CJYQWY0ljtVKxdJf5sOform1nDrY/YxryRtYGJUMPecOT4lEQ74pw6BnR3WyfghfXuWfUAvfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:38 +0000
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
Subject: [PATCH v12 19/22] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Mon,  1 Jun 2026 20:21:07 -0700
Message-ID: <20260602032111.224790-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4f67db-2637-418a-30a6-08dec0560ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|3023799007|18002099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	501BhV4V93kaAZSOUnz5cFcQRpI3stwxjtWhtwnsTI+Hzrl3HHuxRemAVxEm62/ZB1lQJuBAzAuxICE3CkBhx9mFkxCIgMz8nPFzThT09qnR8AD9WXLww1rcYFRzpwaQp4ouDGrvNt464HOLkQIFlwvKm5GwiqzAmR2JoupgyO5zJilKeqDnid07+0Ev9rWMd6UsU89E9HkP2XWC6d5N3HmaZNZbPHrpP62GKeOstAYvQBn7DoIUnm6vWwPKjAQnWKCqe7pgWQM7Q8mDmYFzzPegktlNtgr3Xg+XKps7GTtDi8O/aoXv/hLJZ0/YS7/153FqDX1aVInoQPqdusyYFeWvFshACBGjDqrXzblwg3WaCtO1ttmIO0sUquzQc1WC7LfDR23/KWJdC7nUWXvCXBZpjPOa9tSDYYuc/IvyfvV1fl27nsWGAnhrxNQCB+FtN81WfSG1fN5871RGUrd+IFcDwYLe4+4rUjkC9sKu+vnnF5oZ5E05N7FnBNxssUQZAfZUiFmP/tNo3zzn16YUzlzjTBpzOO54B/SLiu2KsC6jIsftg/umWLKjD7T73R8Y/IJVq+keRBryW6Di01p8tf1X1tnGCLyOrZH4a9I1P1II4bX0ONXirOP/3JYQR9ibjFdm4ZulbZ5s8FzPR2u1AI6hjkzrecsTEERteQ1hprzZsS7opyAHSvtCZQUFUnCw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lSxedczf19j+ulURSKbZrUQ7IAnmtWrqzHDOQ29BVinY4spywbqfeAJADvub?=
 =?us-ascii?Q?HRHsJttcEeYAyANBpT6eGSmKKRQK9xCmIBjAkAS7JUQaFf3Thcizbh6fybqT?=
 =?us-ascii?Q?wjJTFX1oB4eptzEwCTAiHLeLZza/aeTfOwEAJXl7S+IlRxhky2d99d/dNHOV?=
 =?us-ascii?Q?A8zZLtbo2lB2p3a0ZM8mE9A/e/04zckiUD1nVwXHLIOx6GtW3PEBGMHKiOV5?=
 =?us-ascii?Q?sD9B3MWx9Zlw6pcd+4Rp5Ff5BoFVKAJQ9w0gEO265kpCfVVwtpvMOMNxct6K?=
 =?us-ascii?Q?arXvI9Q02WYdoU5QPdJCaOnQX3uifpD8h1K4lXPz0ztE5mwWuLN7gmbN8rIl?=
 =?us-ascii?Q?QVZhSaNorJD4UtY0kF5GJZydFyCB/Jf6gHtuflvh53q4Nhp0BMJCkECUZyRw?=
 =?us-ascii?Q?eQ94cMldJoa9e+OLMoOYbPaY6uFGci/W9/7S7NJnAEBPbejGumQNy2Ae3Ds4?=
 =?us-ascii?Q?tGpQmX1p+swQ+OqH4Q2M1FNyD9jp7AAcod5WR5vR+gUtg8kxSArLPIkJMAaQ?=
 =?us-ascii?Q?1zY53+AZHyD6Ahem7NOmoVb0QF27n58ynxTQa5C/fDhYwZzGtel8QGpyiyAy?=
 =?us-ascii?Q?lrVr7jGVEtUMJGVfVqpCVfZ7VPUJeWvGLe9pBOKy18B+NgziOw6QBSsk8WQ9?=
 =?us-ascii?Q?D19gqOQvkxo38RNdGTyNbf/1nqMknsatqsSRfMlmMUWBk2/kSYIF7aNM4Vr8?=
 =?us-ascii?Q?e0Uexwnb+Oa/jRWF9pHzwDXVeNgO31HZPjDNOSe29LWZNy/oaX9JRDLVZ5p9?=
 =?us-ascii?Q?pV27VtxxsxYv1rIPPJGhJ4ej6k0bBjMzPIZz1M5hFlXmlLtJDtNWaj7dNIkX?=
 =?us-ascii?Q?FsMvevxmhAjiUb8AmepF4CC8/8QMtN93DPDn9JmOFwKWD6+tmUlmaEKZsqI0?=
 =?us-ascii?Q?rfTyM5YlMxWLgvJpHBD/qh6zBohspIrIFOiC3ckRr2+Wlnbfvz6HlygbPs7f?=
 =?us-ascii?Q?k1QUQRZOigv79g1VFZnWMOTHu0gom7gakNMTQfpIEfUpUU6JUFn9aUOLtuBg?=
 =?us-ascii?Q?TFoVNk8E9hQsKFiOf0OW9GpmxsHc7ha/jDQfPmhSl71QY0b9MXFQ/niVjTv+?=
 =?us-ascii?Q?HhruSsaKONc7Y7/35B6KMwcR78SrBnxqBhrtZIBx7pNmE4SsW85q1N4FUDdE?=
 =?us-ascii?Q?NVkn9jvjr3CjzspbkZFSpwrqqvBfFxuEHQSx5Igmu3AWzCYvf7RahoMHGTNF?=
 =?us-ascii?Q?dzoRN7Y+pcnmfALapcvbqIBcIE4TNTexF8AZIJT0PvXQ/XSBNAWkISKSF4f+?=
 =?us-ascii?Q?CW6jR+xzUgqbo8OsM5d6fAaHIvC6BKB9mzMQPdBTFwJcLuceeWeT5ouw8crz?=
 =?us-ascii?Q?OtNCz6P/DjtC5dEuCjEEQPtz0gXHOD6PfH0LbCv+PNzd1jLv3f+7jrRvjgJw?=
 =?us-ascii?Q?M6qyc0HEk5EnjU34JtBgFeYM4Ju9h1hqQuT1Ic+vXgxTwXeIe0wnLPsTT3zw?=
 =?us-ascii?Q?77qWnAmLecP6MpMJh+KxSanm4HDuy38tQshs7IsuA35+KRC19fmPNcJGkNZr?=
 =?us-ascii?Q?PqOUcFK2qM1WjgvtWuHCcp9YK1I1G0Mk/yy60w0sIV8bZH580iaE5nNTkV+n?=
 =?us-ascii?Q?N85XZ7LrXnDzZyHAGmswnHpWd8HWckbtAq4LyJowKw65rEKmY5rxz0cKvZDn?=
 =?us-ascii?Q?XHiIoeINCUW7RlRvrEmrlvpSjSfAHU7mO/FjNhi1JTtOtrF2wn5rI3BTXJs7?=
 =?us-ascii?Q?tJmLN28tB7pAerRIt46z+N4GvxggSD+jMBW3lc4fRORL6/xF/3lnm588PaBq?=
 =?us-ascii?Q?6hknXagaMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4f67db-2637-418a-30a6-08dec0560ec5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:38.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Lh+5AVf2S+NGeIicOQAa1PgmZdvZPqD0WomrhvkWFqeZtDNv/TI0u5/DAiq5iaeCjVwDJPW5M3snKY3QSVUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

Build and send the Chain of Trust message to FSP, bundling the
DMA-coherent boot parameters that FSP reads at boot time.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs         |   2 -
 drivers/gpu/nova-core/fsp.rs                  | 140 +++++++++++++++++-
 drivers/gpu/nova-core/fsp/hal.rs              |   1 -
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |  23 ++-
 drivers/gpu/nova-core/mctp.rs                 |   2 -
 8 files changed, 302 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index db61905eac9d..938aa3a3bad5 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
 
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    #[expect(dead_code)]
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
-    #[expect(dead_code)]
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 67cf83aba83c..352ef7683cf2 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -9,8 +9,14 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::SZ_2M,
     time::Delta,
     transmute::{
         AsBytes,
@@ -24,8 +30,13 @@
         fsp::Fsp as FspEngine,
         Falcon, //
     },
-    firmware::fsp::FspFirmware,
+    fb::FbLayout,
+    firmware::fsp::{
+        FmcSignatures,
+        FspFirmware, //
+    },
     gpu::Chipset,
+    gsp::GspFmcBootParams,
     mctp::{
         MctpHeader,
         NvdmHeader,
@@ -49,6 +60,35 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// NVDM (NVIDIA Device Management) CoT (Chain of Trust) payload, the main
+/// message body sent to FSP for Chain of Trust boot.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    sigs: FmcSignatures,
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: `FspMessage` is `#[repr(C, packed)]` with no padding, so all of its
+// bytes are initialized.
+unsafe impl AsBytes for FspMessage {}
+
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -70,6 +110,44 @@ pub(crate) trait MessageToFsp: AsBytes {
     const NVDM_TYPE: u32;
 }
 
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs {
+    chipset: Chipset,
+    fmc_boot_params: Coherent<GspFmcBootParams>,
+    resume: bool,
+}
+
+impl FmcBootArgs {
+    /// Builds FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        wpr_meta_addr: u64,
+        libos_addr: u64,
+        resume: bool,
+    ) -> Result<Self> {
+        let init = GspFmcBootParams::new(wpr_meta_addr, libos_addr);
+
+        Ok(Self {
+            chipset,
+            fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP_KERNEL, init)?,
+            resume,
+        })
+    }
+
+    /// DMA address of the FMC boot parameters, needed after boot for lockdown
+    /// release polling.
+    #[expect(dead_code)]
+    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
+        self.fmc_boot_params.dma_handle()
+    }
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 ///
 /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
@@ -77,7 +155,6 @@ pub(crate) trait MessageToFsp: AsBytes {
 /// Chain of Trust boot.
 pub(crate) struct Fsp {
     falcon: Falcon<FspEngine>,
-    #[expect(dead_code)]
     fsp_fw: FspFirmware,
 }
 
@@ -113,8 +190,65 @@ pub(crate) fn wait_secure_boot(
         Ok(Fsp { falcon, fsp_fw })
     }
 
+    /// Boots GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
+    pub(crate) fn boot_fmc(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        fb_layout: &FbLayout,
+        args: &FmcBootArgs,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let fmc_addr = self.fsp_fw.fmc_image.dma_handle();
+        let fmc_boot_params_addr = args.fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = fb_layout.heap.len() + u64::from(fb_layout.pmu_reserved_size);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+        let frts_size: u32 = if !args.resume {
+            fb_layout.frts.len().try_into()?
+        } else {
+            0
+        };
+
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: MctpHeader::single_packet(),
+                nvdm_header: NvdmHeader::new(NvdmType::Cot),
+                cot: NvdmPayloadCot {
+                    version: hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?.cot_version(),
+                    size: u16::try_from(core::mem::size_of::<NvdmPayloadCot>())
+                        .map_err(|_| EINVAL)?,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    sigs: *self.fsp_fw.fmc_sigs,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        self.send_sync_fsp(dev, bar, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
     /// Sends a message to FSP and waits for the response.
-    #[expect(dead_code)]
     fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg: &M) -> Result
     where
         M: MessageToFsp,
diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
index 8f9c031102e0..9b6c5a3bfb6b 100644
--- a/drivers/gpu/nova-core/fsp/hal.rs
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -18,7 +18,6 @@ pub(super) trait FspHal {
     fn fsp_boot_status(&self, bar: &Bar0) -> u32;
 
     /// Returns the FSP Chain of Trust protocol version this chipset advertises.
-    #[expect(dead_code)]
     fn cot_version(&self) -> u16;
 }
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1885cfa5cb38..69175ca3315c 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,6 +25,7 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    GspFmcBootParams,
     GspFwWprMeta,
     LibosParams, //
 };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c54e8bf4bb3..558b37863f00 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -934,3 +934,67 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
         })
     }
 }
+
+#[repr(u32)]
+pub(crate) enum GspDmaTarget {
+    #[expect(dead_code)]
+    LocalFb = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
+    CoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM,
+    NoncoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+}
+
+type GspAcrBootGspRmParams = bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
+
+impl GspAcrBootGspRmParams {
+    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMeta>() }>(),
+            gspRmDescOffset: wpr_meta_addr,
+            bIsGspRmBoot: 1,
+            wprCarveoutOffset: 0,
+            wprCarveoutSize: 0,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+type GspRmParams = bindings::GSP_RM_PARAMS;
+
+impl GspRmParams {
+    fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            bootArgsOffset: libos_addr,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+pub(crate) type GspFmcBootParams = bindings::GSP_FMC_BOOT_PARAMS;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+impl GspFmcBootParams {
+    pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let init = init!(Self {
+            // Blackwell FSP obtains WPR info from other sources, so
+            // wprCarveoutOffset and wprCarveoutSize are left zero.
+            bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::CoherentSystem, wpr_meta_addr),
+            gspRmParams <- GspRmParams::new(GspDmaTarget::NoncoherentSystem, libos_addr),
+            ..Zeroable::init_zeroed()
+        });
+
+        init
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1d592bd3f9ed..ea350f9b2cc4 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -883,6 +883,88 @@ fn default() -> Self {
         }
     }
 }
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB: GSP_DMA_TARGET = 0;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM: GSP_DMA_TARGET = 1;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM: GSP_DMA_TARGET = 2;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COUNT: GSP_DMA_TARGET = 3;
+pub type GSP_DMA_TARGET = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_INIT_PARAMS {
+    pub regkeys: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ACR_BOOT_GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub gspRmDescSize: u32_,
+    pub gspRmDescOffset: u64_,
+    pub wprCarveoutOffset: u64_,
+    pub wprCarveoutSize: u32_,
+    pub bIsGspRmBoot: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+impl Default for GSP_ACR_BOOT_GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootArgsOffset: u64_,
+}
+impl Default for GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_SPDM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub payloadBufferOffset: u64_,
+    pub payloadBufferSize: u32_,
+    pub __bindgen_padding_1: [u8; 4usize],
+}
+impl Default for GSP_SPDM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_BOOT_PARAMS {
+    pub initParams: GSP_FMC_INIT_PARAMS,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootGspRmParams: GSP_ACR_BOOT_GSP_RM_PARAMS,
+    pub gspRmParams: GSP_RM_PARAMS,
+    pub gspSpdmParams: GSP_SPDM_PARAMS,
+}
+impl Default for GSP_FMC_BOOT_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct rpc_unloading_guest_driver_v1F_07 {
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index b25970dd4561..f41f3fea15ff 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -20,7 +20,10 @@
         fsp::FspFirmware,
         FIRMWARE_VERSION, //
     },
-    fsp::Fsp,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -39,17 +42,27 @@ impl GspHal for Gh100 {
     /// the GSP boot internally - no manual GSP reset/boot is needed.
     fn boot<'a>(
         &self,
-        _gsp: &'a Gsp,
+        gsp: &'a Gsp,
         dev: &'a device::Device<device::Bound>,
         bar: &'a Bar0,
         chipset: Chipset,
-        _fb_layout: &FbLayout,
-        _wpr_meta: &Coherent<GspFwWprMeta>,
+        fb_layout: &FbLayout,
+        wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
-        let _fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
+        let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
+
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            wpr_meta.dma_handle(),
+            gsp.libos.dma_handle(),
+            false,
+        )?;
+
+        fsp.boot_fmc(dev, bar, fb_layout, &args)?;
 
         Err(ENOTSUPP)
     }
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index a13146dc0cca..be3e757d05a0 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -7,8 +7,6 @@
 //! Device Management) messages between the kernel driver and GPU firmware
 //! processors such as FSP and GSP.
 
-#![expect(dead_code)]
-
 use kernel::pci::Vendor;
 
 /// NVDM message type identifiers carried over MCTP.
-- 
2.54.0

