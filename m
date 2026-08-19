Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442413C3432
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111586; cv=fail; b=aAJGLptGrPg1eMDJY7A2n0Lpz44ICq5/TLOYzGeRSadPUQnHdICC2/ONVqky+vdOEpmQV+TYUdkOaxvlXd8brXz4ys2Yafd1oCnOQCuYbC4WxKZh0+kNnyxpXQRb0qfKEJd05F3UX2MyMJDD0pJlTSr16jOMaaDIapv7lGmFsP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111586; c=relaxed/simple;
	bh=yYsWk/tPczLdzzoAzy7Dn5zpAv7du0itg8XcSUnsoA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u5lJit09DxLAwfgWLtBpEoqC4HepfvpIP+d9Tts7tQIBxxGY7hg78wLuflqeU+/CPTfw3SmGcP8ePrvpQ6aZfGLtSRcIeX67flgDK1KZjIfWg6BTgkryeQdskhHOupoIUA2CoVZKcAat3RtqDG77QsDTXqfOuFzJzO7Rl3xn7As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cb/CH2BF; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cb/CH2BF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb+zSX4syzb/18SYJABkQcXqiaBUVKhojMx0pkp4+8DaKYaqhgrvMxFq//ZvVxSSnOKXbA6hMBuAw2OWWjCBQX7YXPcdutLIfxPLDNBYGAPgLCGSimxckisfQJeTM4K8IStiB2ybW/NwGhGIIkiAL2rH5WwSr4WNQYpBheF61Vl6KXI9bLvU93JzP6/gSlQc6/jeQZnKRytLVrTC5aBpShF9zOgNPfR9C/L4BHsHdkf/xix9qXrlrPg1H86ol9Pm1G2f4+lAWYnIHJ32UQRgvDuBkf1qfk6uxdWxz9TKA1zKvWzFEZWlivp+e3t8LYJ3N2WpcO7wm3aAhNO3JXx+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dK0fdx4MgqN+9BOIAP86tdREB85vRDI86Yx1SXJsVck=;
 b=JcgEkvYw1/6u+wLnUzqVFGJJAt2ncwa4cS6VzpdACqFt91w6dLSs+QJKGX/i8+rEviud5EQXYmqaXleb9O0qr20d/Z0sJnRVL94M+LPvdC89W1p5QPQP2L8ENv9lTZTdPZeSSb9FQ7c2GpNFGoJeE/PZLiTq9vYS4FLLQPB5utNZnh1MvGoxPSWe4wlgAmPKqpnSsuul/vgtQOlFLEpjklgWVY6s+Stb4GI9/fYIAWvNO8GgbowHnsR6Z2wZtl5E0IL8g6NaxNQVfdgnZpXW2rVXIUL1ig1+ZxW17ycFBDao4QnQVGFAEjmJ5dtyALGfZzQSYQFLJ7om6YrtVVC3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dK0fdx4MgqN+9BOIAP86tdREB85vRDI86Yx1SXJsVck=;
 b=Cb/CH2BFpAKkZET2mHAiVA5hLkRMDWkBFNFAa+Wten3XAGhdeEH3QNeVUfzes8XdQ3Oledtfh+LaEZL32y1PJOmVpewZahOse5F9AmPT1vhuLcmmwJCviT84I9OYKxl7JQVYKC6I84LAJMN8SwLGaGviMkQuMGKQ9JM0p10yygl3nY6YwfNJNS96ucn2KA2PSXSq9CUldHSZzuGgsZJaJXIKEEuZCZMjErLRu2PXz4JDrQqiMcMjJfkMVRYFqZNLfwRNKOLoftlg+yekPdTrUDZl7HaRPKDquRutkZUrgclvWzc8WbUKRicrlqZ5q31ez4Rsv6t3pjHNOQxfGDAczQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:48 +0000
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
Subject: [PATCH 22/27] gpu: nova-core: gsp: add the GSP_INIT request builder
Date: Tue, 18 Aug 2026 20:52:15 -0700
Message-ID: <20260819035221.336390-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 42390cb3-c691-4db2-4d97-08defda555f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	FDAESLygT8K+KVxg76dOi/AvaIZjrIEj//xmnoqdyysIDqbrBAtKmgW0II3+glcoYHuiHSuVfVKXTdm3LUU0VeuLmVngCD+nU7uH0Az7Ulmto80a71irMCsMp+kJD9JbbpcphXMialybFH41sbUDlzeR9Q6pHnMpl9QgdFNvdyE3T2bkENeFU/1X54HyEXc+/0ARP52ziRRAGme2qz9eVV5a3kc8Z5qO0ja/AqI3QrdZaG5kgws906XNgyKyv9hoQi8Q1M46SKGAp3pMR22htNxsIifJlFkn7CxbwkxAGES8FScDm6vB0HYuCr36LjRZu/PFrXit2V9K0UjBbqqoaw3Um6suR6QTQHhQdLxK2nl3Pp+XVKD5KN961tOAppWuT80qLaA/PybIES3smbvnZmR1JkxP1rmhEtOXfgBiOxqj3h8IBhVo38j9KpiX0cW2jAhNBaU7K7RmCpJmivoKcSK2Xkxa+eix0PFTw1vXnoRNnwzXIKMZ9ha8rOl1imOoIW4nZi/qZPgxn2nGo3HKzxcrllwUN5oXXB2MsjEltN0iPFNqXll5aptOuB6FCftXqSjETELClS2O4XWK+t59Dx64RGmmeP+oM4P0GuM6BdsT2h42Cy5A04te9bbekiLJHExwWtNoi+bn57qOk79P0+1QOJmY0qGrW+IIC0qsWmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BXt6m1+NtOZP0zibMv1ESyTKvA2ySLGW/N9Zi7OBw5fYJs8kZYUqKy8FMzv/?=
 =?us-ascii?Q?yaqYdY2vHNHdBJGHQY9BRmYcpJStkUIDGcHVuXYmUd6zVfzZRAsQ14tYK4UK?=
 =?us-ascii?Q?eVP2DSC7O7v7mSnREU0W/xJGxDp5uFMOo+XTDghFHf3OT+aa4xN8/BGXn75u?=
 =?us-ascii?Q?SWSVh8HQalu9gfr4cRU/3Z6sSb9BaRkBuL1kkx0oQNvgD0n3xw4FomcQgwft?=
 =?us-ascii?Q?o3/GEdehmu9qXBOQC9pLiReJqoqNGTa4NIn5V4O/Z91H9Sgx+QgtRTMbHQVe?=
 =?us-ascii?Q?Dhhi2lRCaJbvn21Z6UYm20vTbygCaYQvH64d2iYcNXXvoQuyPJXvXLMvwuiD?=
 =?us-ascii?Q?os9QNgHCUjY7bwWiSfOvJV3RFTC1reYnzJeYf8h4Ecz14u97151WmFKaldpW?=
 =?us-ascii?Q?StFPCcsEz1NSp/P8gMs0gaIL4lVvSSmw8CK4mXYOUB6tln9OnnwCwoa/w8SC?=
 =?us-ascii?Q?w6IalA6q+FE2psJrU0rW0vnDuQaCSQbo/5SzWMsVdVg5ySBJ+QZSg41/LuGE?=
 =?us-ascii?Q?qu6n5jME2gcmmP2xkdtdTOVw24H2ztWik/3abvWMlsjmCdq2Tb1zP3G0tdFA?=
 =?us-ascii?Q?wNU/hGNd/fqfag0TeLTzRvp0hU+3R/nsR2iVWlEco1SERmniRWUA3NKwIteq?=
 =?us-ascii?Q?LkiUqqI26VL+eY4qzDclC92SnQCuVODZ1u48UAwyVI5iO5fS01+v8ziHpe/8?=
 =?us-ascii?Q?947lYWZgbNb1U0z3t3ETicmGuDuApVovVDPUQat+p6C+gX7khcPWQuaemIoX?=
 =?us-ascii?Q?IPSQkVpEPk2J7jDFsfLfhVLlRaPZjshP7TB8ZayiRdceAtNBRgQ+nD8yvJBr?=
 =?us-ascii?Q?oxGl5et1wCvhLiEMNjD+7rn/ixXvn4teG7hCpfO2r+aSyztswTz68Cvwj2lN?=
 =?us-ascii?Q?fPfirRXYutbYVqaxvvplyTMVqG8CRUgPet6Vtx5U+Y/p7MTtRvABbMNWdu59?=
 =?us-ascii?Q?ZSbmuU8ConWbOJVrI7vxnCAyjKyBZHqAwaFU7jKvDIuRA1JVSgSSvND+vD5o?=
 =?us-ascii?Q?W2i/u7y+Nv2XUUc+9c9HaeMqlyr0xtms1bjf3boKJ9v7ezur83AoLahAkgwq?=
 =?us-ascii?Q?TidrSNra+a9ePUecT47f8mAZF5XVO3O6GlJPOHYCl5fr/AyXVr0jHMzyBVsr?=
 =?us-ascii?Q?eGci35d8qb7gV0qkvFx8439jk6jpmJRXksX3sEZai1miXInNnJ8Vl87c82XG?=
 =?us-ascii?Q?EkFaJpWtlCbsnDWubGOt3oSTbKsRhP3YU6Cht4Vd1dWNIpiNLbAQ6HTyHBdz?=
 =?us-ascii?Q?OBz5s0hprqROTS/J6W6tUUG4QYn2GcensmhFfojwbN4JC9WZiPt/ILJHqvwo?=
 =?us-ascii?Q?cbM8U+jJmDHpqb4RxkfquzFpBwnQEZiKNkGGOvQzUfQ8j4LH3EYJAx6unDrN?=
 =?us-ascii?Q?LVKCGevGVMqd1s8fwx9ltjiRyK2Qls1L9arQK+691V95qUBYbpV+pgfTcovU?=
 =?us-ascii?Q?2WwLg3e6mFWF4vfDW9pJlndJWQ0/Z57fPv524eCR7w15/FC99yYRLLBKmEoV?=
 =?us-ascii?Q?B7QkrrsflRpNXnR58Jt9PawNj6fDwReXjAdLCPZorlkGE8LuAK72cWSKf4GV?=
 =?us-ascii?Q?gZERT38f+5s2QnsZEtg4Mx9upSHFKv18deq6jb/HwdWoiMIbJjUoTt3udn9E?=
 =?us-ascii?Q?0+coeVNvnY4BqpvxbrXP3IT4QqQPw6UtRbmrRj1UzMg6UIgq0CthH+aPezOh?=
 =?us-ascii?Q?2S6lbn1N/DBfDexR6PwT4OLLrXgxcl4sogzNwGyCV6pWapLEWeDxAqV4U5iW?=
 =?us-ascii?Q?7qfYX+TNjg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42390cb3-c691-4db2-4d97-08defda555f9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:48.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNQgvHo2Q3de0A28O5do3IYOL//XZr0uneOktEPUIh4OMonDjM6FN7rYIu94xfhTsmp98KF2VMox935dcTETBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The r000 GSP boot protocol replaces the separate system-info, registry
