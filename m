Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B3328610
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609411; cv=fail; b=J/B6jkBelYdE+Zlyif0j+25wVkL7fR2H4Cdm066uYnBrZBFCQu/7IhTH662O/sc1boS8Lxx7WBWJTROpVeeMfTJgSOKUeKOX8BLrGxmJEPxrj6dClzeXzDUdnqNQyDJjQI7gnw25NikfbgpTA9En80GtQWkwmJqDqqmZWsV0+TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609411; c=relaxed/simple;
	bh=4oeV3X088dgp12ElfbrG14kwo7Z+0WPam9+uqnnMpLY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZIFHo+Zv6U8Eo+XIeUjSDh5Vn2PifPob547RG0Bq3T1PmBBSqaZmoTc/OW8jElplyfnaqw85A4lAMRPq86nmY9CyzVBMgOm6gNnQrznHjCsae8VdcOizMqyQodfWn4l4gfJv0/35qgZd3TqpoJiMPfC1FVSzx3jT/sUYydMinu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BYtF84XF; arc=fail smtp.client-ip=52.101.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BYtF84XF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry31TIdmvW/UoK6PbA9ztpAdssgz4Au82KJ2xAYa9eq4MVAcIGT6qFOsabh1lhxbGavVB8b6tCGGtgUokdXXlGk+q4ZwgmnZH4fdj8vmX62GPtSoqx2TqEMHUVvHie2gsC9pa4K4rv/Ag356T3sdjYpw09Cr8vcbcrgoBGoaWa5JxbxUfjccu3Sb932tY2SKR/wu589KWpVvJ99fq6F+TO4MmToKQT2Uf6ALWlInzz9GFDnsOFprYMeVmnVLFaSMGh36D6b9n5WYJuPs58tL5RtifSgritq8KJQlTVr0sRYLAHltufo+Eq8EGPpKpPNKcdYEi3PntfYGtUfhJeK0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB3AGomE+vGMigPpatTJlK/+P8VfOm/nqLRcjUGhByQ=;
 b=Qu/FUqTu3DZCuLeiLcP9ezJfqzxvX2lySwqY2SXqqGrjLTb2aSuXcOJKzlPJQTe+7iFIPFJPWU5IpshMEu6XGT1AMAIu2A2IityxHywBnPw8eun6sbxc4vVO9CFAmfLOIKSenQ0+zVE8PQq1XShR2KNrH5piSHg7kyBXglgJ2z6z2JRqCxddOGYcY4e+mT9F3HB6NWGWaN4FN5uWZPVmwQCGeqNA4Wu7B1OqtuBQe9GiUnf9LmxJiC1rshg/C8r8s7I1V/xcb8epyFMnyF20mTnpYofMJoKAH2KikAsSHYumZ0c9BeQygOGeNDWKRTue25kIB7Q2PhTxQL+PPE9hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB3AGomE+vGMigPpatTJlK/+P8VfOm/nqLRcjUGhByQ=;
 b=BYtF84XFRgkie+YyyXiJ/TU3wiPxHicQefW0ze7Or/u0EeEz1jdz4xCqr3Cto2cB4ia5xKRkKqtKudZxeWSvWkRD0ynH8EYmW7QAHbCTQJSv8h+gfZOTOMol7ZSFfS06Lqrm8VxwdaWTMY+atYlSpp9yD3xaBG8XPDRP/tXCaJ1W6W3CJfD/nfO8iHjK/XasXkQtuAJ+ZqMBfGqdV2ljPmjnIgRV41fFwV4Zn6e96j++8AWKpcVNKMqce1H9CTW6mQTt8TGrrKZIk7mvN2JmRn0UcIIQxiqf8DGLNxODzRe5zzPWUui9YfnBhad2wgddtv2fQi/RHvj5CvT4d+SrLQ==
