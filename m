Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AAF347BD7
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157525; cv=fail; b=k4lOj1k6WIpSRVlQBOik0ce3Ctl5aoUgFQ8XhwjGo8xhYt8VkmFjeO+HcPs9/EaZpyhvEOxOt+lVR+G6A8uh2ZNSd3V3b53xQphKYPyRjBrYbBn6Xo7FNrGR5hOl+bZhRWLEVs7HqvgBTtbQFGm9qNX7Enh1S0CSr2U2Ncwosuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157525; c=relaxed/simple;
	bh=5UcC16vhK7dBckozTfnp9MxeMF9EEtvDBC9kBireUYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQ/x2xVHHMxT47wZlcOqgbCWQpIGQqXJnKIxXeGiawcQTeRF6sTu/M8xh1QQy8rbfGgM0U04qCXH5seNuGS+8GqDdHZYtuiB8CRqC7cGiN3t1tB9M96JuJhoYRt0mTMa1mWz58mUMvuuhTfy+2qJwZVzNxdqTE9YDP9Q2qwIJDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CBQHCxgm; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBQHCxgm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0tGJZrbmpwTh9gpb5RJua6qlDAGDSgC80Fm83CVMpFQ2QmGU6t75esN4SFr81LDClecI2YXvCILj3oYmLlyTZK+/ZtLVRJij4JQjOfjsNYQLpCpaRsswZOL27P8TI3bpWgLzWktI0rpqtvZmlBaX6N8VNynlmjz0+u1LE3fSa51ImZavxFD8sJ6AZO8ESEIcFnR5IL6luigdzG0Q3NacZZgc9rSRdN4n5bLWvRgCVmd0dm2ODBbuP9dUw5qoste17O2YMBpNRtkYQoUyXpPOUwHXZaNOFw6QDsan6wWT/4fzpimKBstbJKzOI1gHWo+lxcTbUJFiyxbOuqCZ/xKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYI/luxjppuF2UFOtW2mxo1WF5n9gERPhg9/auYwp4M=;
 b=wWNVVawpderjIFCGAINPh/YXmE8n+1EEwynD4ziHWscjSiGf9Vswg5UtDbdpe1xaVHTJNjCzWTzZlSw0fYkHtOqBcbe4G2treRJDQ7gebbgOvBbCxFmNbG/0h6+QwtbJc3baY48+9IIoy0UChGEFc4D0853tFkhtiwlialVHFO2W5Ib1KSGUhVWGZBwQmQc2FD71RxQiJ4n9NL48YX97latGKYnnZx/E++12oeIntgTvDQ+0n2w9GUqLC9IqckDpyO5sYVjIyRz/JAJUnanPp+oFOgJBiMteSrAMnTG2SwG2kvJAZagAcUb1MKWe1Abrwgzxt8T8anQeN/g1ZarlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYI/luxjppuF2UFOtW2mxo1WF5n9gERPhg9/auYwp4M=;
 b=CBQHCxgm6z0l/2FB3+AT3Lmnp0ydvhHYrUGpZPOHdNhA9p01xUrwzj9psRmVNVjh/5sSkCLfQJWVwxf+UKJoltat2yg5ox6E2TNPpkxIji4XL0UM2zdoju+NYVUSvwhj84CLKQEsA1Smm0xQCj2w6T5D7TTL9UmZb5PQVg/lk/k47ar7NLFuEDtQmC4EkNDUTPp6s4uJK7y7HqPmAPDW2ODEzhsatwbwc5appoEkQpKTNNgSJnaWFxhUyt7fv8HUqKTW2Uj6XSmiImJ8turFLzKj4sipRc3TEoCzHQJgdE7N5vfVGhqR1xwK7eHUkPAm4xI4w2vcE+LZJq59xGuhsw==
