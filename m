Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C3F39E164
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887275; cv=fail; b=LOVnYFMBfFx2TzhIQHox4cvAOBDPFch35qqCMy6lYqN/yN9LPZohvTrtZrdh8JLIk34Af1NU3hfDqwPF1PBGCCWjH4BUeZkrPn4WVA8OK9QRKQNDPjcMcd3YlfGdVtXUiVAV1Xt+q1VxIt/lKrj1l0sIfKpT2CcJINa+xkCKRq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887275; c=relaxed/simple;
	bh=A9e8YKw2KMnp5ym1zP9Zqg9YJy20ojZYq2a+BMmv4ow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W23eMD6kdu2IdemrTYksrje1SHaWiwbRGYwJsZC3u+n8BonxDcgz6JRUeScG0ctGU+f5UwzN/812YaY2JLnpEhMKksJ8iickQalRQ58RKOrZlmwXX9HUxDQ/9nQ6Gw/bp87SXmfTG5PbUjyjsLaBOe2KEpLzZr6rAtSIi/9I1Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n4cPlVpA; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n4cPlVpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbwVhingFzFSta5qaswejIIlYcMHz1PvqalI5IB2OndY1eimUGI60Ps3CwMGLiAw0+GTiFz0wy2fB0ErUpya5aQ3Cgn/MYNArb/6AD5pUt1xRBgSHkkXrc6C2TIAGj4P2mfmidWKPVKi36WZDVyTv0sg/cvvcfW2aMR0tswWqpb6BGqeHQSNTRgbHtXWE/Fcdiv83zYwgo1frfGTI3Tx+nkGQohzTJaKXHWUNRG2W4KG+rvhZruDy+z++b6gJBNNnOwG3nTuL4ezrjU7qpSDZCBABpz1tGAkIhPzDixHkBm6bcGGlhLHfOuG8agJK7wi5NqGGjkoza+hhGzwws8jpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDXH0Y9UmdnuCYnf83WaPeh5HfAHAIIrUHfrR9QTW4I=;
 b=TOyWhCf254w/ZT4SSr4CWJW6TY4u5ih75g+Viz8gxG0HmOKNOPY6xLgDwu+DVTRwqYR9b+pqDC7ps6/BBdVB+qx5iP1XLT+c2iX/dbRHKN1Ya58hZ+H79+DgvhmUTk0PZD5u/yWebW4IT4thPAvUTGgUL66rrPXYjQwWQjcxDR6xr4e8o3RRTpOORUcSvpNeUxYuxise89+iIp8U8PuAsaw49D6jWR2SsHUsRMXjXuN5qkAE/0C1SoFXvKcPtwww6PBWr4e6r896X+rQ8HeyvNxzidRfQgKnjRFyQIDuwoOooVGhjpkqu7Vkc84FJ+bUR2SJaQuWDxT3kq2j4fO2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDXH0Y9UmdnuCYnf83WaPeh5HfAHAIIrUHfrR9QTW4I=;
 b=n4cPlVpAnU72WAnmssTBFCMzb6rvcA6zdqZNNGn/72eGbDzJ/ipvfLvOhAudVyrQzuJAQ2eNYNL5V+ySdHgW7cs9JJ++JKahmuuChjO+Ne7G0gIYwvPTqqLLmDcmp4QKeJb3fpMi9eHGXogpm81Ocf87t62WZfo4X35KSpCd3szY6ULuDNppDJntnR+prkdCk+8pMtq85B+U3x4TnEb1xZC9/0HU7/EFyAfmveC8a2ilL94XMntzf1xrL7KXx+xL5ZCIUOyFfpsrbi2+F/xXHDhLnaF4VkTfCuZl7SlzMX7C1gV9lSYGvzlIZ5atFHF3Bxm4U664o9ESrXn3PvhiIA==
