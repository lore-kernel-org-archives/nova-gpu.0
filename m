Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4639EF23
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693709; cv=fail; b=lXyCRvbPAsx1wyek7qNfUzf7pLhbl+GqqVgFfPKtFikoFCffJZEGCRUUWbmuWU8ADyOn0FXrGzraEsFX+/pwYfwUx6aXUgGrCWJSutPsLmgKk55ecOjEo9zm7RhV+qnLn5hjuLIcga/hqH1NZ4oWcQQSLUnKfvD/hb+tSMmE6Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693709; c=relaxed/simple;
	bh=D+/GP/N9wPfzIZ7gkFzoxmGXAMynPSR7ik85bU2AsZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQpMNdWn9JlpIHwtZh7iBSqe1qGThpVWlT0+NjcCmG3XQz0Z598VB7jztNo4RzB+U/ico4B3JCE5BiF0AEGLSZmmVng7Y0uYg434TiceBC+J+vIrxTFUwgVOIeEw95RkiAmIGFv/x7BQDAWMlWAYK2AcoeAEOSHzrqIM9GEFvbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FsrTQOzP; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FsrTQOzP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6AdUi/mTvNgAQzsqteVuTpJ5cvt+qOxEQnd+vM/Dou+RD2rQ2o3qlIAVq32DUzJ0/lAakS1gskVrupV35RgSzC5IfLkxI1NTyIMDoTrMW2NRvQg3GfebfDzA8ssViB+tlOSSysa5QrU7q8qg3Qkopn0ArHg4dxCumZytR+PVHAgJxlwEjyfisAivEiMSVm1cgoodBlRdgQtwAX208njkqOLJ5SYc0VYrGKmbt2PBM1UXTeTnVgpKLghSez0xS+xPrU4XIRsRXYfHSSrC6IpZr0skf76/e1zBxzEixgNpPbIz12WGrR+R5/GkM248AR8AhW4l+fYkuPZUx5oLm5fcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDIBfgdaOzvFIBwKl8c69FOSuhG+V+vcbH6JOu0XyK0=;
 b=J6Gfh/zYJUc6JTApa5EGeidX5DrVlJDFHg4VaHrINgtdhCtWyBw8MuXNjvvA3NzHk82fUWQ8LDvaGSVRusIIL9c1f/iEHSCT6UqgW+Hks1ZPGxkNxY+4289y5pYbk4wgcVl/S3wiFnj5H3tJFOfzJaS7iDzMHRmKTZViTcnyQghoHq1k1IacuGhN02QfRwqg98vxJ2KKLmWIDRUGoNFpi+wag9r9Vjn++9vtrIf3Yz46IQvHz4Cws3PSeOQ5sD99YLkDiMj+NkD8PiBNpso/Wb80rHGDkEZL6d9Q7Y9dN1ajIXrUEe8K44fpTAxPFN74n9Z3RgI2jG/o5jxA/2WBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDIBfgdaOzvFIBwKl8c69FOSuhG+V+vcbH6JOu0XyK0=;
 b=FsrTQOzPEBoRFPeLkUJONJTqO91uoAeCLiI/SysrqcliCN/8K4Ns+dd1ZhHT5Du1CNFf0ZG8/PT7PGUdVuHUsWnIF4MOLRkX6JgVjePc2Hia/LB5sBYwprVxi7FHldmySaVVcNS6huuTZN9MHyJtLwFcfFpdiEAPtOmIU8FgNXcGjWScvesw7uTOJh6Ln3Nfi5vsV6yuuzr7vHYV1zAGG3Be09Z0ijmVzH4QNG0lguuNpI9+VnQQ0G2jFmQZ+6CI6zmY4faeF4BQGipRFGuBM9DWWrxv5KwAP6/V4aYeMm02D3KgtBQVGo75noy+BfzlZa4r8dF1f/xpqyG5bOaHsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:03 +0000
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
Subject: [PATCH v3 21/33] gpu: nova-core: gsp: add the GSP_INIT request builder
Date: Thu, 17 Sep 2026 18:07:07 -0700
Message-ID: <20260918010719.1176945-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c50cd31-73e1-4b32-e12d-08df152142dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0eUmZukZV1t59P4w7YP/5p0XlNzaXqzbOMXRVYOp8sLl1yh46dDoocCWj06Po9JqYcQVyaw19gCGAjOwST1MJzkf7umRWcuYdWHzBM94krrOO/CAFpcSr3DM9PmJd18IePRcPezgxMtxl9Jcg+kzACSWjkkPw8DD17rnIaWdYTPMy4/3bew73muiB6tTiB5cHhQxXcoT5CeGQZ9cG1a/3j0HFYPhZT3iOX1rJyPqIk+FZ3cwgb89tXKG8GrnQbPVjtPoMVZCeUBusD9YAIWfTTmwS/cc+h2H48dJucI3GzyYiaIEkvqBRTr0/DD6qu6RjWT8y0fVY1QV6MrAuGcp9hnXg8YOuV2TSk2YmmTB0gr/sNzSIjvJDhp18hiX+ATKRs1wIJVvaoG7uRWaO6x6L9QRHKHggqjBu1TOVadkgtXkeCctLIZ3R1eAMI1mbo5CZGbNioCAr0ZEg3cWDf1xjOt6sUqLQSf/X+A4dx6/Vk2KPieobCmvdeWcfrisBFfFaTX3goi+OGxGbJ1K86Jb+bcBPFkI5WDffnbmiUt+0ka4Akc2Ylre0XrFy7CxbaO0Yt8tQXoWE9ggyF0vWc3m3KNJmiLMdK9wmrx6PdpvDx6jbbAMiW+Z72ZDtk8V9yHxkNqqcZ4ms+grfoujcogQRAMluP35PoIt0wxHOGKHh5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q2vTn9Bj3G+BKHZZiEVb+MI9npSs9PBibBQiQ7i9MhiJjPplb6r4odtQAtZE?=
 =?us-ascii?Q?T18Kkq79lUY/Dbpliydf0FbeqEfQ0jeJXkujz8aDUf7OORDEUKARvvXk9BxZ?=
 =?us-ascii?Q?Iys6WD/VRMwAbhjILO4lwGLr0H3HQSmXEj88NM9bd6SFbryItr/VMdzZ8hXm?=
 =?us-ascii?Q?qh1oOu5c38kYIK78P/s+blCQ5Zqd7A4MoMrVEAPMQY59rolpPUy7j7JOiHTK?=
 =?us-ascii?Q?yz25trhQwOJdF/whoQuHlS1gKYKdtInOrepMgbi36l+SNjQBC79xbhKQi6fr?=
 =?us-ascii?Q?GdegcI8E4mamGcbLZ2jDhuQhB1nsxWid+EAtc4dbDSeaBx82Ggsr5aWHvERW?=
 =?us-ascii?Q?obBBvy+W0lK1cca8Zfo9mz8gro4l88wEEoOYRAe6lWLGo2QHLvCyqN58LSpD?=
 =?us-ascii?Q?lBuqtY5oblZS1gC8I6kSlSo+MmBWQ9Nqrr8iUAL54JXG3M2Ii+MQ2G6apwdj?=
 =?us-ascii?Q?vWFWCGqOfV6eTsk1WK8inry0ylQTG7fxy7s0VCz3chAh/dnSSXSwy3E8JKBx?=
 =?us-ascii?Q?pv7C46CzN8kc9PF749KCUeBdJBmC1La5R992VfJn8e06CExF+3SqkFgQHOUM?=
 =?us-ascii?Q?udKg8G0jy6kEt3nCQkuQ4qJuwpCTeGNl4embJWChVSNAX3/odQPyEe3N961h?=
 =?us-ascii?Q?m0BHWA537hLvinvCNdbxW/lJbE7atJ5MmLvM19o4nOSpuUWGjtLqtXACcxaI?=
 =?us-ascii?Q?5FD6xkpkIAECINXgPAO6Q9GXPhE2bNBskC3Q8/YeFMIVG20uts3nHyFgG40R?=
 =?us-ascii?Q?67Xbj2gkObTkPjH4EJlfx/arc6WYjbZo9TfwOuKCSV8okwMLQYfpYtbxfZIx?=
 =?us-ascii?Q?ZxcHdVJpGX9yrtun5qJOnnzcAneEvrQiOpsm6upSkTpOjwWqg6m65rDIQH6r?=
 =?us-ascii?Q?WTjDYWtOCCBIJHf89Kx0lJ69uXUps4odTRwp3LDBdQC/VMlInYjfMKcpmYnQ?=
 =?us-ascii?Q?Sf17OLXWe7AaDUlTm7D2GJ0mAOjMqWhH92trWzzMfPkkdfnJInb8Kp4sh5hf?=
 =?us-ascii?Q?Fac2VXvCUvFOklmvKRGMXl+k0hLSSZP1lVAv+adN5oNmLE/7tY1gxA72Iez9?=
 =?us-ascii?Q?ycdat47EH+KjTyMmkRsvhAytxtCbmtD/iWzUmvEdn8d4NK3qCRPMEAgxng4Q?=
 =?us-ascii?Q?z501gBWtiIYrYhAAe6o4Z44N5We3lPzIcg8LP7kSu8APaUzZ4e3cmCYXciL/?=
 =?us-ascii?Q?xvELve7cT5ezouugWIlyYISENefkSo6yKi3WkMEfRJVxfohgq705/CVrCewH?=
 =?us-ascii?Q?/u3sc8lGfCSI8jMqvsrmWhNIY6d8ti6zTTlJHpKAOVXAvd2YFy6yUiYzBVtn?=
 =?us-ascii?Q?FY/2RDqEVuSvyEJZ9kI9yWLnF39qD4ZBtQY53xUs3Y7QnH6Re/P9CopmRlkP?=
 =?us-ascii?Q?pUiPWtGRW21qjQUmfO1ZvIDca1MvO6Gq2K5oApkiZ3cC78It/ISVa1TQK8TN?=
 =?us-ascii?Q?YlVZjWJOa3GYlkB41VvFtpUKe0WNQ0nUQQepuMhDmDXbwNMOJOaWF5B6Q7aQ?=
 =?us-ascii?Q?414ymyV0oU3UtQxQxFA/iWrY1Eqn4N4AAHz/5JG0eZGW7NA56fEBMAc4C4h0?=
 =?us-ascii?Q?fMcrjaWxn+a858RhRAmb6FrHar65jLP6SwFUZi6Sx7+OwDrGEvZ2cFBnC6x5?=
 =?us-ascii?Q?poMwzGHmwtBRLU1VHQMzjGSOKIsO4nLOihn9OealrdghgaAM89dT2QB7V1bZ?=
 =?us-ascii?Q?xSt1rtnlubYAebrb8XA/t9XGPhn0HcG8JXkFWJExzYFQlfXRb+hS6gzWS7oT?=
 =?us-ascii?Q?TGUICAC2IA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c50cd31-73e1-4b32-e12d-08df152142dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:51.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LJcSTKs1e+ujpoAfb22QyFkGvVPjLZEfzZirbJ67VOmGau4YOFhMXHKbyHW5MFQ8ZY8OqNWNsFCkp4jO0rEhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The r000 boot protocol replaces the system-info, registry and