Received: from BL1PR13CA0347.namprd13.prod.outlook.com (2603:10b6:208:2c6::22)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 19:45:20 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::25) by BL1PR13CA0347.outlook.office365.com
 (2603:10b6:208:2c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 19:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:45:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:44:59 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:44:59 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:44:51 -0700
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
Subject: [PATCH v2 3/7] gpu: nova-core: read vGPU mode from FSP via PRC protocol
Date: Mon, 22 Jun 2026 22:43:49 +0300
Message-ID: <20260622194353.1308872-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260622194353.1308872-1-zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5b9b0e-44c0-4f75-8738-08ded096cadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|7416014|18002099003|22082099003|56012099006|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	CLVAb6cV5FsNE9UDL2k8EOfGD9n7xRPNrKHEmxvFc40UOXx01aGZRDoM4ZMb9IjcLwclCSyteRIfSKjsgaQYZMBBqnWMS0u4gpSXGhOwinrWV7pK3RK60XmhUcU2hXEebVNH+YxRNoecLBiKDiy+KOIfApZ0xNGPAKPxxBxJVvFed5l3oE4kQdXFrCw2NSJvVXpX2/eopCpja2q9xYbwuwLTPLHgCwnBmeNPu6ZdUQG99zNFRfeQ32DZ9ydOzj3gwVEpOXlQMp49AYRPtWHQ46H6nrGGFyKVDsLp+rp9crrLzfcj4QNPnE92KVqq7Ef8wvHVc/dWZhaszJiF9Nqev14cEEQbxMT7xxLUWSatq3jDrU5yMq6Rv29XrnjAhjShgzj7Ep5esLaThBJRU5+DwWXPDnaFKE6cR/Xp2Ztocg4gDGtfWmwd18QiHA1ch8k/LEgvcIxGL5v+qumf3alZ+AAqoGTre9izODHGuZwerZ0yY5rpOP4UGCAjCj06uiTxF83Ld/VH7IMI3XZpsO9C/IJCDiShTY7h2sGN+yW5uSPnwpVolC2FwJZ04zgXmQDV9KNauZTdilYdfo7Tvrj91wfDiq5kMl6ehFMWwe3a/tAPogIwXfcBgJXJIWdoETdkzcv21IBFxSTnejN+aMvurGKESb9Io7O/bqA2sT0spaGJNzEsemKXhsegmLRgzXEhmLZgbZrCRQ/q6NLL8ekf0A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TQwc5/DdbUZiWqUIVj8w0dieBqlUppge3opwGjWjUf21Y7g2E5JJdslCq/aZy7tQUCxHiKCkgMEKL1VLJZTkwGbTfF7iYBrDUAGTiXX2D71n7wF4kYuf/WbXEjPdav2EzkFREp47kPJw84rjOlvwitIAU7jaP1Abid9qJnu5Cn1YI3Ur3XRx1SfUGUxrL3LcgIJA6GTi6H18sI/eBVSa2gxzJQJyTbFz5+bnkfVYWgC/Cw27rGnAXEkgXf09FvQH5WFbHhwafBM8yt9Bow9eiFgo2XR0VXrJnqv3gmHPvBoPP3DRK80nevHfB+vR6WusPd9tq5XLhexKRBlhEIOrh6+rz32dBq3/+I/pgFzS64108X+yx6IomU/84rE9p3p8zCr17CAS4kfrtWETVvo7ohZN87MO63gXtUcPiYAzNlF8BXLEtgvSaB4qHzYMEOx8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:45:19.8286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5b9b0e-44c0-4f75-8738-08ded096cadb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326

Add support for querying the vGPU mode configuration from FSP using
the PRC (Product Reconfiguration Control) protocol. PRC is an API
system exposed through FSP's Management Partition that allows querying
device configuration "knobs" without firmware updates.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs  | 195 ++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/mctp.rs |   3 +
 2 files changed, 190 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 4b97d1fb505e..2bf01c2d1175 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -51,6 +51,56 @@
 
 mod hal;
 
+/// PRC message sub-command.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum PrcMessageSubcmd {
+    /// Read a PRC knob value.
+    Read = 0x0c,
+}
+
+impl From<PrcMessageSubcmd> for u8 {
+    fn from(value: PrcMessageSubcmd) -> Self {
+        value as u8
+    }
+}
+
+/// PRC object identifier.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum PrcObjectId {
+    /// vGPU mode configuration knob.
+    VgpuMode = 0x29,
+}
+
+impl From<PrcObjectId> for u8 {
+    fn from(value: PrcObjectId) -> Self {
+        value as u8
+    }
+}
+
+kernel::impl_flags!(
+    /// PRC request flags.
+    #[derive(Clone, Copy, Default, PartialEq, Eq)]
+    struct PrcFlags(u8);
+
+    /// Individual PRC request flag.
+    #[derive(Clone, Copy, PartialEq, Eq)]
+    enum PrcFlag {
+        /// Request the active knob value for the current boot.
+        Active = 1 << 1,
+    }
+);
+
+/// vGPU operating mode as reported by FSP via the PRC protocol.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum VgpuMode {
+    /// vGPU support is disabled on this GPU.
+    Disabled,
+    /// vGPU support is enabled on this GPU.
+    Enabled,
+}
+
 /// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -60,6 +110,62 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// PRC message payload.
+///
+/// Sent to FSP to query or modify a device configuration knob.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrc {
+    sub_message_id: u8,
+    flags: u8,
+    object_id: u8,
+    reserved: u8,
+}
+
+impl NvdmPayloadPrc {
+    /// Constructs a PRC payload from typed protocol fields.
+    fn new(subcmd: PrcMessageSubcmd, object_id: PrcObjectId, flags: PrcFlags) -> Self {
+        Self {
+            sub_message_id: subcmd.into(),
+            flags: flags.into(),
+            object_id: object_id.into(),
+            reserved: 0,
+        }
+    }
+}
+
+// SAFETY: NvdmPayloadPrc is a packed C struct with only integral fields.
+unsafe impl AsBytes for NvdmPayloadPrc {}
+
+/// PRC response payload containing the knob state value.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrcResponse {
+    value_low: u8,
+    value_high: u8,
+    reserved1: u8,
+    reserved2: u8,
+}
+
+impl NvdmPayloadPrcResponse {
+    /// Returns the PRC knob value as a little-endian 16-bit integer.
+    fn value(self) -> u16 {
+        u16::from(self.value_low) | (u16::from(self.value_high) << 8)
+    }
+}
+
+impl TryFrom<NvdmPayloadPrcResponse> for VgpuMode {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: NvdmPayloadPrcResponse) -> Result<Self> {
+        match value.value() {
+            0 => Ok(VgpuMode::Disabled),
+            1 => Ok(VgpuMode::Enabled),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
 /// Common MCTP and NVDM headers shared by all FSP messages.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -84,16 +190,27 @@ fn new(nvdm_type: NvdmType) -> Self {
     }
 }
 