and static-info commands with one GSP_INIT request, whose payload is an
NVKV key-value blob rather than a packed struct.

Nova-core has the NVKV codec and the GSP_INIT schema, but nothing that
fills the schema in from a PCI device.

Add the builder. It encodes the PCI identifiers and config mirror range
the RPC path already sends, and the registry entries, whose names carry
the NULL that GSP-RM counts in the encoded length.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 52 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 58 +++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d5575c036eb9..0c3832ccf726 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,8 +30,16 @@
         },
         fw::{
             self,
+            commands::{
+                GspInitRequest,
+                RegKey, //
+            },
             MsgFunction, //
         },
+        nvkv::{
+            Encodeable,
+            Encoder, //
+        },
     },
     sbuffer::SBufferIter,
     vgpu::VgpuState, //
@@ -259,6 +267,50 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 }
 
+/// Registry entries the driver sends to GSP-RM on every boot, each with the NULL terminator that
+/// Open RM counts in the encoded name length.
+///
+/// `RMSecBusResetEnable` enables PCI secondary bus reset. `RMForcePcieConfigSave` makes GSP-RM
+/// preserve PCI configuration registers across any PCI reset. `RMDevidCheckIgnore` lets GSP-RM
+/// boot when the PCI device id is absent from its product name database.
+///
+/// [`SetRegistry::new`] carries the same entries for the RPC path, where the names have no
+/// terminator because that encoding appends one.
+const REGISTRY_ENTRIES: &[(&[u8], u32)] = &[
+    (b"RMSecBusResetEnable\0", 1),
+    (b"RMForcePcieConfigSave\0", 1),
+    (b"RMDevidCheckIgnore\0", 1),
+];
+
+/// Builds the NVKV-encoded payload of a `GSP_INIT` request.
+///
+/// The payload carries the system information GSP-RM reads before it starts, and
+/// [`REGISTRY_ENTRIES`] as `REGKEY_NAME` and `REGKEY_VALUE_U32` pairs. GSP-RM requires each name
+/// to be followed by its value, which is the order [`RegKey`] declares them in.
+///
+/// # Errors
+///
+/// - `ENOMEM` if the registry list or the encoder buffer cannot be allocated.
+#[expect(dead_code)]
+pub(crate) fn build_gsp_init_payload(
+    pdev: &pci::Device<device::Bound>,
+    chipset: Chipset,
+    vgpu_state: VgpuState,
+) -> Result<KVVec<u64>> {
+    let mut regkeys = KVVec::new();
+    for &(name, value) in REGISTRY_ENTRIES {
+        regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
+    }
+    if matches!(vgpu_state, VgpuState::Enabled { .. }) {
+        regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL)?;
+    }
+
+    let mut encoder = Encoder::new();
+    GspInitRequest::new(pdev, chipset, regkeys).encode(&mut encoder)?;
+
+    Ok(encoder.finish())
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 5cd2d9646de3..bfd756813c64 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -245,6 +245,25 @@ pub(crate) enum OorArch {
     Riscv64 = 5,
 }
 