Received: from MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::15)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 06:27:46 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::a5) by MW4P222CA0010.outlook.office365.com
 (2603:10b6:303:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:27:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:27:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:22 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:21 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:12 -0700
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
Subject: [PATCH v3 4/8] gpu: nova-core: read vGPU mode from FSP via PRC protocol
Date: Wed, 1 Jul 2026 09:26:18 +0300
Message-ID: <20260701062622.3499033-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701062622.3499033-1-zhiw@nvidia.com>
References: <20260701062622.3499033-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3d0f5f-de3f-435e-1dc1-08ded739dd4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|6133799003|18002099003|11063799006|3023799007|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NioSjFoZbqehdmZRyZWeynwGs4sbCfNroR3ENOsiBsQpaY7wAkgY1j/WbjLHAzH/EtwhZjN6uV8UNLFfPf5QwYuT/v2xd7Xm7k1r0nei0vIzIoiH3JtYwuo2DWgN6MouoUK9odTcPXfr2TEQ5ljtHQvDgAyY/ki7mhB/hdB3yEJneE78ceiq/6bnE7l55KTB6cyAtGZWMppUrz0tZq21n64KfVFmFf36GyJQTN6J/2YvvHcOMUeBYcAOOPpAqbS3d89D17vI/PkTwWWVpv6T/2dWWF4BAL4h1+1tM/79pxGgBdtSakkb4LCmfQzlbo1nQ51Yo4ZiP/1zJYiiWlwn3jS//pKEaSqrgp/6xy69PbhbCpbpyS4uBR8BExXpOcy0O07v+kKqsVoKDljl7YDeZBFZOiVEF8ERHNw3MKWqOWF3r9LJ05pspAxQvRt98FUiAcbLilGgQiawxLWpDH1kHRh/hQIjVIltggR9Cb/QMnX7JvN0nf4N5f7c1+Y2hP9A4U2ccPhAalzOIXCUsw1eyAh7NzmKC4VMEq2jeRBAl+X9iW7v87wqCHUbjL71aybsdsoJZkuKqQXKrFSFjZ4xkY/e3oHr1Lagoqy90fWPXDIsguJMjr9+OqLW8oeZNbd0yMice8QlMReN/po/6SSAg+c5u2DDU9meYYDpnJ4Xumh8fPMwAI3BVKJ5H0QoZCYT/So/j/uWrt/GwNDvIkpp0Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(6133799003)(18002099003)(11063799006)(3023799007)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c6KSFfpC/Gn4wnZN/dD9HygVFo15D1EGV6p/mO87jVLf5grcLzEcZzArSMVpSCz1kugMYoI1fju3+ym36rmGU0JihUnee+RSBANmi++fl/Oni1fbuQpL9v34sPEyw1Bs5FXip0lw+g2dsarg+nM+CfzYV298r2lL/LEYriHod4NAjF3KGntqAHj/+MtqQge3i09qiGIELWe3j3CogbWqQdaXAW146p4dx4qdiaQWWnKBinVE4L3zfcgKapbDsa40c2lE9g9Wsk1v22Viq0cBethlFeYxzntCokblTwoaMsBTaegpza8QjsbA90dwK3f7Py5nkpx48lku98UQdQ9OioqXDtPPqlAa+LY4hOsIAcDSxPUstNncxLwWMLyWpOcBk30X26bR/quxAtLBR15vKSe5TIbuFlrsJhN8Aar1IKXjySwZk8hWtMvpJhLtoJSo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:27:45.6080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3d0f5f-de3f-435e-1dc1-08ded739dd4b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855

vGPU boot needs to know whether firmware reports vGPU mode as active.

FSP's Management Partition exposes PRC (Product Reconfiguration Control)
as an API for reading device configuration knobs without firmware
updates. The vGPU mode knob is one such configuration value.

Add typed PRC request and response payloads for the vGPU mode object,
add the PRC NVDM type, and parse the returned knob value into VgpuMode.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs  | 173 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs |   3 +
 2 files changed, 176 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index a555c5290baa..52eeee82f75e 100644
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
@@ -95,6 +201,17 @@ struct FspResponseHeader {
 // SAFETY: FspResponseHeader is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponseHeader {}
 
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
+
 /// Trait implemented by types representing a message to send to FSP.
 ///
 /// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
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
@@ -324,6 +466,37 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
         Ok(response_buf)
     }
 
+    /// Reads the active vGPU mode from FSP using the PRC protocol.
+    ///
+    /// Queries FSP's Management Partition for the active vGPU mode knob value.
+    #[expect(dead_code)]
+    pub(crate) fn read_vgpu_mode(
+        &mut self,
+        dev: &device::Device<device::Bound>,
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
+        let response_buf = self.send_sync_fsp(dev, &*msg)?;
+        let (prc_response, _) =
+            FspPrcResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+                dev_err!(dev, "PRC response too small: {}\n", response_buf.len());
+                EIO
+            })?;
+
+        let prc_data = prc_response.prc_data;
+
+        VgpuMode::try_from(prc_data).inspect_err(|_| {
+            dev_err!(dev, "Unexpected vGPU mode value: {:#x}\n", prc_data.value());
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