-/// Complete FSP response structure with MCTP and NVDM headers.
+/// Common FSP response header with MCTP, NVDM and command response payloads.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-struct FspResponse {
+struct FspResponseHeader {
     header: FspMessageHeader,
     response: NvdmPayloadCommandResponse,
 }
 
-// SAFETY: FspResponse is a packed C struct with only integral fields.
-unsafe impl FromBytes for FspResponse {}
+// SAFETY: FspResponseHeader is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponseHeader {}
+
+/// Complete FSP PRC response including the knob state payload.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcResponse {
+    header: FspResponseHeader,
+    prc_data: NvdmPayloadPrcResponse,
+}
+
+// SAFETY: FspPrcResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspPrcResponse {}
 
 /// Trait implemented by types representing a message to send to FSP.
 ///
@@ -182,10 +299,35 @@ fn new<'a>(
 // bytes are initialized.
 unsafe impl AsBytes for FspCotMessage {}
 
+/// Complete FSP PRC message.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcMessage {
+    header: FspMessageHeader,
+    prc: NvdmPayloadPrc,
+}
+
+impl FspPrcMessage {
+    /// Constructs a PRC message.
+    fn new(subcmd: PrcMessageSubcmd, object_id: PrcObjectId, flags: PrcFlags) -> Self {
+        Self {
+            header: FspMessageHeader::new(NvdmType::Prc),
+            prc: NvdmPayloadPrc::new(subcmd, object_id, flags),
+        }
+    }
+}
+
+// SAFETY: FspPrcMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspPrcMessage {}
+
 impl MessageToFsp for FspCotMessage {
     const NVDM_TYPE: NvdmType = NvdmType::Cot;
 }
 
+impl MessageToFsp for FspPrcMessage {
+    const NVDM_TYPE: NvdmType = NvdmType::Prc;
+}
+
 /// Bundled arguments for FMC boot via FSP Chain of Trust.
 pub(crate) struct FmcBootArgs {
     chipset: Chipset,
@@ -272,10 +414,11 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) ->
             dev_err!(dev, "FSP response error: {:?}\n", e);
         })?;
 
-        let (response, _) = FspResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
-            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
-            EIO
-        })?;
+        let (response, _) =
+            FspResponseHeader::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+                dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+                EIO
+            })?;
 
         let mctp_header = response.header.mctp_header;
         let nvdm_header = response.header.nvdm_header;
@@ -323,6 +466,42 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) ->
         Ok(response_buf)
     }
 
+    /// Reads the active vGPU mode from FSP using the PRC protocol.
+    ///
+    /// Queries FSP's Management Partition for the active vGPU mode knob value.
+    #[expect(dead_code)]
+    pub(crate) fn read_vgpu_mode(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar: Bar0<'_>,
+    ) -> Result<VgpuMode> {
+        let msg = KBox::new(
+            FspPrcMessage::new(
+                PrcMessageSubcmd::Read,
+                PrcObjectId::VgpuMode,
+                PrcFlags::from(PrcFlag::Active),
+            ),
+            GFP_KERNEL,
+        )?;
+
+        let response_buf = self.send_sync_fsp(dev, bar, &*msg)?;
+        let (prc_response, _) =
+            FspPrcResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+                dev_err!(dev, "PRC response too small: {}\n", response_buf.len());
+                EIO
+            })?;
+
+        let prc_data = prc_response.prc_data;
+
+        VgpuMode::try_from(prc_data).inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Unexpected vGPU mode value: {:#x}\n",
+                prc_data.value()
+            );
+        })
+    }
+
     /// Boots GSP FMC via FSP Chain of Trust.
     ///
     /// Builds the CoT message from the pre-configured [`FmcBootArgs`], sends it
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 482786e07bc7..b203c632bf20 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -13,6 +13,8 @@
 #[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
 #[repr(u8)]
 pub(crate) enum NvdmType {
+    /// PRC (Product Reconfiguration Control) message.
+    Prc = 0x13,
     #[default]
     /// Chain of Trust boot message.
     Cot = 0x14,
@@ -25,6 +27,7 @@ impl TryFrom<u8> for NvdmType {
 
     fn try_from(value: u8) -> Result<Self, Self::Error> {
         match value {
+            x if x == u8::from(Self::Prc) => Ok(Self::Prc),
             x if x == u8::from(Self::Cot) => Ok(Self::Cot),
             x if x == u8::from(Self::FspResponse) => Ok(Self::FspResponse),
             _ => Err(value),
-- 
2.51.0