+impl OorArch {
+    /// Returns the variant naming the architecture this kernel is built for.
+    fn host() -> Self {
+        if cfg!(target_arch = "x86_64") {
+            Self::X86_64
+        } else if cfg!(target_arch = "aarch64") {
+            Self::Aarch64
+        } else if cfg!(target_arch = "powerpc64") {
+            Self::Ppc64le
+        } else if cfg!(target_arch = "arm") {
+            Self::Arm
+        } else if cfg!(target_arch = "riscv64") {
+            Self::Riscv64
+        } else {
+            Self::None
+        }
+    }
+}
+
 // TODO[FPRI]: This is a temporary solution to be replaced with the corresponding derive macros once
 // they land.
 impl TryFrom<u32> for OorArch {
@@ -271,7 +290,7 @@ fn from(value: OorArch) -> Self {
 
 nvkv_encode! {
     /// A GSP registry entry.
-    struct RegKey {
+    pub(crate) struct RegKey {
         key_name: Key<&'static [u8], { Self::REGKEY_NAME_KEY }>,
         key_value: Key<u32, { Self::REGKEY_VALUE_U32_KEY }>,
     }
@@ -280,6 +299,15 @@ struct RegKey {
 impl RegKey {
     const REGKEY_NAME_KEY: KeyId = 0x3070;
     const REGKEY_VALUE_U32_KEY: KeyId = 0x3071;
+
+    /// Creates a registry entry. `key_name` must include its NULL terminator, which GSP-RM counts
+    /// in the encoded name length.
+    pub(crate) fn new(key_name: &'static [u8], key_value: u32) -> Self {
+        Self {
+            key_name: key_name.into(),
+            key_value: key_value.into(),
+        }
+    }
 }
 
 impl Encodeable for KVVec<RegKey> {
@@ -317,7 +345,7 @@ impl VfInfo {
 nvkv_encode! {
     /// Payload of the `GSP_INIT` command.
     #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-    struct GspInitRequest {
+    pub(crate) struct GspInitRequest {
         pci_device_id: Key<u32, { Self::PCI_DEVICE_ID_KEY }>,
         pci_sub_device_id: Key<u32, { Self::PCI_SUBDEVICE_ID_KEY }>,
         pci_revision_id: Key<u32, { Self::PCI_REVISION_ID_KEY }>,
@@ -339,6 +367,32 @@ impl GspInitRequest {
     const PCI_CONFIG_MIRROR_SIZE_KEY: KeyId = 0x0011;
     const OOR_ARCH_KEY: KeyId = 0x0070;
     const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
+
+    /// Describes `dev` to GSP-RM and asks it to apply `regkeys`.
+    ///
+    /// The same identifiers reach GSP-RM through [`GspSetSystemInfo::init`] on the RPC path.
+    pub(crate) fn new(
+        dev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        regkeys: KVVec<RegKey>,
+    ) -> Self {
+        let mirror = chipset.pci_config_mirror_range();
+        let device_id = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw());
+        let sub_device_id =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+
+        Self {
+            pci_device_id: device_id.into(),
+            pci_sub_device_id: sub_device_id.into(),
+            pci_revision_id: u32::from(dev.revision_id()).into(),
+            pci_config_mirror_base: mirror.start.into(),
+            pci_config_mirror_size: (mirror.end - mirror.start).into(),
+            oor_arch: OorArch::host().into(),
+            bus_device_func: u64::from(dev.dev_id()).into(),
+            regkeys,
+            vf_info: None,
+        }
+    }
 }
 
 // Decode:
-- 
2.55.0