static-info commands with one GSP_INIT request, whose payload is an NVKV
stream of key-value pairs.

Nova-core had the NVKV codec and the GSP_INIT schema, but no builder
that filled the schema in from the PCI device.

Add the builder. It carries over the registry keys that the r570
registry command sent, and it reports the architecture that the kernel
is built for. GSP-RM reads the GPU's PCI location as one word holding
the domain, bus and device number. That word is not the bus, device and
function triple that PCI_DEVID packs, so the builder assembles it rather
than using PCI_DEVID.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    |  23 +++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 110 +++++++++++++++++++++--
 2 files changed, 125 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d866297fa0a5..2c7965174445 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,8 +30,14 @@
         },
         fw::{
             self,
+            commands::GspInitRequest,
             MsgFunction, //
         },
+        nvkv::{
+            Encodable,
+            EncodedStream,
+            Encoder, //
+        },
     },
     sbuffer::SBufferIter,
     vgpu::VgpuState, //
@@ -264,6 +270,23 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 }
 
+/// Builds the NVKV-encoded payload of a `GSP_INIT` request for `pdev`.
+///
+/// # Errors
+///
+/// - `ENOMEM` if the request or the encoder buffer cannot be allocated.
+#[expect(dead_code)]
+pub(crate) fn build_gsp_init_payload(
+    pdev: &pci::Device<device::Bound>,
+    chipset: Chipset,
+    vgpu_state: VgpuState,
+) -> Result<EncodedStream> {
+    let mut encoder = Encoder::new();
+    GspInitRequest::new(pdev, chipset, vgpu_state)?.encode(&mut encoder)?;
+
+    Ok(encoder.finish())
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index f0a2d023f560..4fdd6ff23dc1 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -18,7 +18,8 @@
 use crate::{
     gpu::Chipset,
     gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
+    num::IntoSafeCast,
+    vgpu::VgpuState, //
 };
 
 use crate::gsp::nvkv::{
@@ -258,6 +259,25 @@ pub(crate) enum HostArch {
     Riscv64 = 5,
 }
 
+impl HostArch {
+    /// Returns the variant that names the architecture for which this kernel is built.
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
 impl TryFrom<u32> for HostArch {
@@ -284,7 +304,7 @@ fn from(value: HostArch) -> Self {
 
 nvkv_encode! {
     /// A GSP registry entry.
-    struct RegKey {
+    pub(crate) struct RegKey {
         key_name: Key<&'static [u8], { Self::REGKEY_NAME_KEY }>,
         key_value: Key<u32, { Self::REGKEY_VALUE_U32_KEY }>,
     }
@@ -294,6 +314,17 @@ impl RegKey {
     // Define the Key IDs read/written by GSP.
     const REGKEY_NAME_KEY: KeyId = 0x3070;
     const REGKEY_VALUE_U32_KEY: KeyId = 0x3071;
+
+    /// Creates a registry entry.
+    ///
+    /// `key_name` must include its NUL terminator, which GSP-RM counts in the encoded name
+    /// length.
+    pub(crate) fn new(key_name: &'static [u8], key_value: u32) -> Self {
+        Self {
+            key_name: key_name.into(),
+            key_value: key_value.into(),
+        }
+    }
 }
 
 impl Encodable for KVVec<RegKey> {
@@ -329,22 +360,40 @@ impl VfInfo {
 
 nvkv_encode! {
     /// Payload of the `GSP_INIT` command.
-    // TODO: expect() doesn't work here due to Self:: reference, fixed in 1.97.0
-    // https://github.com/rust-lang/rust/pull/154377
-    #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-    struct GspInitRequest {
+    pub(crate) struct GspInitRequest {
         pci_device_id: Key<u32, { Self::PCI_DEVICE_ID_KEY }>,
         pci_sub_device_id: Key<u32, { Self::PCI_SUBDEVICE_ID_KEY }>,
         pci_revision_id: Key<u32, { Self::PCI_REVISION_ID_KEY }>,
         pci_config_mirror_base: Key<u32, { Self::PCI_CONFIG_MIRROR_BASE_KEY }>,
         pci_config_mirror_size: Key<u32, { Self::PCI_CONFIG_MIRROR_SIZE_KEY }>,
         host_arch: Key<HostArch, { Self::HOST_ARCH_KEY }, u32>,
-        bus_device_func: Key<u64, { Self::NV_DOMAIN_BUS_DEVICE_FUNC_KEY }>,
+        domain_bus_device: Key<u64, { Self::NV_DOMAIN_BUS_DEVICE_FUNC_KEY }>,
         regkeys: KVVec<RegKey>,
         vf_info: Option<VfInfo>,
     }
 }
 
+bitfield! {
+    /// A GPU's PCI location, encoded as GSP-RM decodes it. Despite the name that GSP-RM gives
+    /// the key, the function number is not part of the value.
+    struct DomainBusDevice(u64) {
+        63:32 domain;
+        15:8 bus;
+        7:0 device;
+    }
+}
+
+/// Registry entries that the driver sends to GSP-RM on every boot.
+///
+/// `RMSecBusResetEnable` enables PCI secondary bus reset. `RMForcePcieConfigSave` makes GSP-RM
+/// preserve PCI configuration registers across any PCI reset. `RMDevidCheckIgnore` lets GSP-RM
+/// boot when the PCI device id is absent from its product name database.
+const REGISTRY_ENTRIES: &[(&[u8], u32)] = &[
+    (b"RMSecBusResetEnable\0", 1),
+    (b"RMForcePcieConfigSave\0", 1),
+    (b"RMDevidCheckIgnore\0", 1),
+];
+
 impl GspInitRequest {
     // Define the Key IDs read/written by GSP.
     const PCI_DEVICE_ID_KEY: KeyId = 0x0001;
@@ -354,6 +403,51 @@ impl GspInitRequest {
     const PCI_CONFIG_MIRROR_SIZE_KEY: KeyId = 0x0011;
     const HOST_ARCH_KEY: KeyId = 0x0070;
     const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
+
+    /// Creates the request for `dev`.
+    ///
+    /// The registry keys are [`REGISTRY_ENTRIES`], plus `RMSetSriovMode` when `vgpu_state` reports
+    /// that vGPU is enabled.
+    ///
+    /// # Errors
+    ///
+    /// - `ENOMEM` if the registry list cannot be allocated.
+    pub(crate) fn new(
+        dev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        vgpu_state: VgpuState,
+    ) -> Result<Self> {
+        let mut regkeys = KVVec::new();
+        for &(name, value) in REGISTRY_ENTRIES {
+            regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
+        }
+        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
+            regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL)?;
+        }
+
+        let mirror = chipset.pci_config_mirror_range();
+        // `PCI_DEVID` packs the bus, device and function as the low half of a `Dbdf` does.
+        let dev_id = Dbdf::from(u32::from(dev.dev_id()));
+        let domain_bus_device = DomainBusDevice::zeroed()
+            .with_domain(dev.domain_nr())
+            .with_bus(u8::from(dev_id.bus()))
+            .with_device(u8::from(dev_id.device()));
+        let device_id = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw());
+        let sub_device_id =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+
+        Ok(Self {
+            pci_device_id: device_id.into(),
+            pci_sub_device_id: sub_device_id.into(),
+            pci_revision_id: u32::from(dev.revision_id()).into(),
+            pci_config_mirror_base: mirror.start.into(),
+            pci_config_mirror_size: (mirror.end - mirror.start).into(),
+            host_arch: HostArch::host().into(),
+            domain_bus_device: u64::from(domain_bus_device).into(),
+            regkeys,
+            vf_info: None,
+        })
+    }
 }
 
 // Decode:
@@ -753,7 +847,7 @@ fn gsp_init_request() -> Result {
             pci_config_mirror_base: 0x1234_5678.into(),
             pci_config_mirror_size: 0x1000.into(),
             host_arch: HostArch::Aarch64.into(),
-            bus_device_func: 0x0001_0203_0405_0607.into(),
+            domain_bus_device: 0x0001_0203_0405_0607.into(),
             regkeys,
             vf_info: Some(VfInfo {
                 total_vfs: 8.into(),
-- 
2.55.0