Received: from PH8PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:2cf::25)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 15:03:13 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::7b) by PH8PR07CA0027.outlook.office365.com
 (2603:10b6:510:2cf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Thu, 9
 Jul 2026 15:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 15:03:11 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 08:02:37 -0700
Received: from inno-dell.vdiclient.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 08:02:31 -0700
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
Subject: [PATCH v4 3/6] gpu: nova-core: read vGPU mode from FSP via PRC protocol
Date: Thu, 9 Jul 2026 18:02:03 +0300
Message-ID: <20260709150206.1046839-4-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ba7bae-da46-4ed7-0c59-08deddcb31e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|11063799006|6133799003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CNzUs1DHFdIzzPOmxE5kJLtj7o5tTT2xt1A6ctBezxLi0pKicRRKH105NG2DLoMeHQQIE8iyGqkiKpOs2WJfmDtqK3geROWoPxlQGoiUEMANnWR9WvoWLZ9xahdd1AmfNRFGKjQphF1XUX0Zfy2qtGoYdDvMLNXpq4Urp89uk9uOCi2c//J0ZoHB4HsPb5yH17Zd5O9oqG8DBgBUqJoyJ3OoZT/uk+QTiBSooNRz9pnpRQdvvJpLBr1GKWV0AWU1CHR1pBnteytaGddIzztBdLN/Q5QaP8xZNmXTQ1+1bIBLXD0v3HVvabnCex0oU03T42N2SEmfHeHsEDWN6LbWjZjoTsgyPlE9MI6nQ1HNUgefpGYVuY05QlCOBFvUJjVCJIb45dJB0fKe6lY038Dy+9n1FET6vYxkJV9YFk9/7Xdwj4cQYUUZAx9KR5akr7yZpPHFsyHz1RE5TwtG/yyOU9G7Vknf0HxZVJmjl93k+hqH5UKwbuTcat7BBxLeOG6JcYu083noiiHCoaMAa340W0DVmfQLxoynYJiUN2wfIoz2pIOr+ZeJno1Y8Yu5lLLfEb0kwqdnQc+hsZIiHpTj0m4mhAxaMmBTVUe0Y1BKwQY8urDZ5j5PXd/Bh7Gv2ze6ggLnqWd378C7QMV2eWLVfw2guhh+yq1BSyQQwE/vnnYJPsyKwhdbekIzPz9eY9q9FiSBtX2hj/9M7+nQN+nNQg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qTXDQmB5fVmQhlT5RW3nFIGJ6KnZiEYkJ/vJYPR+64jpVYyVM5N7yXgTqIJb/9JI2zlzu9+FCtUTBW7qruuTVpeoVHFQ1cu/Egr9Ol30ZYqt2HgYZjV9zhR1wgR3AW6D21hJep5otuTPZxIV937FiGbQBi4bzhAzhk+H81MPyuCwRAlxn0r5zkD9Znc4UHPQvPrqRU9GcN5uzmuklXrHPbrOnvxwKdiPbFz/p4BtOlidmKnL82bdRdFHnLoAM7PdSQQP8C+o4y6Ax/7WAm9FzwQBRlw0ar0UYvhE+JZfXEZylw0X8EO9ji+NCI4w9YGEb5RaVRxInCPi1gqTtJu6R+5VhkuhVr0JuL6ufjIeIqIVGJ/QaKWx0zJvuKQ1sCRdOQ/B9KpEUf+mkOc5bNzo84IfEIs3BNS4wBVj0OlEGgvx/KSqXeVMUJ87urDQTfW0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:03:11.7018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ba7bae-da46-4ed7-0c59-08deddcb31e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

vGPU boot needs to know whether firmware reports vGPU mode as active.

FSP's Management Partition exposes PRC (Product Reconfiguration Control)
as an API for reading device configuration knobs without firmware
updates. The vGPU mode knob is one such configuration value.

Add typed PRC request and response payloads for the vGPU mode object,
add the PRC NVDM type, and parse the returned knob value into VgpuMode.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs  | 173 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs |   2 +
 2 files changed, 175 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index afbd75879d16..3a6b02f0dc11 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -52,6 +52,56 @@
 
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
@@ -61,6 +111,62 @@ struct NvdmPayloadCommandResponse {
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
@@ -96,6 +202,17 @@ struct FspResponseHeader {
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
@@ -183,10 +300,35 @@ fn new<'a>(
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
@@ -342,6 +484,37 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
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
index acc2abbd4b0c..90c642c91a72 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -22,6 +22,8 @@
     /// NVDM message type identifiers carried over MCTP.
     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
     pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
+        /// PRC (Product Reconfiguration Control) message.
+        Prc = 0x13,
         /// Chain of Trust boot message.
         Cot = 0x14,
         /// FSP command response.
-- 
2.51.0

